import argparse
import docker
import os

parser = argparse.ArgumentParser(description='Make docker images')
parser.add_argument('name', help='The base name of the image')
parser.add_argument('source', help='The source dir of images')
parser.add_argument('-i', '--include', help='include only images that look like this')
parser.add_argument('-e', '--exclude', help='exclude all images that look like this')
args = parser.parse_args()

client = docker.from_env()
for root, dirs, files in os.walk(args.source):
  if len(files) == 1 and files[0] == 'Dockerfile':
    (distro, version) = root.split('/')[-2:]
    image_name = f'{args.name}:{distro}{version}'
    if args.include and args.include not in image_name:
      continue
    if args.exclude and args.exclude in image_name:
      continue
    print(f'Building docker image: {image_name}')
    try:
      image, _ = client.images.build(tag=f'{image_name}', path=root)
      print(f'Finished building: {image_name} ID: {image.id}')
    except docker.errors.BuildError as err:
      print(f'Failed to build {image_name}. Try running it manually:')
      print(f'\tdocker build -t {image_name} - < {os.path.join(root, "Dockerfile")}')
      print(f'Error:')
      print(f'\t{err}')
