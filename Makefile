DEFS := $(wildcard *.def)
IMAGES := $(DEFS:%.def=images/%.sif)

all : $(IMAGES)

images/experiment1.sif : images/base.sif

% : images/%.sif

images/%.sif : %.def
	singularity build --force --fakeroot $@ $<

$(IMAGES) : | images

images :
	mkdir -p images
