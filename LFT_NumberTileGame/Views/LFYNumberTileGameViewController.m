//
//  LFYNumberTileGameViewController.m
//  LFT_NumberTileGame
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "LFYNumberTileGameViewController.h"

@interface LFYNumberTileGameViewController ()

@property(nonatomic) BOOL useScoreView;
@property(nonatomic) BOOL userControlView;

@property (nonatomic) NSUInteger dimension;
@property (nonatomic) NSUInteger threshold;
@end

@implementation LFYNumberTileGameViewController


+(instancetype)numberTileGameWithDimention:(NSUInteger)dimention winThreshold:(NSUInteger)threshold  backgroudColor:(UIColor * )backgroudColor scoreModule:(BOOL) scoreModuleEnabled buttonControls:(BOOL) buttonControlsEnabled swipeControls:(BOOL) swipeControlsEnabled{
    
    LFYNumberTileGameViewController *c = [[self class] new];
    c.dimension = dimention;
    c.threshold = threshold;
    c.useScoreView = scoreModuleEnabled;
    c.userControlView = buttonControlsEnabled;
    c.view.backgroundColor = backgroudColor;
    if(swipeControlsEnabled) {
        [c setupSwipeControls];
    }
        
    return c;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view.
    [self setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
-(void)setupSwipeControls{
    
}


-(void)setupGame{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
