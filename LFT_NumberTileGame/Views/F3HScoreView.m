//
//  F3HScoreView.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/26.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HScoreView.h"

#define DEFAULT_FRAME CGRectMake(0, 0, 140, 40)


@interface F3HScoreView()
@property (nonatomic, strong) UILabel *scoreLabel;
@end

@implementation F3HScoreView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:frame];
    [self addSubview:scoreLabel];
    self.scoreLabel = scoreLabel;
    return self;
}



+ (instancetype)scoreViewWithCornerRadius:(CGFloat) radius backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textFont:(UIFont *)textFont{
    
    F3HScoreView *view = [[[self class]alloc] initWithFrame:DEFAULT_FRAME];
    view.score = 0;
    view.layer.cornerRadius = radius;
    view.backgroundColor = color ? : [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    if(textColor){
        view.scoreLabel.textColor = textColor;
    }
    if(textFont){
        view.scoreLabel.font = textFont;
    }
    
    return view;
    
    
    return self;
}

-(void)setScore:(NSInteger)score{
    _score = score;
    
}

@end
