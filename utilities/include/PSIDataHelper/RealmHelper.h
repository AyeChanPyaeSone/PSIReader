//
//  RealmHelper.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmHelper : NSObject

- (void)savePSIPMData:(NSDictionary *)result success:(void (^)(void))successBlock fail:(void (^)(NSException *exception))failBlock;
- (void)savePMData:(NSDictionary *)result success:(void (^)(void))successBlock fail:(void (^)(NSException *exception))failBlock;
- (void)savePSIData:(NSDictionary *)result success:(void (^)(void))successBlock fail:(void (^)(NSException *exception))failBlock;

@end
