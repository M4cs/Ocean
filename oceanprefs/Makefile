include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = oceanprefs
oceanprefs_FILES = OCPPreferenceController.m
oceanprefs_INSTALL_PATH = /Library/PreferenceBundles
oceanprefs_FRAMEWORKS = UIKit
oceanprefs_PRIVATE_FRAMEWORKS = Preferences
oceanprefs_CFLAGS += -fobjc-arc
oceanprefs_LDFLAGS +=  -lCSPreferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/oceanprefs.plist$(ECHO_END)
