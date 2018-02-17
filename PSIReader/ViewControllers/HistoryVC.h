//
//  HistoryVC.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSIDataHelper/RLMPMData.h"
#import "PSIDataHelper/RLMPSIData.h"
#import "PSIVC.h"
#import "PM25VC.h"

@interface HistoryVC : UITableViewController

@property (nonatomic, assign) BOOL fromPSI;

@end
