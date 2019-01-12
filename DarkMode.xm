/*#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];*/
#import <Headers/Interfaces.h>

%hook UICollectionView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end
%hook DepictionHeaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook DepictionTabView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end
%hook DepictionSubheaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [prefs colorForKey:@"textColor"];
    }
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end
%hook DepictionTableTextView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_textLabel"]){
        UILabel *textLabel = (UILabel *)([self valueForKey:@"_textLabel"]);
        textLabel.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook PackageCollectionViewCell
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"authorLabel"]){
        UILabel *authorLabel = (UILabel *)([self valueForKey:@"authorLabel"]);
        authorLabel.textColor = [prefs colorForKey:@"infoText"];
    }
    if ([self valueForKey:@"descriptionLabel"]){
        UILabel *descriptionLabel = (UILabel *)([self valueForKey:@"descriptionLabel"]);
        descriptionLabel.textColor = [prefs colorForKey:@"infoText"];
    }
    if ([self valueForKey:@"titleLabel"]){
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"titleLabel"]);
        titleLabel.textColor = [prefs colorForKey:@"textColor"];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = [prefs colorForKey:@"seperatorColor"];
    }
}
%end
%hook PackageListHeader
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"label"]){
        UILabel *label = (UILabel *)([self valueForKey:@"label"]);
        label.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook FeaturedPackageView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_titleLabel"]) {
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"_titleLabel"]);
        titleLabel.textColor = [prefs colorForKey:@"textColor"];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = [prefs colorForKey:@"seperatorColor"];
    }
}
-(void)touchesBegan:(id)arg1 withEvent:(id)arg2{
    self.backgroundColor = [prefs colorForKey:@"selectColor"];//kGrayColor; [prefs colorForKey:@"seperatorColor"];
    //Not sure what this one is, Im assuming its what color happens when they select something
}
%end
%hook FeaturedButton
-(void)setBackgroundColor:(UIColor *)arg1{
    arg1 = [prefs colorForKey:@"infoText"];//kLighterDarkColor;
    %orig(arg1);
}
%end
%hook FeaturedBannersView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end
%hook FeaturedHeaderView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    if ([self valueForKey:@"_headerLabel"]) {
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook FeaturedViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    //DRM

}
%end
%hook PackageViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end
%hook FeaturedAutoStackView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
}
%end

%hook CSTextRenderView
-(void)layoutSubviews{
    %orig;
    self.tintColor = [prefs colorForKey:@"tableTintColor"];
    // NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    // NSMutableAttributedString *mutableAttributedText= attributedText.mutableCopy;
    // [mutableAttributedText.mutableString setString:[attributedText.string stringByReplacingOccurrencesOfString:@"kCGColorSpaceModelRGB 0 0 0 1" withString:@"kCGColorSpaceModelRGB 1 1 1 1"]];
    // MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;

    NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    NSMutableAttributedString *mutableAttributedText = [attributedText mutableCopy];
    [mutableAttributedText addAttribute:NSForegroundColorAttributeName value:[prefs colorForKey:@"textColor"] range:NSMakeRange(0, [mutableAttributedText length])];
    MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;
}
%end
%hook UIViewController
-(void)viewDidLoad{
    %orig;
    self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [prefs colorForKey:@"textColor"]};
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [prefs colorForKey:@"textColor"]};
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    //Screw off deprecation
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    #pragma GCC diagnostic pop

    // UILabel* demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    // demoLabel.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    // demoLabel.textAlignment = NSTextAlignmentCenter;
    // demoLabel.textColor = [UIColor redColor];
    // demoLabel.text = @"Ocean (Beta)";
    // demoLabel.center = CGPointMake(self.navigationController.navigationBar.frame.size.width / 2, self.navigationController.navigationBar.frame.size.height / 2);
    // [demoLabel sizeToFit];
    // [self.navigationController.navigationBar addSubview:demoLabel];

}
- (long long)preferredStatusBarStyle {
	return 1;
}
%end
%hook UITableViewCell
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    if ([self valueForKey:@"textLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"textLabel"]);
        detailTextLabel.textColor = [prefs colorForKey:@"textColor"];
    }
    if ([self valueForKey:@"detailTextLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"detailTextLabel"]);
        detailTextLabel.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook UITableView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    self.tintColor = [prefs colorForKey:@"tableTintColor"];//[UIColor whiteColor];
}
%end
%hook UILabel
-(void)layoutSubviews {
    %orig;
    if ([self.superview isMemberOfClass:@("UITableView")]){
        self.textColor = [prefs colorForKey:@"textColor"];
    }
}
%end
%hook _UIButtonBarStackView
-(void)layoutSubviews{
    %orig;
    self.backgroundColor = [prefs colorForKey:@"visualEffectColor"];//kDarkTranslucentColor;
}
%end
%hook _UIVisualEffectSubview
-(void)setBackgroundColor:(id)arg1 {
  arg1 = [prefs colorForKey:@"visualEffectColor"];
  %orig(arg1);
}
%end
%hook NewsViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = [prefs colorForKey:@"backgroundColor"];
    for(UILabel *subview in self.view.subviews){
        if ([subview isKindOfClass:[UILabel class]]) {
            subview.textColor = [prefs colorForKey:@"textColor"];
        }
    }
}
%end
@interface _UIBarBackground : UIView
@end
%hook _UIBarBackground
-(void)layoutSubviews{
    %orig;
    if([self.superview isKindOfClass:NSClassFromString(@"TabBar")]){
        for(UIImageView *imageView in self.subviews){
            imageView.backgroundColor = [prefs colorForKey:@"barColor"];//kDarkishGrayColor;
        }
    }
}
%end
%hook __FakeMarqueeLabel
-(void)_setTextColor:(id)arg1{
    if ([self.text containsString:@"Package"]) {
        arg1 = [prefs colorForKey:@"infoText"];
        %orig(arg1);
    } else {
        %orig(arg1);
    }
}
%end
