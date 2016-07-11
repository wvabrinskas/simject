# simject

Credit goes to angleXwind for intitial creation of this tool. You can find the original [here](https://github.com/angelXwind/simject.git)

simject is a command-line tool and iOS dynamic library that allows developers to easily test their tweaks on the iOS Simulator.

simject is BSD-licensed. See `LICENSE` for more information.

### simject setup (requires the latest version of [Theos](https://github.com/theos/theos))

1. `git clone https://github.com/wvabrinskas/simject.git`

1. `cd simject/`

1. `./setup`

1. Note: During the process, you will be asked by `sudo` to enter in your login password. Please note that it is normal for nothing to be displayed as you type your password.

### simject usage

1. cd into your tweak project folder

1. Add this to the bottom of your makefile 
`simulator::
	@make
	@echo Copying files to simject directory
	@cp $(THEOS_OBJ_DIR)/*.dylib /opt/simject
	@cp *.plist /opt/simject
	@echo Respringing simulator…
	@/opt/simject/bin/respring_simulator`

1. Open the simulator

1. `make simulator`

### Targeting the iOS Simulator

1. Open your project's `Makefile`.

1. Change your `TARGET` variable to `TARGET = simulator:clang` (you may optionally specify the SDK/deployment versions)

1. If you want to support 32-bit iOS Simulators (in addition to 64-bit), add `ARCH = x86_64 i386` to your Makefile. If you are fine without 32-bit support, then simply add `ARCH = x86_64`.

### Final notes

Do keep in mind that just because your tweak works in the Simulator doesn't necessarily mean it'll work on an actual iOS device. Yes, in 99% of cases, it will work just fine, but there will always be some strange edge cases where this does not apply.
