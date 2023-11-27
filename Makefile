ODIR = ./output
BRANCH = master
MAKE-PARALLEL = -
TEST-PARALLEL = 1
FILTER = 

.PHONY: clean purge test-all

clean:
	rm -rf $(ODIR)

rmi:
	docker images | grep symless/synergy-core | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi symless/synergy-core:{}

test-all:
	./test-core-all $(FILTER) -j $(MAKE-PARALLEL) -b $(BRANCH) -J $(TEST-PARALLEL)
