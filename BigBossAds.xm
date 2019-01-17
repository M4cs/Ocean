@import WebKit;

%hook WKWebView
-(void)layoutSubviews {
    %orig;
    [self reload];
}
%end

%hook WKPreferences
-(void)setJavaScriptEnabled:(BOOL)arg1 {
    arg1 = YES;
    %orig;
}

-(BOOL)javaScriptEnabled {
    return YES;
}
%end
