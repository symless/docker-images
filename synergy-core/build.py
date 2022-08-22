import argparse
import docker
import os

parser = argparse.ArgumentParser(description='Make docker images')

parser.add_argument('source', help='The soruce dir of synergy-core')

args = parser.parse_args()

client = docker.from_env()

builds = {
    'ubuntu': {
        '16.04': {},
        '18.04': {},
        '20.04': {}
        '21.04': {},
        '22.04': {}
    },
    'fedora' : {
        '33': {},
        '34': {},
        '35': {},
        '36': {}
    },
    'debian': {
        '9': {},
        '10': {},
        '11': {}
    },
    'centos': {
        '7.6': {},
        '8': {}
    },

}
for dist, values in builds.items():
    for version in values:
        print "Building docker image:", dist, "-", version

        image, tools = client.images.build(tag='synergycore:'+dist+version, path=dist+'/'+version+'/')

        builds[dist][version]['image'] = image

        print "Build: synergycore:" + dist+version + " ID: " + builds[dist][version]['image'].id

print "\n\nRunning Synergy builds"

for dist, values in builds.items():
    for version in values:
        print "Building on:", dist+"-"+version

        container = client.containers.run('synergycore:' + dist + version,
                                          'bash /root/build/make.sh ' + dist + version,
                                          volumes={
                                              args.source: {'bind': '/root/synergy-core', 'mode': 'rw'},
                                              os.getcwd(): {'bind': '/root/build', 'mode': 'ro'}
                                          },
                                          name='Synergy_Build_' + dist + version,
                                          detach=True)
        builds[dist][version]['container'] = container


for dist, values in builds.items():
    for version in values:
        log = ''
        for line in builds[dist][version]['container'].logs(stream=True):
            log += line.strip() + '\n'
        builds[dist][version]['log'] = log
        print dist+"-"+version, "Done."

for dist, values in builds.items():
    for version in values:
        print "Removing container", dist+"-"+version
        builds[dist][version]['container'].remove()
        print dist+"-"+version
        print builds[dist][version]['log'] + "\n\n\n"

for dist, values in builds.items():
    for version in values:
        path = args.source + "/build/" + dist + version + "/bin/"

        if os.path.isfile(path + "synergy") and \
           os.path.isfile(path + "synergy") and \
           os.path.isfile(path + "synergy"):
            print dist + " " + version + ": Build Successful"
        else:
            print dist + " " + version + ": Build failed"
