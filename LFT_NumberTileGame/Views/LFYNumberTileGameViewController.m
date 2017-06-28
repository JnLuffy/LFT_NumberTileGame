//
//  LFYNumberTileGameViewController.m
//  LFT_NumberTileGame
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "LFYNumberTileGameViewController.h"
#import "F3HScoreView.h"
#import "F3HGameboardView.h"

#define ELEMENT_SPACING 10

@interface LFYNumberTileGameViewController ()

@property (nonatomic, strong) F3HGameboardView *gameboard;

@property (nonatomic, strong) F3HScoreView *scoreView;


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
    F3HScoreView *scoreView;
    CGFloat totalHeight = 0;

    // Set up score view
    if (self.useScoreView) {
        scoreView = [F3HScoreView scoreViewWithCornerRadius:6
                                            backgroundColor:[UIColor darkGrayColor]
                                                  textColor:[UIColor whiteColor]
                                                   textFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16]];
        totalHeight += (ELEMENT_SPACING + scoreView.bounds.size.height);
        self.scoreView = scoreView;
    }
    
    
    // Create gameboard
    CGFloat padding = (self.dimension > 5) ? 3.0 : 6.0;
    CGFloat cellWidth = floorf((230 - padding*(self.dimension+1))/((float)self.dimension));
    if (cellWidth < 30) {
        cellWidth = 30;
    }
    
    F3HGameboardView * gameboard = [F3HGameboardView gameboardWithDimension:self.dimension cellWidth:cellWidth cellPadding:padding cornerRadius:6 backGroundColor:[UIColor redColor] foregroundCorlor:[UIColor darkGrayColor]];
    totalHeight += gameboard.bounds.size.height;
    
    

    // Calculate heights
    CGFloat currentTop = 0.5*(self.view.bounds.size.height - totalHeight);
    if (currentTop < 0) {
        currentTop = 0;
    }
    

    if (self.useScoreView) {
        CGRect scoreFrame = scoreView.frame;
        scoreFrame.origin.x = 0.5*(self.view.bounds.size.width - scoreFrame.size.width);
        scoreFrame.origin.y = currentTop;
        scoreView.frame = scoreFrame;
        [self.view addSubview:scoreView];
        currentTop += (scoreFrame.size.height + ELEMENT_SPACING);
    }
    
    
    CGRect gameboardFrame = gameboard.frame;
    gameboardFrame.origin.x = 0.5*(self.view.bounds.size.width - gameboardFrame.size.width);
    gameboardFrame.origin.y = currentTop;
    gameboard.frame = gameboardFrame;
    [self.view addSubview:gameboard];
    
    currentTop += (gameboardFrame.size.height + ELEMENT_SPACING);

    self.gameboard = gameboard;

    

    
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
