//
//  RLMPSIData.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RLMPSIData : RLMObject

@property NSInteger national;
@property NSInteger south;
@property NSInteger central;
@property NSInteger north;
@property NSInteger east;
@property NSInteger west;
@property NSString *date;
@property NSInteger id;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RLPMData>
RLM_ARRAY_TYPE(RLPMData)

