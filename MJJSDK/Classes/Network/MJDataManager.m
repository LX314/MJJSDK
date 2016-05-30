//
//  MJDataManager.m
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "MJDataManager.h"

//#import "Macro.h"
//#import "Tool.h"

@interface MJDataManager ()
{
    
}
/** <#注释#>*/
@property (nonatomic,copy)NSString *urlString;
/** <#注释#>*/
@property (nonatomic,retain)NSMutableDictionary *params;
/** <#注释#>*/
@property (nonatomic,retain)NSDictionary *responseParams;

@end
@implementation MJDataManager
+ (instancetype)sharedInstance {
    static MJDataManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
    });
    
    return _sharedInstance;
}

- (void)test1 {
    //[self test1];
    NSString *jsonString = [MJDataManager toJsonString:self.responseParams];
    jsonString = [MJDataManager toJsonString:self.params];
}
+ (NSString *)toJsonString:(id)obj{
    NSError *error;
    NSString *jsonString;
    if (![obj isKindOfClass:[NSDictionary class]] && ![obj isKindOfClass:[NSArray class]]) {
        return @"无法解析";
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
+ (void)toJsonObject:(id)obj{
    
}
- (void)loadData{
    [self POST:self.urlString params:self.params success:^(NSURLSessionDataTask * _Nonnull dataTask, id  _Nullable responseObject) {
        //
    } failure:^(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error) {
        //
    }];
}

#pragma mark - urlString
- (NSString *)urlString
{
    if(!_urlString){
        _urlString = @"";
        
    }
    
    return _urlString;
}
#pragma mark - params
- (NSMutableDictionary *)params
{
    if(!_params){
        _params = [@{
                     @"event_id":@"",
                     @"test_type":@(KTestTypeDevelpoment),
                     @"device":Device(),
                     @"app":App(),
                     @"user":User(),
                     @"sdk":SDK(),
                     @"impression":Impression(),
//                     @"":@"",
                     }mutableCopy];
    }
    
    return _params;
}

#pragma mark -
#pragma mark - /***************_Device_***************/
static NSDictionary *Geo(){
    return @{
             @"longitude":@"",//double
             @"latitude":@"",//double
             };
}
static NSDictionary *Device(){
    return @{
              @"ip":@"",
             @"user_agent":@"",
              
             @"pixel_width":@(0.f),//int32
              @"pixel_height":@(0.f),//int32
              @"physical_size":@"",//double
              
              @"is_flash_enabled":@"",//bool
              @"is_js_enabled":@"",//bool
              
              @"name":@"",
              @"brand":@"",
              @"model":@"",
              
              @"os":@"",
              @"os_version":@"",
              @"is_rooted":@"",//bool
              
              @"device_orientation":@(KDeviceOrientationUnknown),
              @"device_type":@(KDeviceTypeUnknown),
              @"platform":@(KPlatformIOS),
              
              @"geo":Geo(),
              @"network_connection_type":@(KNetworkConnectionTypeUnknownNetWork),
              @"carrier_id":@"",//int32 carrier id, namely, the MNC code. 0 if connection type is wifi or unknown
//              @"":@"",
             };
}
#pragma mark -
#pragma mark -  /***************_App_***************/
static NSDictionary *App(){
    return @{
             @"app_key":@"",
//             @"":@"",
             };
}
#pragma mark -
#pragma mark -  /***************_User_***************/
static NSDictionary *User(){
    return @{
             @"phone_number":@"",
             @"imei":@"",
             @"mac":@"",
             @"openuuid":@"",
             @"idfa":@"",
             @"android_id":@"",
             @"app_user_id":@"",
             @"paste_board":@"",
//             @"":@"",
             };
}
#pragma mark -
#pragma mark -  /***************_SDK_***************/
static NSDictionary *SDK(){
    return @{
             @"sdk_version":@"",
             @"timestamp":@"",//int32
             @"checkcode":@"",
//             @"":@"",
             };
}
#pragma mark -
#pragma mark -  /***************_Impression_***************/
static NSDictionary *Impression(){
    return @{
             @"imp_id":@"",//唯一标示
             @"adspace_id":@"",//广告位 ID
             @"ad_count":@"",//the expected A.D number in one time
//             @"":@"",
             };
}
#pragma mark -
#pragma mark -  /***************_Impression_***************/
#pragma mark - responseParams
- (NSDictionary *)responseParams
{
    if(!_responseParams){
        _responseParams = @{
                            @"event_id":@"",
                            @"imp_ads":ImpressionAd(),
                            @"":@"",
                            };
        
    }
    
    return _responseParams;
}
static NSDictionary *BannerAd(){
    return @{
             @"http_snippet":@"",//invalid
             @"type":@(KTypeIMG),
             
             //IMG Style
             @"img_url":@"",
             
             //GL Style
             @"logo_url":@"",
             @"app_name":@"",
             @"app_description":@"",
             
             //common
             @"click_url":@"",
             
             @"product_type":@(KProductTypeLink),//download or share.
             @"btn_url":@"",
             
             //#crt_size = 13;
             };
}
//应用墙
static NSDictionary *Apps(){
    return @{
             @"logo_url":@"",
             @"app_nam":@"",
             @"app_description":@"",
             
             @"product_type":@(KProductTypeLink),
             @"btn_url":@"",
             @"click_url":@"",
             };
}
static NSDictionary *ImpressionAd(){
    return @{
             @"ImpressionAd":@"",//曝光 ID.(拼接 URL)
             @"ad_type":@(KADTypeIMGBanner),
             @"show_tracking_urls":@[],//第三方监测
             @"banner_ads":BannerAd(),
             @"apps":Apps(),
//             @"":@"",
             };
}
//static NSDictionary *(){
//    return @{
//             @"":@"",
////             @"":@"",
//             };
//}

@end
