//
//  PSIPMDataCell.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSIPMDataCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;

+ (PSIPMDataCell *)loadFromNib;
- (void)setDataWithName:(NSString *)name andValue:(NSString *)value;

@end
