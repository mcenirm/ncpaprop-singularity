DEFS := $(wildcard *.def)
IMAGES := $(DEFS:%.def=images/%.sif)
MKS := $(DEFS:%.def=%.mk)

all : downloads/checked
all : $(IMAGES)

-include $(MKS)

images/%.sif : %.def
	singularity build --force --fakeroot $@ $<

$(IMAGES) : | images

images :
	mkdir -p images

downloads/checked : links.txt fetchlinks
	./fetchlinks
	touch $@

%.mk : %.def Makefile
	sed -n -e 's#^From: \(images/.*\.sif\)#$(@:%.mk=images/%.sif) : \1#p' $< > $@
