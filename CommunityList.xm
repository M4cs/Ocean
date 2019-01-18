%hook NSURL
+(NSURL *)URLWithString:(NSString *)string{
  if ([string isEqualToString:@"https://coolstar.moe/sileoassets/featured-ipad.json"]){ /* HIJACK THE IPAD FEATURED PAGE! */
    string = @"https://oceantweak.tk/repo/featured-ipad.json"; /* URL OF THE IPAD FEATURED PAGE! */
  }else if ([string isEqualToString:@"https://coolstar.moe/sileoassets/featured-iphone.json"]){ /* HIJACK THE IPHONE FEATURED PAGE! */
    string = @"https://oceantweak.tk/repo/featured-iphone.json"; /* URL OF THE IPHONE FEATURED PAGE! */
  }
  return %orig(string);
}
%end
