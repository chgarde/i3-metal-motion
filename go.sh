docker run --rm -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -it cga:repetier /opt/RepetierHost/repetierHost
