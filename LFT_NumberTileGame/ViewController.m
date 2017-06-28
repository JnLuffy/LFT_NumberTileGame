//
//  ViewController.m
//  LFT_NumberTileGame
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "ViewController.h"
#import "LFYNumberTileGameViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)PayGameButtonTapped:(id)sender {
    LFYNumberTileGameViewController *vc = [LFYNumberTileGameViewController numberTileGameWithDimention:4 winThreshold:2048 backgroudColor:[UIColor whiteColor] scoreModule:YES buttonControls:YES swipeControls:YES];
    
    [self presentViewController:vc animated:YES completion:nil];
}


@end
