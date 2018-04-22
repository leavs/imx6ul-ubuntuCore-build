#!/bin/sh

# kernel-snap
echo "build imx6ul-eisd-kernel ..."
cd imx6ul-eisd-kernel
snapcraft --target-arch=armhf
cd ..
echo "build imx6uleisd-kernel done!!"

# gadget-snap
echo "build imx6ul-eisd-gadget"
cd imx6ul-eisd-gadget
snapcraft
cd ..
echo "build imx6ul-eisd-gadget done!!"

# ubuntu core image
echo "build ubuntu core image ..."
cd ubuntu-core-image
cp ../mx6ul-eisd-gadget/imx6ul-eisd-gadget_16.01-1_armhf.snap .
cp ../imx6ul-eisd-kernel/imx6uleisd-kernel_3.14.52_armhf.snap .
cp ../model-assertion/imx6ul-eisd.model .

ubuntu-image -c beta --image-size 4G --extra-snaps imx6ul-eisd-gadget_16.01-1_armhf.snap --extra-snaps imx6uleisd-kernel_3.14.52_armhf.snap -O imx6ul-eisd-20180422 imx6ul-eisd.model
echo "build ubuntu core image done!!"
