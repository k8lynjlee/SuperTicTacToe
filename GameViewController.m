//
//  GameViewController.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _superTicTacToeModel = [[SuperTicTacToeModel alloc] init];
        
        _largeGrid = [[LargeGridView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds)) ];
        
        [_largeGrid setDelegate:self];
        [self.view addSubview:_largeGrid];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handleTouchWithLargeRow:(int)lRow andLargeCol:(int)lCol andSmallRow:(int)sRow andSmallCol:(int)sCol {
     Move move = {lRow,lCol,sRow,sCol};
     Player justPlayed = [_superTicTacToeModel registerMove:move];
    
    if(justPlayed) {
        SmallGridView *currentGridView = [_largeGrid smallGridAtRow:lRow andCol:lCol];
        SmallSquareView *currentSquareView = [currentGridView smallSquareAtRow:sRow andCol:sCol];
        if (justPlayed==playerOne) {
            [currentSquareView drawSeashell];
        } else {
            [currentSquareView drawStarfish];
        }
    }
}

@end
