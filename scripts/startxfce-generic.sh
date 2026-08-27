#!/data/data/com.termux/files/usr/bin/bash

# Variant of startxfce.sh for non-Snapdragon/non-Adreno devices (e.g. Mali, PowerVR).
# Uses VirGL instead of Turnip/Zink, since Turnip only supports Adreno GPUs.

# Kill open X11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
kill -9 $(pgrep -f "virgl_test_server_android") 2>/dev/null

# Enable PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &

# GPU hardware acceleration (VirGL)
virgl_test_server_android >/dev/null 2>&1 &

# Wait a bit until termux-x11 gets started.
sleep 3

# Launch Termux X11 main activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

# Set audio server
export PULSE_SERVER=127.0.0.1

# GPU hardware acceleration (VirGL)
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0

# Run XFCE4 Desktop
env DISPLAY=:0 dbus-launch --exit-with-session xfce4-session & > /dev/null 2>&1

exit 0
