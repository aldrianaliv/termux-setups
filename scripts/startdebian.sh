#!/data/data/com.termux/files/usr/bin/bash
set -u

termux-wake-lock

export XDG_RUNTIME_DIR=${TMPDIR}
export DISPLAY=:0

# Clean stale state
pkill -f "termux-x11" 2>/dev/null
pkill -f "virgl_test_server_android" 2>/dev/null
rm -rf ${TMPDIR}/.X11-unix ${TMPDIR}/.X0-lock 2>/dev/null
sleep 1

# Audio bridge
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
    --exit-idle-time=-1

    # X server
    termux-x11 :0 >/dev/null 2>&1 &

    # GPU
    virgl_test_server_android >/dev/null 2>&1 &

    # Wait for the X socket instead of guessing
    for i in $(seq 1 20); do
      [ -e "${TMPDIR}/.X11-unix/X0" ] && break
        sleep 0.5
        done

        am start --user 0 \
          -n com.termux.x11/com.termux.x11.MainActivity \
            >/dev/null 2>&1
            sleep 1

            proot-distro login debian --shared-tmp -- /bin/bash -c '
            exec su - aliv -c "env \
            DISPLAY=:0 \
            PULSE_SERVER=127.0.0.1 \
            XDG_RUNTIME_DIR=/tmp \
            GALLIUM_DRIVER=virpipe \
            MESA_GL_VERSION_OVERRIDE=4.0 \
            dbus-launch --exit-with-session startxfce4"
            '
            exit 0