REPO = https://github.com/ilyasergey/pnp.git
TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-pnp
