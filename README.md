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

termux-x11
```
---
## Termux Native
```
pkg install termux-x11
pkg install termux-x11-nightly

```

### Termux Native (GPU Hardware Acceleration) (Optional)
~~~
Turnip: 

~~~
## Desktop Run Script
```

```

## proot-distro (debian)
```
```
### Hardware Acceleleration (VirGl)
```
```

---
# Test Compability of Hardware GPU

```
pkg install gl2mark

# run this on terminal to benchmark
gl2mark
```