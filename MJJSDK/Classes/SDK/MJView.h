//
//  ADView.h
//  sdk-ADView
//
//  Created by John LXThyme on 4/22/16.
//  Copyright © 2016 John LXThyme. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Macro.h"
#import "MJSDKConfiguration.h"
#import "Colours.h"

#import "Masonry.h"


#import "BlocksKit.h"
#import "BlocksKit+UIKit.h"
#import "POP.h"

#import "MJError.h"

@interface MJView : UIControl
{
    
}

/** <#注释#>*/
@property (nonatomic,retain)UIButton *btnClose;
/** <#注释#>*/
@property (nonatomic,retain)UILabel *mjLabADLogo;
@property (assign, nonatomic) LXMJViewMaskType defaultMaskType;
@property (strong, nonatomic) UIColor *backgroundLayerColor;


- (void)registerNotifications;
- (void)mjreset;

- (void)updateMask;
@end
