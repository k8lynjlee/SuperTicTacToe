//
//  SmallGridView.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallSquareView.h"

@protocol SmallGridViewDelegate

@optional

-(void) handleTouchEventWithSmallGridView: (id) SmallGridInstance andSmallRow: (int) sRow andSmallCol:(int) sCol;

@end

@interface SmallGridView : UIView <SmallSquareViewDelegate>

@property id<SmallGridViewDelegate> delegate;

-(id) smallSquareAtRow:(int) row andCol: (int) col;

@end
