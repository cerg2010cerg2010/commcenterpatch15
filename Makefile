ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = CommCenter
LEAN_AND_MEAN = 1
PREFIX = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCPatch15

CCPatch15_FILES = Tweak.xm
CCPatch15_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
