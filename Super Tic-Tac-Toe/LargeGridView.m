//
//  LargeGridView.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "LargeGridView.h"

@interface LargeGridView() {
    NSMutableArray *_smallGridViews;
}

@end

@implementation LargeGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float length = CGRectGetWidth(self.bounds)*0.3;
        float margin = CGRectGetWidth(self.bounds)*0.05;
        _smallGridViews = [[NSMutableArray alloc] init];
        
        for (int i=0; i<9; i++) {
            
            CGRect template = {{(length + margin)*(i%3), (length + margin)*(i/3)}, {length,length}};
            SmallGridView *tempView = [[SmallGridView alloc] initWithFrame:template];
            
            [_smallGridViews addObject:tempView];
            
            [tempView setDelegate:self];
            
            [self addSubview:tempView];
        }
        [self setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

-(void) handleTouchEventWithSmallGridView:(id)SmallGridInstance andSmallRow:(int)sRow andSmallCol:(int)sCol {
    int moveLocation = [_smallGridViews indexOfObject:SmallGridInstance];
    int lRow = moveLocation/3;
    int lCol = moveLocation%3;
    [self.delegate handleTouchWithLargeRow:lRow andLargeCol:lCol andSmallRow:sRow andSmallCol:sCol];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id) smallGridAtRow:(int)row andCol:(int)col {
    return [_smallGridViews objectAtIndex:(3*row + col) ];
}

@end
