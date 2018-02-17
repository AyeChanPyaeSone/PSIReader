//
//  ViewController.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "HomeVC.h"
#import "Keys.h"
#import <Obfuscator/Obfuscator.h>
#import "PSIDataHelper/RealmHelper.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customIOSAlertViewWithIndicator = [[CustomIOSAlertView alloc] init];
    self.customIOSAlertViewWithoutIndicator = [[CustomIOSAlertView alloc] init];
    
    [self loadDataFromAPI];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Implementaion
- (void)loadDataFromAPI {
    
    PSIDataHelper *psiDataHelper = [[PSIDataHelper alloc] init];
    RealmHelper *realmHelper = [[RealmHelper alloc] init];
    
    [psiDataHelper loadDataWithSuccess:^(NSDictionary *dict){
        [realmHelper savePSIPMData:dict success:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.customIOSAlertViewWithIndicator close];
                [self.customIOSAlertViewWithoutIndicator close];
                RLMPMData *rlmPMData = [RLMPMData allObjects][[RLMPMData allObjects].count -1];
                self.lblLastUpdateTimeStamp.text = [NSString stringWithFormat:@"Last Result : %@",rlmPMData.date];
                [self.tblPSIData reloadData];
            });
        } fail:^(NSException *exception) {
            //
        }];
       
    } networkError:^(NSError *exception) {
        [self showCustomAertViewWithoutIndicator];
    }];
}

- (void)showCustomAertViewWithoutIndicator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CustomSpinnerView *customSpinnerView = [CustomSpinnerView loadFromNib];
        [customSpinnerView setDatawithShowIndicator:NO];
        [self.customIOSAlertViewWithoutIndicator setButtonTitles:[NSMutableArray arrayWithObjects:@"Cancel", @"Retry", nil]];
        __weak typeof(self) weakSelf = self;
        [self.customIOSAlertViewWithoutIndicator setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            if(buttonIndex == 1 )
            {
                [weakSelf showCustomAertViewWithIndicator];
            }
        }];
  
    [self.customIOSAlertViewWithoutIndicator setContainerView:customSpinnerView];
    [self.customIOSAlertViewWithoutIndicator show];

    });
}

- (void)showCustomAertViewWithIndicator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CustomSpinnerView *customSpinnerView = [CustomSpinnerView loadFromNib];
        [customSpinnerView setDatawithShowIndicator:YES];
        [self.customIOSAlertViewWithIndicator setContainerView:customSpinnerView];
        [self.customIOSAlertViewWithIndicator show];
         __weak typeof(self) weakSelf = self;
        [self.customIOSAlertViewWithIndicator setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [NSObject cancelPreviousPerformRequestsWithTarget:weakSelf];
            [alertView close];
        }];
        
        [self performSelector:@selector(loadDataFromAPI) withObject:nil afterDelay:3.0 ];
    });
}

#pragma mark -  UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PSIPMDataHeaderView *vw = [PSIPMDataHeaderView loadFromNib];
    [vw setDataWithTitle:@"Current location" andValue:@"Singapore"];
    return vw;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([RLMPSIData allObjects].count > 0 && [RLMPMData allObjects].count > 0) {
        return 2;
    }
    else {
        return 0;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *cellIdentifier = @"PSIPMDataCell";
    PSIPMDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
        cell = [PSIPMDataCell loadFromNib];
    
    if(indexPath.row == 0) {
        RLMPSIData *rlmPSIData = [RLMPSIData allObjects][[RLMPSIData allObjects].count -1];
        [cell setDataWithName:@"PSI" andValue:[NSString stringWithFormat:@"%ld",rlmPSIData.national]];
    }
    else if (indexPath.row == 1) {
        RLMPMData *rlmPMData = [RLMPMData allObjects][[RLMPMData allObjects].count -1];
        [cell setDataWithName:@"PM" andValue:[NSString stringWithFormat:@"%ld",rlmPMData.national]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark -  UIActions
- (IBAction)clickedRefresh:(id)sender {
    [self loadDataFromAPI];
}

@end
