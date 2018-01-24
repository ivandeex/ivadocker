
# last working version is 1.8.1.2
# since 10.1.2 project switched to the DiskO protocol introducing errors
VERS=1.8.1.2

VERS_MINOR := $(shell echo $(VERS) | cut -f2 -d.)
MINOR_GT_6 := $(shell [ $(VERS_MINOR) -gt 6 ] && echo true)

ifeq ($(MINOR_GT_6),true)
  WDMRC_VERS=$(VERS)
  WDMRC_PREF=WebDAVCloudMailRu-
  WDMRC_SUFF=-dotNet45
else
  WDMRC_VERS=$(VERS)
  WDMRC_PREF=WebDavMailRuCloud_
  WDMRC_SUFF=
endif

all: xenial slothds

xenial slothds:
	docker build \
		-t ivandeex/wdmrc:$@ \
		-f Dockerfile.$@ \
		--build-arg WDMRC_VERS=$(WDMRC_VERS) \
		--build-arg WDMRC_PREF=$(WDMRC_PREF) \
		--build-arg WDMRC_SUFF=$(WDMRC_SUFF) \
		.

