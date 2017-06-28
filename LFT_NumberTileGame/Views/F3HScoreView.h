//
//  F3HScoreView.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/26.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface F3HScoreView : UIView
@property (nonatomic) NSInteger score;

+ (instancetype)scoreViewWithCornerRadius:(CGFloat) radius backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

@end
