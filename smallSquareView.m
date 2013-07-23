//
//  SmallSquareView.m
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "SmallSquareView.h"

@interface SmallSquareView () {
    UIColor *defaultBackgroundColor;
}

@end

@implementation SmallSquareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        defaultBackgroundColor = [UIColor blueColor];
        [self drawRect:self.bounds];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:defaultBackgroundColor];
    switch(_currentImage) {
        case SeashellImage:{
            UIImage *img = [UIImage imageNamed:@"orange_seashell.png"];
            [img drawInRect:self.bounds];
            break;
        }
        case StarfishImage: {
            UIImage *img = [UIImage imageNamed:@"starfish.png"];
            [img drawInRect:self.bounds];
            break;
        }
        default : {
            break;
        }
    }
}


-(void) removeImage {
    [self setNeedsDisplay];
}

-(void) drawSeashell {
    _currentImage = SeashellImage;
    [self setNeedsDisplay];
}

-(void) drawStarfish {
    _currentImage = StarfishImage;
    [self setNeedsDisplay];

}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if([touches count]!=1) {
        return;
    }
    [self.delegate handleTouchEventWithSmallSquareView:self];
}
@end
