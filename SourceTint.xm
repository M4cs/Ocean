#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

%hook SourceProgressIndicatorView
-(void)setTintColor:(UIColor *)arg1 {
    arg1 = kColor;
    %orig(arg1);
}
%end
