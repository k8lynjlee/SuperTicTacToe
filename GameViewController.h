//
//  GameViewController.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LargeGridView.h"
#import "SuperTicTacToeModel.h"
@interface GameViewController : UIViewController <LargeGridViewDelegate>

@property LargeGridView *largeGrid;
@property SuperTicTacToeModel *superTicTacToeModel;

-(id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil;


@end
