#import <Headers/Interfaces.h>

%group RepoCompat
//Bingner's repo actually supports sileo if you send the right variables
%hook URLManager
+(NSMutableURLRequest*) urlRequestWithHeaders:(NSURL *)url includingDeviceInfo:(bool)info {
    NSMutableURLRequest *req = %orig;
    if ([req valueForHTTPHeaderField:@"X-Firmware"] == nil){
        [req setValue:[[UIDevice currentDevice] systemVersion] forHTTPHeaderField:@"X-Firmware"];
    }
    return req;
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"repoSupport"]) {
        %init(RepoCompat);
    }
}
