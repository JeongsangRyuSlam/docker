xhost +
docker run -it --rm \
    --name test4container \
    -e DISPLAY=$DISPLAY \
    --privileged \
    --runtime=nvidia \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v ./shared_dir:/root/shared_dir \
    --network host \
    jeongsangryuslam/cuda:10.2-cudnn8-devel-ubuntu18.04-melodic-desktop-full
