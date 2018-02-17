//
//  CustomSpinnerView.h
//  PSIReader
//
//  Created by AyeChan PyaeSone on 17/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSpinnerView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

+ (CustomSpinnerView *)loadFromNib;
- (void)setDatawithShowIndicator:(BOOL)show;

@end
