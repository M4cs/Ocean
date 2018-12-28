#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

%hook DepictionTableButtonView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_titleLabel"]){
        UILabel *titleLabel = (UILabel *)[self valueForKey:@"_titleLabel"];
        titleLabel.textColor = kColor;
    }
}
%end
@interface DepictionTabControl : UIView
@property(nonatomic) _Bool highlighted; 
@end
%hook DepictionTabControl
- (void)layoutSubviews {
	%orig;
	if (self.highlighted){
		if ([self valueForKey:@"_tabLabel"]) {
			UILabel *tabLabel = (UILabel *)[self valueForKey:@"_tabLabel"];
        	tabLabel.textColor = kColor;
    	}
	}
}
%end
%hook DepictionTabView
-(void)layoutSubviews {
	%orig;
	if ([self valueForKey:@"_tabViewHighlight"]) {
		UIView *tabViewHighlight = (UIView *)[self valueForKey:@"_tabViewHighlight"];
        tabViewHighlight.backgroundColor = kColor;
    }
}
%end 
%hook DownloadConfirmButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook PackageQueueButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end