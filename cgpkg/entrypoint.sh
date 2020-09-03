#!/bin/bash
#set -x

domain=${1:-}
nusers=${2:-100}
serial=${3:-$SERIAL}

acu=$((40000000 + serial))
pnu=$(printf '%08d' "$nusers")

if [ -z "$domain" ]; then
    echo "usage: docker run cgpkg DOMAIN N_USERS [SERIAL]"
    exit 1
fi

# keep module loaded for future use
#trap 'rmmod darling-mach ||:' EXIT

if ! lsmod |grep -Eq ^darling_mach; then
    echo "! installing module ..."
    apt-get -qqy update
    apt-get -qqy install "linux-headers-$(uname -r)"
    dkms install -m darling-mach -v "$VER"
    modprobe darling-mach || exit 1
    echo "! running generator ..."
fi 1>&2

cgpkg() {
  "${DYLD_ROOT_PATH}${DYLD_ROOT_PATH}/vchroot" \
    "$DYLD_ROOT_PATH" \
    /bin/cgpkg
}

{
  cgpkg <<EOF
Master $serial $domain
License 4899 ACNT $acu $pnu
Quit
EOF
} 2>&1 |
  tail -n +9 |                          # skip help
  grep -Ev '^(Enter .*|)$' |            # drop prompts
  sed -re 's/([0-9]) ([0-9])/\1\2/g' |  # merge digits
  sed -e 's/^/+ /'                      # prepend marker

# end
