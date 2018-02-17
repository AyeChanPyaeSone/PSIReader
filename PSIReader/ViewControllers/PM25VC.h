//
//  PM25VC.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSIDataHelper/PSIDataHelper.h"
#import "PSIPMDataCell.h"
#import "PSIPMDataHeaderView.h"
#import "PSIDataHelper/RLMPSIData.h"
#import "PSIDataHelper/RLMPMData.h"
#import "HistoryVC.h"

@interface PM25VC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblLastUpdateTimeStamp;
@property (weak, nonatomic) IBOutlet UITableView *tblPSIData;
@property (strong, nonatomic) RLMPMData *rlmPMData;
@property (nonatomic, assign) BOOL dataInclude;

@end
