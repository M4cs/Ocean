ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Ocean
Ocean_FILES = $(wildcard *.xm *.m)
Ocean_FRAMEWORKS = UIKit MessageUI
Ocean_LDFLAGS += -lCSColorPicker -lCSPreferencesProvider

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Sileo"
SUBPROJECTS += oceanprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
