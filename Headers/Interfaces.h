#include "OCPProvider.h"
#import <UIKit/UIKit.h> 
#import <MessageUI/MFMailComposeViewController.h> 

@interface FeaturedPackageView : UIView
-(void)touchesBegan:(id)arg1 withEvent:(id)arg2;
@end

@interface SourcesTableViewCell : UIView
@end

@interface FeaturedButton : UIButton
@end

@interface FeaturedBannersView : UIView
@end

@interface DepictionTabView : UIView
@end

@interface DepictionTableTextView : UIView
@end

@interface DepictionHeaderView : UIView
@end

@interface DepictionSubheaderView : UIView
@end

@interface FeaturedHeaderView : UIView
@end

@interface PackageViewController : UIViewController
@end

@interface FeaturedViewController : UIViewController
@end

@interface SourcesViewController : UIViewController
@end

@interface FeaturedAutoStackView : UIView
@end

@interface _UINavigationBarContentView : UIView
@end

@interface _UINavigationBarLargeTitleView : UIView
@end

@interface NewsViewController : UIViewController
@end

@interface CSTextRenderView : UIView {
        NSAttributedString *_attributedText;
}
@end

@interface _UIButtonBarStackView : UIView
@end

@interface __FakeMarqueeLabel : UILabel
@property(nonatomic, retain) UIColor *textColor;
@property(nonatomic, copy) NSString *text;
@end

@interface SourceProgressIndicatorView : UIView
@end


@interface PackageListViewController : UIViewController <MFMailComposeViewControllerDelegate> {
	NSArray *_packages;
}
//-(void)sendEmail;
-(void)copyPackages;
@end
@interface Package{
    NSString *_name;
    NSString *_version;
}
@end