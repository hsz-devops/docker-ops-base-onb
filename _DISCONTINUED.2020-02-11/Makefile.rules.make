# .ONESHELL:
.SHELLFLAGS = -e

# --------------------------------------------------------------------------
r--build-base-alpine-%: check-env-base
	cd $(THIS_DIR)src.base ;\
	docker build $(BUILD_CACHE) -f Dockerfile.alpine$* \
			-t $(DH_ID_base):alpine$* \
			-t $(DH_ID_base):alpine$*-${TAG_VERSION} \
			. \
		| tee /tmp/docker-ops-base-onb.alpine-$*.log \
		;\

r--build-base-deb-%: check-env-base
	cd $(THIS_DIR)src.base ;\
	docker build $(BUILD_CACHE) -f Dockerfile.deb$* \
			-t $(DH_ID_base):deb$* \
			-t $(DH_ID_base):deb$*-${TAG_VERSION} \
			. \
		| tee /tmp/docker-ops-base-onb.deb-$*.log \
		;\

r--build-base-ubuntu-%: check-env-base
	cd $(THIS_DIR)src.base ;\
	docker build $(BUILD_CACHE) -f Dockerfile.$* \
			-t $(DH_ID_base):$* \
			-t $(DH_ID_base):$*-${TAG_VERSION} \
			. \
		| tee /tmp/docker-ops-base-onb-base.ubuntu-$*.log \
		;\

# --------------------------------------------------------------------------
r--push-base-alpine-%:
	docker push $(DH_ID_base):alpine$*
	docker push $(DH_ID_base):alpine$*-${TAG_VERSION}

r--push-base-deb-%:
	docker push $(DH_ID_base):deb$*
	docker push $(DH_ID_base):deb$*-${TAG_VERSION}

r--push-base-ubuntu-%:
	docker push $(DH_ID_base):$*
	docker push $(DH_ID_base):$*-${TAG_VERSION}

# --------------------------------------------------------------------------
r--push-base-alpine-%:
	docker push $(DH_ID_base):alpine$*
	docker push $(DH_ID_base):alpine$*-${TAG_VERSION}

r--push-base-deb-%:
	docker push $(DH_ID_base):deb$*
	docker push $(DH_ID_base):deb$*-${TAG_VERSION}

r--push-base-ubuntu-%:
	docker push $(DH_ID_base):$*
	docker push $(DH_ID_base):$*-${TAG_VERSION}

# --------------------------------------------------------------------------
r--pull-base-alpine-%:
	docker pull $(DH_ID_base):alpine$*
	docker pull $(DH_ID_base):alpine$*-${TAG_VERSION}

r--pull-base-deb-%:
	docker pull $(DH_ID_base):deb$*
	docker pull $(DH_ID_base):deb$*-${TAG_VERSION}

r--pull-base-ubuntu-%:
	docker pull $(DH_ID_base):$*
	docker pull $(DH_ID_base):$*-${TAG_VERSION}


# --------------------------------------------------------------------------
r--shell-base-alpine-%:
	docker run -it --rm $(DH_ID_base):alpine$* bash

r--shell-base-deb-%:
	docker run -it --rm $(DH_ID_base):deb$* bash

r--shell-base-ubuntu-%:
	docker run -it --rm $(DH_ID_base):$* bash

r--shell-base-alpine%-tag:
	docker run -it --rm $(DH_ID_base):alpine$*-${TAG_VERSION} bash

r--shell-base-deb-%-tag:
	docker run -it --rm $(DH_ID_base):deb$*-${TAG_VERSION} bash

r--shell-base-ubuntu-%-tag:
	docker run -it --rm $(DH_ID_base):$*-${TAG_VERSION} bash

# --------------------------------------------------------------------------
r--test-base-alpine-%:
	@echo "#############################################"
	@echo "$*"
	@echo ""
	docker run -it --rm $(DH_ID_base):alpine$*

r--test-base-deb-%:
	@echo "#############################################"
	@echo "$*"
	docker run -it --rm $(DH_ID_base):deb$*

r--test-base-ubuntu-%:
	@echo "#############################################"
	@echo "$*"
	docker run -it --rm $(DH_ID_base):$*

