// move this header and its implementation into the root of your project
// add this line to your Makefile `tk.oceantweak.oceanprefs_LDFLAGS += -lCSPreferencesProvider`

#include <CSPrefs/CSPreferencesProvider.h>
#define prefs [OCPProvider sharedProvider]

@interface OCPProvider : NSObject

+ (CSPreferencesProvider *)sharedProvider;

@end
