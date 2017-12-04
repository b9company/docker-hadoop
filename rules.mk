# Boilerplate
p := $(p).x
dirstack_$(p) := $(d)
d := $(dir)

# Local rules and targets
ifndef HADOOP_VERSION
$(error HADOOP_VERSION is undefined)
endif

DOCKER_IMAGE_$(d) := b9company/hadoop
DOCKER_TAG_$(d) := $(HADOOP_VERSION)

BUILD := $(BUILD) build_$(d)
PUSH := $(PUSH) push_$(d)

build_$(d): DOCKER_IMAGE := $(DOCKER_IMAGE_$(d))
build_$(d): DOCKER_TAG := $(DOCKER_TAG_$(d))
build_$(d): DOCKER_CONTEXT := $(d)
build_$(d): HADOOP_MIRROR := http://apache.crihan.fr/dist/hadoop/common
build_$(d): $(d)/Dockerfile
	docker build \
		--build-arg HADOOP_VERSION="$(HADOOP_VERSION)" \
		--build-arg HADOOP_MIRROR="$(HADOOP_MIRROR)" \
		$(if $(HADOOP_ARCHIVE),--build-arg HADOOP_ARCHIVE="$(HADOOP_ARCHIVE)") \
		-t "$(DOCKER_IMAGE):$(DOCKER_TAG)" "$(DOCKER_CONTEXT)"

push_$(d): DOCKER_IMAGE := $(DOCKER_IMAGE_$(d))
push_$(d): DOCKER_TAG := $(DOCKER_TAG_$(d))
push_$(d):
	docker push "$(DOCKER_IMAGE):$(DOCKER_TAG)"

# Boilerplate
d := $(dirstack_$(p))
p := $(basename $(p))
