#import <CSPrefs/libCSPreferences.h>

@interface UIImage (Internal)
+(id)imageNamed:(id)arg1 inBundle:(id)arg2;
@end

@interface OCPPreferenceController : CSPListController

@end

@interface OCPPrefBannerCell : UITableViewCell {
    UIImageView* imgView;
}
@end
