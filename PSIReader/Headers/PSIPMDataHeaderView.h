//
//  PSIPMDataHeaderView.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSIPMDataHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;

+ (PSIPMDataHeaderView *)loadFromNib;
- (void)setDataWithTitle:(NSString *)title andValue:(NSString *)value;

@end
