# Chai
Chai is a low level library `libchai.so` that provides a set of functions to communicate to devices attached to CAN bus. For details see
- doc/CHAI-Programming-Guide.pdf
- doc/CHAI-User-Guide.pdf

## Build and install
To build the Chai library use the command
```
make build
```

Before trying to install the Chai library make sure that a user has necessary permissions
- R/W access to /usr/local/lib
- permissions to run ldconfig
- /usr/local/lib must be listed in the /etc/ld.so.conf

When you are ready run the command (use `sudo` if necessary)
```
make install
```

# Useful notes
## D2XX
If usb-can adapter is used to interact with can devices then you need to install FTDI driver which provides D2XX interface. For details see the [link](https://ftdichip.com/drivers/d2xx-drivers/).

## Permissions for USB devices
Usually desktop Linux users on Ubuntu are members of the `adm` group and on Fedora they are members or the `wheel` group. You can either directly change the group of the USB devices available on the system with the following command
```
GROUP_NAME=wheel
find /dev/bus/usb -type c | sudo xargs chown root:${GROUP_NAME}
```
or you can change the udev rules so that udev creates USB devices with the necessary permissions. Modify appropriately the file `99.usb.rules` and put it to `/etc/udev/rules.d/` and then run the following command
```
udevadm trigger
```

## Raspberry Pi
For ARM device you need to chose a proper version of the FTDI driver. If unsure which ARM version to use, compare the output of readelf
and file commands on a system binary with the content of release/build/libftd2xx.txt in each FTDI driver package.

*We tested with this version libftd2xx-arm-v7-hf-1.4.24*
