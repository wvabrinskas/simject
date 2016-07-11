TARGET = macosx
ARCHS = x86_64 i386
DEBUG = 0
GO_EASY_ON_ME = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TOOL_NAME = respring_simulator
respring_simulator_FILES = respring_simulator.mm ../simjectCore.mm
respring_simulator_CFLAGS = -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tool.mk

after-all::
	@echo Copying binaries...
	@sudo mkdir -p /opt/simject/bin
	@sudo cp -v $(THEOS_OBJ_DIR)/respring_simulator /opt/simject/bin


