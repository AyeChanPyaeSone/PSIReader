//
//  HistoryVC.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 16/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "HistoryVC.h"

@interface HistoryVC ()

@end

@implementation HistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fromPSI ?  [RLMPSIData allObjects].count : [RLMPMData allObjects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *value;
    if(self.fromPSI) {
        RLMPSIData *rlmPSIData = [RLMPSIData allObjects][indexPath.row];
        value  = rlmPSIData.date;
    }
    else {
        RLMPMData *rlmPMData = [RLMPMData allObjects][indexPath.row];
        value  = rlmPMData.date;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Date %@",value];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if(self.fromPSI) {
        RLMPSIData *rlmPSIData = [RLMPSIData allObjects][indexPath.row];
        PSIVC *psiVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PSIVC"];
        psiVC.rlmPSIData = rlmPSIData;
        psiVC.dataInclude = YES;
        [self.navigationController pushViewController:psiVC animated:YES];
    }
    else {
        RLMPMData *rlmPMData = [RLMPMData allObjects][indexPath.row];
        PM25VC *pm25VC = [self.storyboard instantiateViewControllerWithIdentifier:@"PM25VC"];
        pm25VC.rlmPMData = rlmPMData;
        pm25VC.dataInclude = YES;
        [self.navigationController pushViewController:pm25VC animated:YES];
    }
}

@end
