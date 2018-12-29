//
//  NSString+URLsFromString.m
//  Installer
//
//  Created by midnightchips on 12/24/18.
//  Copyright © 2018 AppTapp. All rights reserved.
//

@implementation NSString (URLsFromString)

+ (NSArray <NSURL*> *)URLsFromString:(NSString *)string {
    NSMutableArray<NSURL *> *URLs = [NSMutableArray new];
    
    if (string.length) {
        
        NSString *pattern = @"https?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
        
        for (NSTextCheckingResult *match in matches) {
            NSString* substring = [string substringWithRange:match.range];
            
            NSURL *candidateURL = [NSURL URLWithString:substring];
            if (candidateURL && candidateURL.scheme && candidateURL.host) {
                [URLs addObject:candidateURL];
            }
        }
    }
    
    return URLs;
}

- (NSArray <NSURL*> *)URLs {
    NSMutableArray<NSURL *> *URLs = [NSMutableArray new];
    
    if (self.length) {
        
        NSString *pattern = @"https?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
        
        for (NSTextCheckingResult *match in matches) {
            NSString* substring = [self substringWithRange:match.range];
            
            NSURL *candidateURL = [NSURL URLWithString:substring];
            if (candidateURL && candidateURL.scheme && candidateURL.host) {
                [URLs addObject:candidateURL];
            }
        }
    }
    
    return URLs;
}

@end
