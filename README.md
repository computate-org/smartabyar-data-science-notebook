
## How to run the application as a Podman container

### Install the prerequiste packages for buildah and podman

```bash
pkcon install -y buildah
pkcon install -y podman
```

### Build the container with podman

```bash
cd ~/.local/src/smartabyar-data-science-notebook
podman build -t computateorg/smartabyar-data-science-notebook:latest .
```

### Push the container up to quay.io
```bash
podman login quay.io
podman push computateorg/smartabyar-data-science-notebook:latest quay.io/computateorg/smartabyar-data-science-notebook:latest
```

