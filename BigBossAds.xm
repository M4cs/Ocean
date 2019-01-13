@import WebKit;

%hook WKWebView
-(id)initWithFrame:(CGRect)arg1 configuration:(WKWebViewConfiguration*)config {
    config.preferences.javaScriptEnabled = YES;
    return %orig;
}

-(WKWebViewConfiguration*)configuration {
    WKWebViewConfiguration* config = %orig;
    config.preferences.javaScriptEnabled = YES;
    return config;
}
%end
