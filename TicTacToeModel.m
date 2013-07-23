//
//  TicTacToeModel.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "TicTacToeModel.h"

@interface TicTacToeModel () {

    int _playedMovesArray[9];
    int counter;
    int winner;
}

@end

@implementation TicTacToeModel

-(Player) playInRow: (int) row andCol: (int) col andPlayer: (Player) player{
    int moveLocation = row*3 + col;
    
    if(_playedMovesArray[moveLocation]!=0) {
        return none;
    }
    
    _playedMovesArray[moveLocation] = player;
    if ([self boardFull]) { [self.delegate boardHasBeenFilled:self]; }
    if ([self checkForWinner]!=0) { [self.delegate boardHasBeenWon:self withPlayer:[self checkForWinner]]; }
    
    return player;
}

-(Player) playerAtRow:(int)row andCol:(int)col {
    return _playedMovesArray[row*3 + col];
}

-(Player) checkForWinner {
    for (int i=0; i<3; i++) {
        if(_playedMovesArray[3*i]>0 && _playedMovesArray[3*i + 1]==_playedMovesArray[3*i] && _playedMovesArray[3*i]==_playedMovesArray[3*i + 2]) {
            return _playedMovesArray[3*i];
        }
        if(_playedMovesArray[i]>0 && _playedMovesArray[i + 1]==_playedMovesArray[i] && _playedMovesArray[i]==_playedMovesArray[i + 2]) {
            return _playedMovesArray[3*i];
        }
    }
    return none;
}

-(BOOL) boardFull {
    for (int i=0; i<9; i++) {
        if(_playedMovesArray[i]==0) {
            return false;
        }
    }
    return true;
}

@end
