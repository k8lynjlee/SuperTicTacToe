//
//  TicTacToeModel.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Player  {
    none = 0,
    playerOne = 1,
    playerTwo = 2
} Player;

@protocol TicTacToeModelDelegate

@optional

-(void)registerWinnerWithTicTacToeModel: (id) ticTacToeInstance andPlayer: (Player) player;
-(void)boardHasBeenFilled: (id) ticTacToeInstance;
-(void)boardHasBeenWon: (id) ticTacToeInstance withPlayer: (Player) player;

@end

@interface TicTacToeModel : NSObject

-(Player) playerAtRow: (int) row andCol: (int) col;
-(Player) playInRow: (int) row andCol: (int) col andPlayer: (Player) player;
-(Player) checkForWinner;
-(BOOL) boardFull;

@property id<TicTacToeModelDelegate> delegate;

@end
