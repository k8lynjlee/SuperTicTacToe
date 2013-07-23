//
//  SuperTicTacToeModel.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/22/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicTacToeModel.h"

typedef struct Move {
    int lRow;
    int lCol;
    int sRow;
    int sCol;
} Move;

@interface SuperTicTacToeModel : NSObject <TicTacToeModelDelegate>

@property int numberOfMovesPlayed;
@property int currentBoardIndex;

-(Player) registerMove:(Move) move;

@end
