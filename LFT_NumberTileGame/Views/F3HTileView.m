//
//  F3HTileView.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/27.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HTileView.h"
#import "F3HTileAppearanceProvider.h"


@interface F3HTileView()
@property (nonatomic) NSUInteger value;

@property (nonatomic, readonly) UIColor *defaultBackgroundColor;
@property (nonatomic, readonly) UIColor *defaultNumberColor;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation F3HTileView

+ (instancetype)tileForPositon:(CGPoint)position sideLength:(CGFloat)side value:(NSUInteger) value cornerRadius:(CGFloat) cornerRadius{
    F3HTileView *tile = [[[self class] alloc] initWithFrame:CGRectMake(position.x, position.y, side, side)];
    tile.tileValue = value;
    tile.backgroundColor = tile.defaultBackgroundColor;
    tile.numberLabel.textColor = tile.defaultNumberColor;
    tile.value = value;
    return tile;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               frame.size.width,
                                                               frame.size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.minimumScaleFactor = 0.5;
    [self addSubview:label];
    self.numberLabel = label;
    return self;
}

- (void)setDelegate:(id<F3HTileAppearanceProviderProtocol>)delegate {
    _delegate = delegate;
    if (delegate) {
        self.backgroundColor = [delegate tileColorForValue:self.tileValue];
        self.numberLabel.textColor = [delegate numberColorForValue:self.tileValue];
        self.numberLabel.font = [delegate fontForNumbers];
    }
}


-(void)setTileValue:(NSInteger)tileValue{
    _tileValue = tileValue;
    self.numberLabel.text = [@(tileValue) stringValue];
}




- (UIColor *)defaultBackgroundColor {
    return [UIColor lightGrayColor];
}

- (UIColor *)defaultNumberColor {
    return [UIColor blackColor];
}

@end
