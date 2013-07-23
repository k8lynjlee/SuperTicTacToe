//
//  SmallSquareView.h
//  Super Tic-Tac-Toe
//
//  Created by Ashwin Murthy on 7/19/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SmallSquareViewDelegate

@optional
-(void) handleTouchEventWithSmallSquareView: (id) smallSquareInstance;

@end

struct Move;

typedef enum imageOnView {
    NoImage = 0,
    SeashellImage = 1,
    StarfishImage = 2
}imageOnView;

@interface SmallSquareView : UIView

@property imageOnView currentImage;
@property id<SmallSquareViewDelegate> delegate;

-(void) drawStarfish;
-(void) drawSeashell;
-(void) removeImage;

@end
