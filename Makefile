GO_EASY_ON_ME = 1
TARGET = iphone:latest:5.0
ARCHS = armv6 armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = SmoothCursor
SmoothCursor_FILES = Tweak.xm
SmoothCursor_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
