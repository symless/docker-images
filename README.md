# Synergy Docker Images

## Helpful commands

```sh
# Make docker images
docker build -t symless/synergy-core:fedora36 - < synergy-core/fedora/36/Dockerfile
```

```sh
# Run RPM build
docker run symless/synergy-core:fedora36 /bin/bash -c "$(cat ./buildRPM.sh)"
```

```sh
# Run DEB build
docker run symless/synergy-core:ubuntu22.04 /bin/bash -c "$(cat ./buildDEB.sh)"
```
