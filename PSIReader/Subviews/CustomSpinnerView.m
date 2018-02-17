//
//  CustomSpinnerView.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 17/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "CustomSpinnerView.h"

@implementation CustomSpinnerView

+ (CustomSpinnerView *)loadFromNib {
    CustomSpinnerView *view = [[[NSBundle mainBundle] loadNibNamed:@"CustomSpinnerView"
                                                               owner:nil
                                                             options:nil] lastObject];
    
    return view;
}

- (void)setDatawithShowIndicator:(BOOL)show {
    
    if(show)
    {
        self.lblTitle.text = @"Query in progress...";
        self.activityIndicator.hidden = NO;
        
    }
    else
    {
        self.lblTitle.text = @"Network timeout. \n Do you want to try?";
        self.activityIndicator.hidden = YES;
    }
}

@end
