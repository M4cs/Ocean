#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

%hook UITableView
-(void)setSeparatorColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UINavigationBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook UINavigationButton
-(void)setTintColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UITabBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook UIButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end
%hook UITabBarButton //This sets the color for any badge that belongs to a TabBarIcon.
-(void)layoutSubviews{
    %orig;
    UIView *badge = MSHookIvar<UIView*>(self, "_badge");
    badge.backgroundColor = kColor;
}
%end