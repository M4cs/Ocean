#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];

@interface PackageViewController : UIViewController
@end

%hook PackageViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
}
%end

%hook PackageListHeader
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"label"]){
        UILabel *label = (UILabel *)([self valueForKey:@"label"]);
        label.textColor = [UIColor whiteColor];
    }
}
%end

%hook PackageCollectionViewCell
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"authorLabel"]){
        UILabel *authorLabel = (UILabel *)([self valueForKey:@"authorLabel"]);
        authorLabel.textColor = kLightGrayColor;
    }
    if ([self valueForKey:@"descriptionLabel"]){
        UILabel *descriptionLabel = (UILabel *)([self valueForKey:@"descriptionLabel"]);
        descriptionLabel.textColor = kLightGrayColor;
    }
    if ([self valueForKey:@"titleLabel"]){
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"titleLabel"]);
        titleLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = kGrayColor;
    }
}
%end