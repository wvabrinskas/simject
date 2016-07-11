THEOS_PACKAGE_DIR_NAME = debs
TARGET = simulator:clang
ARCHS = x86_64 i386
DEBUG = 0
GO_EASY_ON_ME = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = simject
simject_FILES = simject.xm simjectCore.mm

include $(THEOS_MAKE_PATH)/tweak.mk

after-all::
	@echo Copying binaries...
	@mkdir -p bin
	@cp -v $(THEOS_OBJ_DIR)/simject.dylib bin

clean::
	@rm -rfv bin

setup:: clean all
	@sudo mkdir -p /opt/simject
	@sudo chown -R $(USER) /opt/simject
	@cp -v bin/simject.dylib /opt/simject
	@cp -v simject.plist /opt/simject
	@echo Done. Place your tweak\'s dynamic libraries and accompanying property lists inside /opt/simject to load them in the iOS Simulator.
