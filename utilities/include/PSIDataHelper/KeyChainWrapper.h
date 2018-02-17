//
//  KeyChainWrapper.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainWrapper : NSObject

#ifdef SAMKEYCHAIN_ACCESS_GROUP_AVAILABLE
/** kSecAttrAccessGroup (only used on iOS) */
@property (nonatomic, copy, nullable) NSString *accessGroup;
#endif

#ifdef SAMKEYCHAIN_SYNCHRONIZATION_AVAILABLE
/** kSecAttrSynchronizable */
@property (nonatomic) SAMKeychainQuerySynchronizationMode synchronizationMode;
#endif

- (BOOL)savewithService:(NSString *_Nullable)service andAccount:(NSString *_Nullable)account andPasswordData:(NSData *_Nullable)passwordData;
- (NSData *)fetchWithService:(NSString *_Nullable)service andAccount:(NSString *_Nullable)account;

@end
