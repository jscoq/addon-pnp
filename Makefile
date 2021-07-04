REPO = https://github.com/ilyasergey/pnp.git
TAG = master
COMMIT = dc32861434e072ed825ba1952cbb7acc4a3a4ce0
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 ${if $(COMMIT), --no-checkout} -b $(TAG) $(REPO) $(WORKDIR)
	${if $(COMMIT), ( cd $(WORKDIR) && git checkout --detach $(COMMIT) )}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-pnp
