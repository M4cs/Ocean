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

@interface Package : NSObject {
    NSString *_name;
    NSString *_version;
}
@property (nonatomic, retain) NSString* package;
-(id)sourceRepo;
@end

@interface Repo : NSObject
@property (nonatomic, retain) NSString* repoURL;
@end

@interface PackageViewController : UIViewController
@property (nonatomic, retain) Package* package;
@end

@interface FeaturedViewController : UIViewController
@end

@interface SourcesViewController : UIViewController
- (void)presentAddSourceSkippingPasteboard:(BOOL)arg1;
- (void)reloadData;
- (void)refreshSources:(id)arg1;
- (void)setEditing:(BOOL)arg1 animated:(BOOL)arg2;
@end

@interface RepoManager : NSObject
+ (id)sharedInstance;
- (void)addReposWithURLs:(NSArray *)arg1;
- (void)writeListToFile;
- (BOOL)hasRepoWithURL:(id)arg1;
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

@interface UINavigationBar (iOS11)
@property (nonatomic,copy) NSDictionary* largeTitleTextAttributes;
@end

@interface PackageCollectionViewCell : NSObject
@end

@interface PackageListHeader : NSObject
@end

@interface DepictionTableButtonView : NSObject
@end

@interface UIView (Internal)
-(id)_viewControllerForAncestor;
@end
