#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];

@interface _UINavigationBarContentView : UIView
@end

@interface _UINavigationBarLargeTitleView : UIView
@end

@interface _UIButtonBarStackView : UIView
@end

%hook UIViewController
-(void)viewDidLoad{
    %orig;
    //if (@available(iOS 11.0, *)){
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    //}
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    #pragma GCC diagnostic push 
    #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    //Screw off deprecation
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    #pragma GCC diagnostic pop

    // UILabel* demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    // demoLabel.backgroundColor = kDarkColor;
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
    self.backgroundColor = kDarkColor;
    if ([self valueForKey:@"textLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"textLabel"]);
        detailTextLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"detailTextLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"detailTextLabel"]);
        detailTextLabel.textColor = [UIColor whiteColor];
    }
}
%end
%hook UITableView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
    self.tintColor = [UIColor whiteColor];
}
%end
%hook UILabel
-(void)layoutSubviews {
    %orig;
    if ([self.superview isMemberOfClass:@("UITableView")]){
        self.textColor = [UIColor whiteColor];
    }
}
%end
%hook _UIButtonBarStackView
-(void)layoutSubviews{
    %orig;
    self.backgroundColor = kDarkTranslucentColor;
}
%end
%hook _UIVisualEffectSubview
-(void)setBackgroundColor:(id)arg1 {
  arg1 = kDarkTranslucentColor;
  %orig(arg1);
}
%end

@interface _UIBarBackground : UIView
@end

%hook _UIBarBackground
-(void)layoutSubviews{
    %orig;
    if([self.superview isKindOfClass:NSClassFromString(@"TabBar")]){
        for(UIImageView *imageView in self.subviews){
            imageView.backgroundColor = kDarkishGrayColor;
        }
    }
}
%end

%hook UIView
-(void)layoutSubviews {
    %orig;
    if ([self.superview isMemberOfClass:@("UIScrollView")]){
        self.backgroundColor = kDarkColor;
    }
}
%end
%hook UICollectionView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end