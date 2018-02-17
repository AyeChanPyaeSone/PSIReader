//
//  ViewController.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSIDataHelper/PSIDataHelper.h"
#import "PSIPMDataCell.h"
#import "PSIPMDataHeaderView.h"
#import "PSIDataHelper/RLMPSIData.h"
#import "PSIDataHelper/RLMPMData.h"
#import "CustomIOSAlertView.h"
#import "CustomSpinnerView.h"

@interface HomeVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lblLastUpdateTimeStamp;
@property (weak, nonatomic) IBOutlet UITableView *tblPSIData;
@property (strong, nonatomic) CustomIOSAlertView *customIOSAlertViewWithIndicator;
@property (strong, nonatomic) CustomIOSAlertView *customIOSAlertViewWithoutIndicator;

- (void)loadDataFromAPI;

@end

