#
# Make commands for page block
#

# Ignore existing folders for these commands
.PHONY: build doc update clean push-doc uninstall

#
# Default task
#
all: install build

install : node_modules

update :
	npm update;

uninstall : clean
	rm -rf node_modules;

watch :
	npm run dev;

build :
	npm run build;
#
# Clean generated files
#
clean :
	rm -rf doc;
#
# Generate documentation
#
doc :
	npm run doc;
#
# Push generated Documentation on Rezo Zero host.
# Credentials required, of course
push-doc : doc
	rsync -avcz -e "ssh -P 39001" doc/ core@startingblocks.rezo-zero.com:~/http/;

node_modules:
	npm install;
