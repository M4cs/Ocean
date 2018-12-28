#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];

@interface DepictionTabView : UIView
@end

%hook DepictionTabView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end

@interface DepictionTableTextView : UIView
@end

%hook DepictionTableTextView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_textLabel"]){
        UILabel *textLabel = (UILabel *)([self valueForKey:@"_textLabel"]);
        textLabel.textColor = [UIColor whiteColor];
    }
}
%end

@interface DepictionHeaderView : UIView
@end

%hook DepictionHeaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
}
%end

@interface DepictionSubheaderView : UIView
@end

%hook DepictionSubheaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
    self.backgroundColor = kDarkColor;
}
%end

@interface CSTextRenderView : UIView {
        NSAttributedString *_attributedText;
}
@end

%hook CSTextRenderView
-(void)layoutSubviews{
    %orig;
    self.tintColor = [UIColor whiteColor];
    // NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    // NSMutableAttributedString *mutableAttributedText= attributedText.mutableCopy;
    // [mutableAttributedText.mutableString setString:[attributedText.string stringByReplacingOccurrencesOfString:@"kCGColorSpaceModelRGB 0 0 0 1" withString:@"kCGColorSpaceModelRGB 1 1 1 1"]];
    // MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;

    NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    NSMutableAttributedString *mutableAttributedText = [attributedText mutableCopy];
    [mutableAttributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [mutableAttributedText length])];
    MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;
}
%end