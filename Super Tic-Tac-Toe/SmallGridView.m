//
//  SmallGridView.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "SmallGridView.h"
#import "SmallSquareView.h"

@interface SmallGridView () {
    
    NSMutableArray *_smallViews;
}

@end

@implementation SmallGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float length = CGRectGetWidth(self.bounds)*0.3;
        float margin = CGRectGetWidth(self.bounds)*0.05;
        _smallViews = [[NSMutableArray alloc] init];
        
        for (int i=0; i<9; i++) {
            
            CGRect template = {{(length + margin)*(i%3), (length + margin)*(i/3)}, {length,length}};
            SmallSquareView *tempView = [[SmallSquareView alloc] initWithFrame:template];
            
            [_smallViews addObject:tempView];
            
            [tempView setDelegate:self];
            
            [self addSubview:tempView];
        }
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) handleTouchEventWithSmallSquareView:(id)smallSquareInstance {
    int moveLocation = [_smallViews indexOfObject:smallSquareInstance];
    int row = moveLocation/3;
    int col = moveLocation%3;
    [self.delegate handleTouchEventWithSmallGridView:self andSmallRow:row andSmallCol:col];
}

-(id)smallSquareAtRow:(int)row andCol:(int)col {
    return [_smallViews objectAtIndex:(3*row + col)];
}

@end
