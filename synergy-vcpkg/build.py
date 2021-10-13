from pathlib import Path
from tqdm import tqdm

import docker

builds = {
    'ubuntu': {
        '18.04': {},
        '20.04': {},
        '21.04': {}
    },
    # 'debian': {
    #     '9': {},
    #     '10': {}
    #     '11': {}
    # },
    'fedora': {
        '33': {},
        '34': {}
    },
    # 'centos': {
    #     '7.6': {},
    #     '8': {}
    # },
}

client = docker.from_env()

total = len([1 for t in builds.values() for _ in t.keys()])

progress_bar = tqdm(total=total)
cur = 0

for dist, values in builds.items():
    for version in values:
        image_tag = f'synergy-vcpkg:{dist}{version}'
        docker_path = Path.cwd() / dist / version
        progress_bar.update(cur)
        progress_bar.set_description(image_tag)
        image, tools = client.images.build(
            tag=image_tag, path=str(docker_path))
        client.containers.prune()
        cur += 1
        progress_bar.write(image_tag)
        builds[dist][version]['image'] = image
        builds[dist][version]['tag'] = image_tag
        builds[dist][version]['path'] = docker_path

progress_bar.update(cur)
progress_bar.set_description('Done')
