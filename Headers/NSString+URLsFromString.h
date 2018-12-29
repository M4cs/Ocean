//
//  NSString+URLsFromString.h
//  Installer
//
//  Created by midnightchips on 12/24/18.
//  Copyright © 2018 AppTapp. All rights reserved.
//

@interface NSString (URLsFromString)

+ (NSArray <NSURL*> *)URLsFromString:(NSString *)string;
- (NSArray <NSURL*> *)URLs;

@end
