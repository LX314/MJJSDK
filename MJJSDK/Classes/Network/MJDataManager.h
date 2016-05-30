//
//  MJDataManager.h
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "LXNetWorking.h"
typedef NS_ENUM(NSInteger, KTestType) {
    KTestTypeDevelpoment = 1,
    KTestTypeProduction = 2,
    KTestTypeDebug = 3
};
typedef NS_ENUM(NSInteger, KDeviceOrientation) {
    KDeviceOrientationUnknown = 1,
    KDeviceOrientationPortrait = 2,            // Device oriented vertically, home button on the bottom
    KDeviceOrientationPortraitUpsideDown = 3,  // Device oriented vertically, home button on the top
    KDeviceOrientationLandscapeLeft = 4,       // Device oriented horizontally, home button on the right
    KDeviceOrientationLandscapeRight = 5,      // Device oriented horizontally, home button on the left
    
    KDeviceOrientationFaceUp,              // Device oriented flat, face up
    KDeviceOrientationFaceDown             // Device oriented flat, face down
};
//设备类型
typedef NS_ENUM(NSInteger, KDeviceType) {
    KDeviceTypeUnknown = 1,
    KDeviceTypePhone = 2,
    KDeviceTypePad = 3,
    KDeviceTypeTV = 4,
    KDeviceTypePC = 5,
    KDeviceTypeGameConsole = 6,
    KDeviceTypeCarPlay = 7,
    //kAndroid = 8,
};
typedef NS_ENUM(NSInteger, KPlatform) {
    KPlatformIOS = 1,
    KPlatformAndroid = 2,
};
/**[MCC 及 MNC 参考](https://en.wikipedia.org/wiki/Mobile_country_code)
 * ![中国的MNC列表](http://static.open-open.com/lib/uploadImg/20140904/20140904171129_147.png)
 * China - CN
 * MCC    MNC    Brand    Operator                Status        Bands (MHz)                                    References and notes
 * 460    00            China Mobile            Operational    GSM 900/GSM 1800 UMTS (TD-SCDMA) 1880/2010
 * 460    01            China Unicom            Operational    GSM 900/GSM 1800/ UMTS 2100                    CDMA network sold to China Telecom, WCDMA commercial trial started in May 2009 and in full commercial operation as of October 2009.
 * 460    02            China Mobile            Operational    GSM 900/GSM 1800/ UMTS (TD-SCDMA) 1880/2010
 * 460    03            China Telecom            Operational    CDMA 800/cdma evdo 2100
 * 460    05            China Telecom            Operational
 * 460    06            China Unicom            Operational    GSM 900/GSM 1800/UMTS 2100
 * 460    07            China Mobile            Operational    GSM 900/GSM 1800/UMTS (TD-SCDMA) 1880/2010
 * 460    20            China Tietong            Operational    GSM-R
 * NA    NA            China Telecom&China Unicom    Operational
 */
typedef NS_ENUM(NSInteger, KNetworkConnectionType) {
    KNetworkConnectionTypeUnknownNetWork = 1,
    KNetworkConnectionTypeWifi = 2,
    KNetworkConnectionTypeG2 = 3,  // 2G GPRS/EDGE
    KNetworkConnectionTypeG3 = 4,  // 3G WCDMA/TD-SCDMA/CDMA2000
    KNetworkConnectionTypeG4 = 5,  // 4G LTE
    KNetworkConnectionTypeG5 = 6,  // 5G WiMax
};
typedef NS_ENUM(NSInteger, KADType) {
    KADTypeIMGBanner = 1,
    KADTypeGLBanner = 2,
    KADTypeIMGInterstital = 3,
    KADTypeGLInterstital = 4,
    KADTypeApps = 5,
    KADTypeMDApps = 6,
};
typedef NS_ENUM(NSInteger, KType){
    KTypeIMG = 1,//纯图
    KTypeGL = 2,//图文
};
typedef NS_ENUM(NSInteger, KProductType) {
    KProductTypeLink = 1,
    KProductTypeShare = 2,
};
@interface MJDataManager : LXNetWorking
{
    
}

+ (instancetype)sharedInstance;

//JSON parser
+ (NSString *)toJsonString:(id)obj;
+ (void)toJsonObject:(id)obj;

//TEST
- (void)test1;

@end
