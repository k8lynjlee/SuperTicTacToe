//
//  SuperTicTacToeModel.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/22/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "SuperTicTacToeModel.h"

@interface SuperTicTacToeModel() {
    NSMutableArray *_ticTacToeModels;
    TicTacToeModel *_largeModel;
}

@end

@implementation SuperTicTacToeModel

- (id)init
{
    self = [super init];
    if (self) {
        _currentBoardIndex = 0;
        _numberOfMovesPlayed = 0;
        
        _ticTacToeModels = [[NSMutableArray alloc] init];
        _largeModel = [[TicTacToeModel alloc] init];
        for (int i=0; i<9; i++) {
            TicTacToeModel *tempModel = [[TicTacToeModel alloc] init];
            [_ticTacToeModels addObject:tempModel];
        }
    }
    return self;
}

-(Player) registerMove:(Move) move{
    if(![self moveIsLegal:move]) {
        return none;
    }
    int largeGridLocation = move.lRow*3 + move.lCol;
    
    TicTacToeModel *currentBoard = [_ticTacToeModels objectAtIndex:largeGridLocation];
    Player justMoved = [currentBoard playInRow:move.sRow andCol:move.sCol andPlayer:(_numberOfMovesPlayed%2 +1)];
    if(justMoved!=0) {
        _numberOfMovesPlayed++;
        //DRAW SOMETHING
    }
    return justMoved;
}

-(BOOL) moveIsLegal:(Move) move {
    BOOL correctBoard = ((move.lRow*3 + move.lCol) || _numberOfMovesPlayed==0);
    BOOL givenBoardOccupied = _currentBoardIndex == (move.lRow*3 + move.lRow);
    BOOL chosenBoardFree = [_largeModel playerAtRow:move.lRow andCol:move.lCol] == 0;
    return chosenBoardFree && (correctBoard || givenBoardOccupied);
}

-(void)registerWinnerWithTicTacToeModel: (id) ticTacToeInstance andPlayer: (Player) player {
    int wonBoardLocation = [_ticTacToeModels indexOfObject:ticTacToeInstance];
    [_largeModel playerAtRow:(wonBoardLocation/3) andCol:(wonBoardLocation%3)];
}

@end
