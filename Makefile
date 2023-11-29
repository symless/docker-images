ODIR = ./output
BRANCH = master
JOBS = -
TESTS = 1
FILTER = 

.PHONY: clean purge test-all

clean:
	rm -rf $(ODIR)

rmi:
	docker images | grep symless/synergy-core | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi symless/synergy-core:{}

test-all:
	./test-core-all $(FILTER) -j $(JOBS) -b $(BRANCH) -J $(TESTS)
