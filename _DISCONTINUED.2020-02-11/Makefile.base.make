# v2.6.0    2020-01-26     webmaster@kit-ar.com
# v2.2.0    2018-03-04     webmaster@highskillz.com

# .ONESHELL:
.SHELLFLAGS = -e

DH_ID_base=ez123/ops-base-onb

# --------------------------------------------------------------------------
dc-clean-ours-only:
	docker images --filter=reference="ez123/ops-base*:*"
	docker rm  $$(docker ps -a -q)                                           ||true
	docker rmi -f $$(docker images -q -f dangling=true)                      ||true
	docker rmi -f $$(docker images -q --filter=reference="$(DH_ID_base)*:*") ||true

# --------------------------------------------------------------------------
check-env-base:
	test -n "$(TAG_VERSION)"   # TAG_VERSION.base
	test -n "$(TIMESTAMP)"     # TIMESTAMP.base

# --------------------------------------------------------------------------
build-base: build-base-alpine
build-base: build-base-ubuntu
build-base: build-base-deb


build-base-alpine: build-base-alpine-edge
build-base-alpine: build-base-alpine-311-ans29-py38
build-base-alpine: build-base-alpine-311-ans29
build-base-alpine: build-base-alpine-311-ans27
#build-base-alpine: build-base-alpine-310-ans28
#build-base-alpine: build-base-alpine-39-ans28
build-base-alpine: build-base-alpine-38-ans27
#build-base-alpine: build-base-alpine-38
#build-base-alpine: build-base-alpine-37
build-base-alpine: build-base-alpine-34-ans27
#build-base-alpine: build-base-alpine-34-ans22


build-base-alpine-edge:           r--build-base-alpine-edge
build-base-alpine-311-ans29-py38: r--build-base-alpine-311-ans29-py38
build-base-alpine-311-ans29:      r--build-base-alpine-311-ans29
build-base-alpine-311-ans27:      r--build-base-alpine-311-ans27
# build-base-alpine-310-ans28:      r--build-base-alpine-310-ans28
# build-base-alpine-39-ans28:       r--build-base-alpine-39-ans28
build-base-alpine-38-ans27:       r--build-base-alpine-38-ans27
# build-base-alpine-38:             r--build-base-alpine-38
# build-base-alpine-37:             r--build-base-alpine-37
build-base-alpine-34-ans27:       r--build-base-alpine-34-ans27
# build-base-alpine-34-ans22:       r--build-base-alpine-34-ans22

build-base-deb: build-base-deb-10-ans29-py37

build-base-deb-10-ans29-py37:    r--build-base-deb-10-ans29-py37

build-base-ubuntu: build-base-ubuntu-1804-ans29
build-base-ubuntu: build-base-ubuntu-1804-ans27
build-base-ubuntu: build-base-ubuntu-1604-ans27
# build-base-ubuntu: build-base-ubuntu-1604-ans26
# build-base-ubuntu: build-base-ubuntu-1404

build-base-ubuntu-1804-ans29:    r--build-base-ubuntu-1804-ans29
build-base-ubuntu-1804-ans27:    r--build-base-ubuntu-1804-ans27
build-base-ubuntu-1604-ans27:    r--build-base-ubuntu-1604-ans27
# build-base-ubuntu-1604-ans26:    r--build-base-ubuntu-1604-ans26
# build-base-ubuntu-1404:          r--build-base-ubuntu-1404

# --------------------------------------------------------------------------
pull-base: pull-base-alpine pull-base-deb pull-base-ubuntu

pull-base-alpine: check-env-base r--pull-base-alpine-edge
pull-base-alpine: check-env-base r--pull-base-alpine-311-ans29-py38
pull-base-alpine: check-env-base r--pull-base-alpine-311-ans29
pull-base-alpine: check-env-base r--pull-base-alpine-311-ans27
# pull-base-alpine: check-env-base r--pull-base-alpine-310-ans28
# pull-base-alpine: check-env-base r--pull-base-alpine-39-ans28
pull-base-alpine: check-env-base r--pull-base-alpine-38-ans27
# pull-base-alpine: check-env-base r--pull-base-alpine-38
# pull-base-alpine: check-env-base r--pull-base-alpine-37
pull-base-alpine: check-env-base r--pull-base-alpine-34-ans27
# pull-base-alpine: check-env-base r--pull-base-alpine-34-ans22

pull-base-deb: check-env-base r--pull-base-deb-10-ans29-py37

pull-base-ubuntu: check-env-base r--pull-base-ubuntu-1804-ans29
pull-base-ubuntu: check-env-base r--pull-base-ubuntu-1804-ans27
pull-base-ubuntu: check-env-base r--pull-base-ubuntu-1604-ans27
# pull-base-ubuntu: check-env-base r--pull-base-ubuntu-1604-ans26
# pull-base-ubuntu: check-env-base r--pull-base-ubuntu-1404

# --------------------------------------------------------------------------
push-base: push-base-alpine
push-base: push-base-deb
push-base: push-base-ubuntu

push-base-alpine: check-env-base r--push-base-alpine-edge
push-base-alpine: check-env-base r--push-base-alpine-311-ans29-py38
push-base-alpine: check-env-base r--push-base-alpine-311-ans29
push-base-alpine: check-env-base r--push-base-alpine-311-ans27
# push-base-alpine: check-env-base r--push-base-alpine-310-ans28
# push-base-alpine: check-env-base r--push-base-alpine-39-ans28
push-base-alpine: check-env-base r--push-base-alpine-38-ans27
# push-base-alpine: check-env-base r--push-base-alpine-38
# push-base-alpine: check-env-base r--push-base-alpine-37
push-base-alpine: check-env-base r--push-base-alpine-34-ans27
# push-base-alpine: check-env-base r--push-base-alpine-34-ans22

push-base-deb: check-env-base r--push-base-deb-10-ans29-py37

push-base-ubuntu: check-env-base r--push-base-ubuntu-1804-ans29
push-base-ubuntu: check-env-base r--push-base-ubuntu-1804-ans27
push-base-ubuntu: check-env-base r--push-base-ubuntu-1604-ans27
# push-base-ubuntu: check-env-base r--push-base-ubuntu-1604-ans26
# push-base-ubuntu: check-env-base r--push-base-ubuntu-1404

# --------------------------------------------------------------------------
shell-base-alpine: shell-base-alpineedge

shell-base-alpine-edge:           r--shell-base-alpine-edge
shell-base-alpine-311-ans29-py38: r--shell-base-alpine-311-ans29-py38
shell-base-alpine-311-ans29:      r--shell-base-alpine-311-ans29
shell-base-alpine-311-ans27:      r--shell-base-alpine-311-ans27
# shell-base-alpine-310-ans28:      r--shell-base-alpine-310-ans28
# shell-base-alpine-39-ans28:       r--shell-base-alpine-39-ans28
shell-base-alpine-38-ans27:       r--shell-base-alpine-38-ans27
# shell-base-alpine-38:             r--shell-base-alpine-38
# shell-base-alpine-37:             r--shell-base-alpine-37
shell-base-alpine-34-ans27:       r--shell-base-alpine-34-ans27
# shell-base-alpine-34-ans22:       r--shell-base-alpine-34-ans22

shell-deb:                        shell-base-deb-10-ans29-py37
shell-base-deb-10-ans29-py37:     r--shell-base-deb-10-ans29-py37

shell-ubuntu:                     shell-base-ubuntu
shell-base-ubuntu:                shell-base-ubuntu-1804-ans29
shell-base-ubuntu-1804-ans29:      r--shell-base-ubuntu-1804-ans29
shell-base-ubuntu-1804-ans27:      r--shell-base-ubuntu-1804-ans27
shell-base-ubuntu-1604-ans27:      r--shell-base-ubuntu-1604-ans27
# shell-base-ubuntu-1604-ans26:      r--shell-base-ubuntu-1604-ans26
# shell-ubuntu1404-base:           r--shell-base-ubuntu-1404

# --------------------------------------------------------------------------
# TEST_TAG=-181112c

# --------------------------------------------------------------------------
test-alpine:             test-base-alpine
test-base-alpine:        test-base-alpine-edge
test-base-alpine:        test-base-alpine-311-ans29-py38
test-base-alpine:        test-base-alpine-311-ans29
test-base-alpine:        test-base-alpine-311-ans27
# test-base-alpine:        test-base-alpine-310-ans28
# test-base-alpine:        test-base-alpine-39-ans28
test-base-alpine:        test-base-alpine-38-ans27
# test-base-alpine:        test-base-alpine-38
# test-base-alpine:        test-base-alpine-37
test-base-alpine:        test-base-alpine-34-ans27
# test-base-alpine-ans22:  test-base-alpine-34-ans22

test-base-alpine-edge:           r--test-base-alpine-edge$(TEST_TAG)
test-base-alpine-311-ans29-py38: r--test-base-alpine-311-ans29-py38$(TEST_TAG)
test-base-alpine-311-ans29:      r--test-base-alpine-311-ans29$(TEST_TAG)
test-base-alpine-311-ans27:      r--test-base-alpine-311-ans27$(TEST_TAG)
# test-base-alpine-310-ans28:      r--test-base-alpine-310-ans28$(TEST_TAG)
# test-base-alpine-39-ans28:       r--test-base-alpine-39-ans28$(TEST_TAG)
test-base-alpine-38-ans27:       r--test-base-alpine-38-ans27$(TEST_TAG)
# test-base-alpine-38:             r--test-base-alpine-38$(TEST_TAG)
# test-base-alpine-37:             r--test-base-alpine-37$(TEST_TAG)
test-base-alpine-34-ans27:       r--test-base-alpine-34-ans27$(TEST_TAG)
# test-base-alpine-34-ans22:       r--test-base-alpine-34-ans22$(TEST_TAG)

# --------------------------------------------------------------------------
test-deb:                        test-base-deb
test-base-deb:                   test-base-deb-10-ans29-py37
test-base-deb-10-ans29-py37:     r--test-base-deb-10-ans29-py37$(TEST_TAG)

# --------------------------------------------------------------------------
test-ubuntu:                     test-base-ubuntu
test-base-ubuntu:                test-base-ubuntu-1804-ans29
test-base-ubuntu:                test-base-ubuntu-1804-ans27
test-base-ubuntu:                test-base-ubuntu-1604-ans27
# test-base-ubuntu:                test-base-ubuntu-1604-ans26
# test-base-ubuntu:                test-ubuntu1404-base

test-base-ubuntu-1804-ans29:      r--test-base-ubuntu-1804-ans29$(TEST_TAG)
test-base-ubuntu-1804-ans27:      r--test-base-ubuntu-1804-ans27$(TEST_TAG)
test-base-ubuntu-1604-ans27:      r--test-base-ubuntu-1604-ans27$(TEST_TAG)
# test-base-ubuntu-1604-ans26:      r--test-base-ubuntu-1604-ans26$(TEST_TAG)
# test-ubuntu1404-base:            r--test-base-ubuntu-1404$(TEST_TAG)

