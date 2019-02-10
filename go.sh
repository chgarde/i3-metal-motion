docker run --rm -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $PWD/files:/root/files:rw \
  -it cga:repetier /opt/RepetierHost/repetierHost
