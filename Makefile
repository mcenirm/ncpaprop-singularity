DEFS := $(wildcard *.def)
IMAGES := $(DEFS:%.def=images/%.sif)

all : downloads/checked
all : $(IMAGES)

images/builder.sif      :  images/base.sif
images/experiment1.sif  :  images/builder.sif

% : images/%.sif

images/%.sif : %.def
	singularity build --force --fakeroot $@ $<

$(IMAGES) : | images

images :
	mkdir -p images

downloads/checked : links.txt fetchlinks
	./fetchlinks
	touch $@
