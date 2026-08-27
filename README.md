Setting Up Your Own Termux Desktop on Android.
Linux on Android. Debian On Android. 

***DISCLAIMER THIS SETUP WAS USED FOR SNAPDRAGON CHIP AND GPU (**might not work for others**)***

> Device Used = Xiaomi Pad 8 Pro


# Pre-Exquisite

- Download Termux App: [Termux](https://github.com/termux/termux-app)
- Download Termux X11: [X11](https://github.com/termux/termux-x11)

---
## Open Termux App and run this:
```
pkg update
pkg upgrade

# Allow Termux to access Android Storage
termux-setup-storage 

pkg install git
pkg install curl bash nano wget

pkg install x11-repo
pkg install termux-x11-nightly
pkg install tur-repo
pkg install pulseaudio
pkg install proot-distro

# Desktop Environtment
pkg install xfce4
```
---
## Termux Native (GPU Hardware Acceleration) (Optional)

Turnip:
~~~
pkg install mesa-vulkan-icd-freedreno vulkan-tools vulkan-loader-android

vulkaninfo --summary

# in the shell that launches your XFCE session / app
export MESA_LOADER_DRIVER_OVERRIDE=zink
export GALLIUM_DRIVER=zink
export TU_DEBUG=noconform      # skips conformance paths, big perf win
export MESA_NO_ERROR=1

glxinfo -B | grep -E "OpenGL renderer|OpenGL version"
glmark2
~~~
ZINK:
```
pkg install mesa-zink
pkg install mesa-demos

export MESA_LOADER_DRIVER_OVERRIDE=zink
export GALLIUM_DRIVER=zink
```
## Desktop Run Script

### Snapdragon / Adreno GPU (Zink + Turnip)
`scripts/startxfce.sh` starts termux-x11 and pulseaudio, enables Zink/Turnip
GPU acceleration, then launches the XFCE4 session.

```
curl -L -o startxfce.sh https://raw.githubusercontent.com/aldrianaliv/termux-setups/
main/scripts/startxfce.sh

chmod +x startxfce.sh

./startxfce.sh
```

### Other Chips / GPUs (VirGL)
Turnip only supports Adreno GPUs, so on other SoCs (e.g. Mali, PowerVR) use
`scripts/startxfce-generic.sh` instead. It's the same script but swaps
Zink/Turnip for VirGL (`virgl_test_server_android` + `GALLIUM_DRIVER=virpipe`),
which works across GPU vendors, at the cost of the performance you'd get from
a native driver like Turnip.

```
curl -L -o startxfce-generic.sh https://raw.githubusercontent.com/aldrianaliv/termux-setups/
main/scripts/startxfce-generic.sh

chmod +x startxfce-generic.sh

./startxfce-generic.sh
```
---

## proot-distro (debian)
```
pkg install proot-distro
proot-distro install debian
proot-distro login debian 

apt update
apt upgrade

apt install sudo nano adduser -y

adduser <name>

visudo

# Add below root user
<name> ALL=(ALL:ALL) ALL

# Change User
su - <name>

# Check user privilleges
sudo whoami 

proot-distro login debian --user <name>

sudo apt install xfce4

sudo apt install xfce4-whiskermenu-plugin
sudo apt install plank

```
### Hardware Acceleleration (VirGl)
```
pkg install virglrenderer-android

```

### Debian Run Script
`scripts/startdebian.sh` starts termux-x11, pulseaudio and VirGL, then logs
into the Debian proot and launches XFCE4 as your Debian user.

**Before running it**, edit the script and replace the literal `<user>`
placeholder in the `su - <user>` line with the Debian username you created
with `adduser` above.

```
curl -L -o startdebian.sh https://raw.githubusercontent.com/aldrianaliv/termux-setups/
main/scripts/startdebian.sh

chmod +x startdebian.sh

./startdebian.sh
```

---
# Test Compability of Hardware GPU

```
pkg install gl2mark

# run this on terminal to benchmark
gl2mark
```