#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];

@interface NewsViewController : UIViewController
@end

%hook NewsViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
    for(UILabel *subview in self.view.subviews){
        subview.textColor = [UIColor whiteColor];
    }
}
%end 