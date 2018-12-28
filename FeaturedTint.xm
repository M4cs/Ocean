#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

#import "Headers/ANEMWebImageButton.h"

@interface __FakeMarqueeLabel : UILabel
@property(nonatomic, retain) UIColor *textColor;
@property(nonatomic, copy) NSString *text;
@end

@interface SourceProgressIndicatorView : UIView
@end

%hook SourceProgressIndicatorView
-(void)setTintColor:(UIColor *)arg1 {
    arg1 = kColor;
    %orig(arg1);
}
%end

%hook UIImageView
-(long long)_defaultRenderingMode{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
		return 2;
	}
	return %orig;
}
-(void)setTintColor:(UIColor *)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
		arg1 = kColor;
		%orig(arg1);
	}
	%orig(arg1);
}
%end

%hook FeaturedButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end

