//
//  SDKProtoTest.m
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "SDKProtoTest.h"

#import "Sdk.pb.h"

#import "MJDataManager.h"

@implementation SDKProtoTest
+ (void)testRequest {
    //[self testRequest];
    RequestDeviceGeo *geo = [[[[RequestDeviceGeo builder]
                               setLongitude:111]
                              setLatitude:222]
                             build];
    RequestDevice *device = [[[[[[[[[[[[[[[[[[[[[RequestDevice builder]
                                                setIp:@""]
                                               setUserAgent:@""]
                                              setPixelWidth:111]
                                             setPixelHeight:222]
                                            setPhysicalSize:333]
                                           setIsFlashEnabled:YES]
                                          setIsJsEnabled:YES]
                                         setName:@""]
                                        setBrand:@""]
                                       setModel:@""]
                                      setOs:@""]
                                     setOsVersion:@""]
                                    setIsRooted:YES]
                                   setDeviceOrientation:RequestDeviceDeviceOrientationKUnknownDeviceOrientation]
                                  setDeviceType:RequestDeviceDeviceTypeKUnknownDeviceType]
                                 setPlatform:RequestDevicePlatformKIos]
                                setGeo:geo]
                               setNetworkConnectionType:RequestDeviceNetworkConnectionTypeKUnknownNetWork]
                              setCarrierId:666]
                             build];
    RequestApp *app = [[[RequestApp builder]
                       setAppKey:@""]
                       build];
    RequestUser *user = [[[[[[[[[RequestUser builder]
                                setPhoneNumber:@""]
                               setImei:@""]
                              setMac:@""]
                             setOpenuuid:@""]
                            setIdfa:@""]
                           setAndroidId:@"" ]
                          setAppUserId:@""]
                         build];
    RequestSDK *sdk = [[[[[RequestSDK builder]
                          setSdkVersion:@"" ]
                         setTimestamp:111]
                        setCheckcode:@""]
                       build];
    RequestImpression *impression = [[[[[RequestImpression builder]
                                        setImpId:@""]
                                       setAdspaceId:@""]
                                      setAdCount:@""]
                                     build];
    Request *request = [[[[[[[[[Request builder]
                        setEventId:@""]
                        setTestType:1]
                             setDevice:device]
                            setApp:app]
                           setUser:user]
                          setSdk:sdk]
                         setImpression:impression]
                        build];
    NSMutableDictionary *requestParams = [NSMutableDictionary dictionary];
    [request storeInDictionary:requestParams];
    NSString *jsonString = [MJDataManager toJsonString:requestParams];
}
+ (void)testResponse {
    //[self testResponse];
    ResponseImpressionAdBannerAd *banner = [[[[[[[[[[[ResponseImpressionAdBannerAd builder]
                                            setHttpSnippet:@""]
                                            setType:ResponseImpressionAdBannerAdTypeKImg]
                                            setImgUrl:@""]
                                            setLogoUrl:@""]
                                            setAppNam:@""]
                                            setAppDescription:@""]
                                            setClickUrl:@""]
                                            setProductType:ResponseImpressionAdBannerAdProductTypeKLink]
                                            setBtnUrl:@""]
                                            build];
    ResponseImpressionAdApps *apps = [[[[[[[[ResponseImpressionAdApps builder]
                                      setLogoUrl:@""]
                                      setAppNam:@""]
                                      setAppDescription:@""]
                                      setProductType:ResponseImpressionAdAppsProductTypeKShare]
                                      setBtnUrl:@""]
                                      setClickUrl:@""]
                                      build];
    ResponseImpressionAd *imps = [[[[[[[ResponseImpressionAd builder]
                                  setExpressionId:111]
                                  setAdType:ResponseImpressionAdADTypeKImgbanner]
                                  setShowTrackingUrlsArray:@[@"1",@"2",@"3"]]
                                  setBannerAds:banner]
                                  setApps:apps]
                                  build];
    Response *response = [[[[Response builder]
                            setEventId:@""]
                           setImpAdsArray:@[imps,imps]]
                          build];
    NSMutableDictionary *responseParams = [NSMutableDictionary dictionary];
    [response storeInDictionary:responseParams];
    NSString *jsonString = [MJDataManager toJsonString:responseParams];
}


@end
