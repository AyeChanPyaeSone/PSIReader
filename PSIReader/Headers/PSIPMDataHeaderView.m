//
//  PSIPMDataHeaderView.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "PSIPMDataHeaderView.h"

@implementation PSIPMDataHeaderView

+ (PSIPMDataHeaderView *)loadFromNib
{
    PSIPMDataHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"PSIPMDataHeaderView"
                                                         owner:nil
                                                       options:nil] lastObject];
    
    return view;
}

- (void)setDataWithTitle:(NSString *)title andValue:(NSString *)value {
    self.lblTitle.text = title;
    self.lblValue.text = value;
}

@end
