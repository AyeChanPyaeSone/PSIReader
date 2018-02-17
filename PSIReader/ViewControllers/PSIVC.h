//
//  PSIVC.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSIDataHelper/PSIDataHelper.h"
#import "PSIPMDataCell.h"
#import "PSIPMDataHeaderView.h"
#import "PSIDataHelper/RLMPSIData.h"
#import "PSIDataHelper/RLMPMData.h"
#import "HistoryVC.h"
#import "PSIDataHelper/RealmHelper.h"

@interface PSIVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblLastUpdateTimeStamp;
@property (weak, nonatomic) IBOutlet UITableView *tblPSIData;
@property (strong, nonatomic) RLMPSIData *rlmPSIData;
@property (nonatomic, assign) BOOL dataInclude;

@end
