//
//  PSIVC.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "PSIVC.h"

@interface PSIVC ()

@end

@implementation PSIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.dataInclude)
    {
        [self.navigationItem.rightBarButtonItem setTintColor:[UIColor clearColor]];
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        self.lblLastUpdateTimeStamp.text = [NSString stringWithFormat:@"History Result : %@",self.rlmPSIData.date];
        [self.tblPSIData reloadData];
    }
    else
    {
        [self loadDataFromAPI];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Implementation
- (void) loadDataFromAPI {
    
    PSIDataHelper *psiDataHelper = [[PSIDataHelper alloc] init];
    RealmHelper *realmHelper = [[RealmHelper alloc] init];
    
    [psiDataHelper loadDataWithSuccess:^(NSDictionary *dict){
        [realmHelper savePSIData:dict success:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSInteger count = [RLMPSIData allObjects].count;
                self.rlmPSIData = [RLMPSIData allObjects][count-1];
                [self.navigationItem.rightBarButtonItem setTintColor:[UIColor blueColor]];
                [self.navigationItem.rightBarButtonItem setEnabled:YES];
                self.lblLastUpdateTimeStamp.text = [NSString stringWithFormat:@"Last Result : %@",self.rlmPSIData.date];
                [self.tblPSIData reloadData];
            });
        } fail:^(NSException *exception) {
            //
        }];
        
    } networkError:^(NSError *exception) {
    }];
}

#pragma mark -  UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PSIPMDataHeaderView *vw = [PSIPMDataHeaderView loadFromNib];
    [vw setDataWithTitle:@"Region" andValue:@"PSI (hourly)"];
    return vw;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"PSIPMDataCell";
    PSIPMDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    cell = [PSIPMDataCell loadFromNib];
 
    switch (indexPath.row) {
            
            case 0:
            [cell setDataWithName:@"National" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.national]];
            return cell;
            case 1:
            [cell setDataWithName:@"South" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.south]];
             return cell;
            case 2:
            [cell setDataWithName:@"North" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.north]];
             return cell;
            case 3:
            [cell setDataWithName:@"Central" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.central]];
             return cell;
            case 4:
            [cell setDataWithName:@"East" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.east]];
             return cell;
            case 5:
            [cell setDataWithName:@"West" andValue:[NSString stringWithFormat:@"%ld",self.rlmPSIData.west]];
             return cell;
            break;
            
        default:
            break;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"PSItoHistory"])
    {
        // Get reference to the destination view controller
        HistoryVC *vc = [segue destinationViewController];
        
        vc.fromPSI = YES;
    }
}

@end
