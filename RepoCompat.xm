%hook RepoManager // could hook NSURLConnection as well
-(id)fetchFromURL:(id)arg1 success:(id)arg2 progress:(id)arg3 failure:(id)arg4{
    if ([[arg1 absoluteString] isEqualToString:@"http://apt.thebigboss.org/repofiles/cydia/Packages"]) {
        arg1 = [NSURL URLWithString:@"http://files11.thebigboss.org/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/Packages"]; //redirect to Packages file
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.thebigboss.org/repofiles/cydia/Packages.bz2"]) {
        arg1 = [NSURL URLWithString:@"http://files11.thebigboss.org/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/Packages.bz2"]; //redirect to Packages.bz2 file
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.thebigboss.org/repofiles/cydia/Release"]) {
        arg1 = [NSURL URLWithString:@"https://jakeashacks.ga/bigbossr"]; //FIXME; should parse this and grab paths instead
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.thebigboss.org/repofiles/cydia/Release.gpg"]) {
        arg1 = [NSURL URLWithString:@"http://apt.thebigboss.org/repofiles/cydia/dists/stable/Release.gpg"];
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.thebigboss.org/repofiles/cydia/CydiaIcon.png"]) {
        arg1 = [NSURL URLWithString:@"http://apt.thebigboss.org/repofiles/cydia/dists/stable/CydiaIcon.png"];
    }
    else if ([[arg1 absoluteString] rangeOfString:@"apt.thebigboss.org/repofiles/cydia"].location != NSNotFound) {
        arg1 = [NSURL URLWithString:@"http://files11.thebigboss.org/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/404-FOR-SURE"]; //redirect to something that'll return 404. If I leave it as is it might get stuck loading
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.bingner.com/Release.gpg"]) {
        arg1 = [NSURL URLWithString:@"http://apt.bingner.com/dists/ios/1443.00/main/binary-iphoneos-arm/Release.gpg"];
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.bingner.com/Release"]) {
        arg1 = [NSURL URLWithString:@"http://apt.bingner.com/dists/ios/1443.00/main/binary-iphoneos-arm/Release"];
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.bingner.com/CydiaIcon.png"]) {
        arg1 = [NSURL URLWithString:@"http://apt.bingner.com/CydiaIcon.png"];
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.bingner.com/Packages.bz2"]) {
        arg1 = [NSURL URLWithString:@"http://apt.bingner.com/dists/ios/1443.00/main/binary-iphoneos-arm/Packages.bz2"]; //redirect to Packages.bz2 file
    }
    else if ([[arg1 absoluteString] isEqualToString:@"http://apt.bingner.com/Packages"]) {
        arg1 = [NSURL URLWithString:@"http://apt.bingner.com/dists/ios/1443.00/main/binary-iphoneos-arm/Packages"]; //redirect to Packages.bz2 file
    }
    else if ([[arg1 absoluteString] rangeOfString:@"apt.bingner.com/"].location != NSNotFound) {
        arg1 = [NSURL URLWithString:@"http://files11.thebigboss.org/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/404-FOR-SURE"]; //redirect to something that'll return 404. If I leave it as is it might get stuck loading
    }
    return %orig(arg1, arg2, arg3, arg4);
}
%end
