# uds-edge-deployment
Full suite from ISO to packages for deploying Defense Unicorns UDS

# Kairos OS-Builder
the kairos os builder creates a light-weight `.ISO` for deployment on to bare-metal. This `.ISO` be a `ubuntu` os with `k3s` built into it. Upon deployment the operating system will automatically start a k3s cluster on the target system.

## Creating the ISO

### Build your base-image
located in the `$PWD/kairos-image/images-bundle/` folder is a `Dockerfile` this container will container will have the base packages to be included into your `.ISO` in this example you can see that we are pulling down the k3s air-gapped images and storing them in the container. We are then Calling the `run.sh` script which copies the downloaded images into the appropriate file location for the operating system. 

- to build the base container run the following command:
```shell
docker build -t images-bundle . 
```

- We now need to save this image as a `.tar` to be included into our ISO

```shell
docker save images-bundle -o ./data/bundle.tar
```