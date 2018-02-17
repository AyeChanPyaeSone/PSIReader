//
//  PSIPMDataCell.m
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import "PSIPMDataCell.h"

@implementation PSIPMDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (PSIPMDataCell *)loadFromNib
{
    PSIPMDataCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PSIPMDataCell"
                                                                      owner:nil
                                                                    options:nil] lastObject];
    
    return cell;
}

- (void)setDataWithName:(NSString *)name andValue:(NSString *)value {
    self.lblName.text = name;
    self.lblValue.text = value;
}

@end
