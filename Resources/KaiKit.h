// Created by Kai Engelhardt on 13.10.17.

#import <Foundation/Foundation.h>

//! Project version number for KaiKit.
FOUNDATION_EXPORT double KaiKitVersionNumber;

//! Project version string for KaiKit.
FOUNDATION_EXPORT const unsigned char KaiKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <KaiKit/PublicHeader.h>

#if TARGET_OS_IPHONE
#import "UIResponder+FirstResponder.h"
#elif TARGET_OS_TV
#import "UIResponder+FirstResponder.h"
#endif
