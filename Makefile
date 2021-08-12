REPO = https://github.com/ilyasergey/pnp.git
TAG = master
COMMIT = dc32861434e072ed825ba1952cbb7acc4a3a4ce0
WORKDIR = workdir

# Git boilerplate
define GIT_CLONE_COMMIT
mkdir -p $(WORKDIR) && cd $(WORKDIR) && git init && \
git remote add origin $(REPO) && \
git fetch --depth=1 origin $(COMMIT) && git reset --hard FETCH_HEAD
endef

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	${if $(COMMIT), $(GIT_CLONE_COMMIT), git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-pnp
