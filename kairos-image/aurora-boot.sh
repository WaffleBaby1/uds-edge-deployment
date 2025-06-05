IMAGE=quay.io/kairos/ubuntu:24.04-standard-arm64-generic-v3.4.2-k3sv1.32.3-k3s1

docker pull $IMAGE

docker run -v $PWD/config.yaml:/config.yaml \
           -v $PWD/build:/tmp/auroraboot \
           -v /var/run/docker.sock:/var/run/docker.sock \
           --rm -ti kairos.docker.scarf.sh/kairos/auroraboot \
           --set "disable_http_server=true" \
           --set "disable_netboot=true" \
           --set "container_image=docker://$IMAGE" \
           --set repository=kairos-io/kairos \
           --cloud-config /config.yaml \
           --set "state_dir=/tmp/auroraboot"
