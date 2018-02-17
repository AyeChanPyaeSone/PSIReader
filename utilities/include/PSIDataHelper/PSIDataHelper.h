//
//  PSIDataHelper.h
//  PSIDataHelper
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSIDataHelper : NSObject

@property (nonatomic, retain) NSMutableData *responseData;

- (void)loadDataWithSuccess:(void (^)(NSDictionary *dict))successBlock networkError:(void (^)(NSError *exception))networkErrorBlock;
- (void)generateRandomKeys;
- (void)saveAPITokenWithRandomKeyswithToken:(NSString *)token;

@end
