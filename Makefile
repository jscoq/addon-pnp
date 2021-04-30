REPO = https://github.com/ilyasergey/pnp.git
TAG = master
COMMIT = ffd2437d94feeec093ece64568abfb8bb4af3c7f
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
