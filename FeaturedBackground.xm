#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];

@interface FeaturedPackageView : UIView
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
@end

%hook FeaturedPackageView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_titleLabel"]) {
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"_titleLabel"]);
        titleLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = kGrayColor;
    }
}
-(void)touchesBegan:(id)arg1 withEvent:(id)arg2{
    self.backgroundColor = kGrayColor;
}
%end

@interface FeaturedBannersView : UIView
@end

%hook FeaturedBannersView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end

@interface FeaturedHeaderView : UIView
@end

%hook FeaturedHeaderView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
    if ([self valueForKey:@"_headerLabel"]) {
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
}
%end

@interface FeaturedViewController : UIViewController
@end

%hook FeaturedViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
    //DRM
    
}
%end

@interface FeaturedAutoStackView : UIView
@end

%hook FeaturedAutoStackView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end

%hook FeaturedButton
-(void)setBackgroundColor:(UIColor *)arg1{
    arg1 = kLighterDarkColor;
    %orig(arg1);
}
%end