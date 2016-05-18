//
//  MJADSDK.h
//  Pods
//
//  Created by John LXThyme on 16/5/18.
//
//

#import <Foundation/Foundation.h>

/**
 *  适配
 */
#ifndef kMainSize
# define kMainScreen [[UIScreen mainScreen]bounds]
# define kMainScreen_size [[UIScreen mainScreen]bounds].size
# define kMainScreen_height [[UIScreen mainScreen]bounds].size.height
# define kMainScreen_width [[UIScreen mainScreen]bounds].size.width
#endif

@interface MJADSDK : NSObject

@end
