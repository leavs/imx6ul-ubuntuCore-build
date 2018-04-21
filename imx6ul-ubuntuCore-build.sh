#!/bin/sh

# kernel-snap
echo "build imx6ul-eisd-kernel ..."
cd imx6ul-eisd-kernel
snapcraft snap --target-arch armhf
cd ..
echo "build imx6ul-eisd-kernel done!!"

# gadget-snap
echo "build imx6ul-eisd-gadget"
cd imx6ul-eisd-gadget
snapcraft snap
cd ..
echo "build imx6ul-eisd-gadget done!!"

# ubuntu core image
echo "build ubuntu core image ..."
cd ubuntu-core-image
cp ../mx6ul-eisd-gadget/imx6ul-eisd-gadget_16.01-1_armhf.snap .
cp ../imx6ul-eisd-kernel/imx6ul-eisd-kernel_3.14.52_armhf.snap .
cp ../model-assertion/imx6ul-eisd.model .

sudo ubuntu-image -c beta --image-size 4G --extra-snaps imx6ul-eisd-gadget_16.01-1_armhf.snap --extra-snaps imx6ul-eisd-kernel_3.14.52_armhf.snap -O imx6ul-eisd-20180421 imx6ul-eisd.model
echo "build ubuntu core image done!!"
