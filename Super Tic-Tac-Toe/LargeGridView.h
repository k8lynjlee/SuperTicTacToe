//
//  LargeGridView.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallGridView.h"

@protocol LargeGridViewDelegate

@optional

-(void) handleTouchWithLargeRow: (int) lRow andLargeCol: (int) lCol andSmallRow:(int) sRow andSmallCol: (int)sCol;

@end




@interface LargeGridView : UIView <SmallGridViewDelegate>

@property id<LargeGridViewDelegate> delegate;

-(id) smallGridAtRow: (int) row andCol:(int) col;

@end
