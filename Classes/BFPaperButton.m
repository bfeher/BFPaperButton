//
//  BFPaperButton.m
//  BFPaperKit
//
//  Created by Bence Feher on 7/11/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Bence Feher
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "BFPaperButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+BFPaperColors.h"


@interface BFPaperButton ()
@property CGRect downRect;
@property CGRect upRect;
@property CGPoint tapPoint;
@property BOOL letGo;
@property BOOL growthFinished;
//@property UIView *animationsView;
@property CALayer *backgroundColorFadeLayer;
@property NSMutableArray *rippleAnimationQueue;
@property NSMutableArray *deathRowForCircleLayers;  // This is where old circle layers go to be killed :(
@end

@implementation BFPaperButton
CGFloat const bfPaperButton_tapCircleDiameterDefault = -1.f;
// Constants used for tweaking the look/feel of:
// -shadow radius:
static CGFloat const bfPaperButton_loweredShadowRadius             = 1.5f;
static CGFloat const bfPaperButton_raisedShadowRadius              = 4.5f;
// -shadow location:
static CGFloat const bfPaperButton_loweredShadowYOffset            = 1.f;
static CGFloat const bfPaperButton_raisedShadowYOffset             = 4.f;
//static const CGFloat loweredShadowXOffset            = 0.f;
static CGFloat const bfPaperButton_raisedShadowXOffset             = 2.f;
// -shadow opacity:
static CGFloat const bfPaperButton_loweredShadowOpacity            = 0.5f;
static CGFloat const bfPaperButton_raisedShadowOpacity             = 0.5f;
// -animation durations:
static CGFloat const bfPaperButton_animationDurationConstant       = 0.12f;
static CGFloat const bfPaperButton_tapCircleGrowthDurationConstant = bfPaperButton_animationDurationConstant * 2;
// -the tap-circle's size:
static CGFloat const bfPaperButton_tapCircleDiameterStartValue     = 5.f;    // for the mask
// -the tap-circle's beauty:
static CGFloat const bfPaperButton_tapFillConstant                 = 0.16f;
static CGFloat const bfPaperButton_clearBGTapFillConstant          = 0.12f;
static CGFloat const bfPaperButton_clearBGFadeConstant             = 0.12f;

#define BFPAPERBUTTON__DUMB_TAP_FILL_COLOR             [UIColor colorWithWhite:0.1 alpha:bfPaperButton_tapFillConstant]
#define BFPAPERBUTTON__CLEAR_BG_DUMB_TAP_FILL_COLOR    [UIColor colorWithWhite:0.3 alpha:bfPaperButton_clearBGTapFillConstant]
#define BFPAPERBUTTON__CLEAR_BG_DUMB_FADE_COLOR        [UIColor colorWithWhite:0.3 alpha:1]


#pragma mark - Default Initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupRaised:YES];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:YES];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self setupRaised:YES];
    }
    return self;
}

#pragma mark - Custom Initializers
- (instancetype)initWithRaised:(BOOL)raised
{
    self = [super init];
    if (self) {
        [self setupRaised:raised];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame raised:(BOOL)raised
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:raised];
    }
    return self;
}

#pragma mark Deprecated Initializers
- (instancetype)initRaised
{
    self = [super init];
    if (self) {
        [self setupRaised:YES];
    }
    return self;
}

- (instancetype)initRaisedWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:YES];
    }
    return self;
}

- (instancetype)initFlat
{
    self = [super init];
    if (self) {
        [self setupRaised:NO];
    }
    return self;
}

- (instancetype)initFlatWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:NO];
    }
    return self;
}


#pragma mark - Parent Overrides
- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];

    if (self.isRaised) {
        if (!enabled) {
            self.layer.shadowOpacity = 0;
        }
        else {
            self.layer.shadowOpacity = bfPaperButton_loweredShadowOpacity;
        }
    }
    [self setNeedsDisplay];
}

- (void)sizeToFit
{
    [super sizeToFit];
    if (self.isRaised) {
        self.downRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + bfPaperButton_loweredShadowYOffset);
        self.upRect = CGRectMake(0 - bfPaperButton_raisedShadowXOffset, self.bounds.origin.y + bfPaperButton_raisedShadowYOffset, self.bounds.size.width + (2 * bfPaperButton_raisedShadowXOffset), self.bounds.size.height + bfPaperButton_raisedShadowYOffset);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
    }
}


#pragma mark - Setup
- (void)setupRaised:(BOOL)isRaised
{
    self.isRaised = isRaised;
    
    // Default setup:
    self.usesSmartColor = YES;
    self.cornerRadius = bfPaperButton_loweredShadowRadius;
    self.tapCircleDiameter = bfPaperButton_tapCircleDiameterDefault;
    self.rippleFromTapLocation = YES;
    self.rippleBeyondBounds = NO;
    
    self.rippleAnimationQueue = [NSMutableArray array];
    self.deathRowForCircleLayers = [NSMutableArray array];
    
    CGRect endRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.frame.size.width, self.frame.size.height);
    //NSLog(@"endRect in setup = (%0.2f, %0.2f, %0.2f %0.2f", endRect.origin.x, endRect.origin.y, endRect.size.width, endRect.size.height);
    //NSLog(@"cornerRadius = %0.2f", self.cornerRadius);
    self.backgroundColorFadeLayer = [[CALayer alloc] init];
    self.backgroundColorFadeLayer.frame = endRect;
    self.backgroundColorFadeLayer.cornerRadius = self.cornerRadius;
    self.backgroundColorFadeLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer insertSublayer:self.backgroundColorFadeLayer atIndex:0];
    
    self.layer.masksToBounds = NO;
    self.clipsToBounds = NO;
    
    self.tapCircleColor = nil;
    self.backgroundFadeColor = nil;
    
    if (self.isRaised) {
        // Draw shadow
        self.downRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + bfPaperButton_loweredShadowYOffset);
        self.upRect = CGRectMake(0 - bfPaperButton_raisedShadowXOffset, self.bounds.origin.y + bfPaperButton_raisedShadowYOffset, self.bounds.size.width + (2 * bfPaperButton_raisedShadowXOffset), self.bounds.size.height + bfPaperButton_raisedShadowYOffset);
        
//        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor colorWithWhite:0.2f alpha:1.f].CGColor;
        self.layer.shadowOpacity = bfPaperButton_loweredShadowOpacity;
        self.layer.shadowRadius = bfPaperButton_loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.0f);
    }
    else {
        // Erase shadow:
        self.layer.shadowOpacity = 0.f;
    }
    
    [self addTarget:self action:@selector(paperTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchCancel];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    tapGestureRecognizer.delegate = self;
    [self addGestureRecognizer:tapGestureRecognizer];
}


#pragma mark - Setters:
- (void)setIsRaised:(BOOL)isRaised
{
    _isRaised = isRaised;
    self.downRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + bfPaperButton_loweredShadowYOffset);
    self.upRect = CGRectMake(0 - bfPaperButton_raisedShadowXOffset, self.bounds.origin.y + bfPaperButton_raisedShadowYOffset, self.bounds.size.width + (2 * bfPaperButton_raisedShadowXOffset), self.bounds.size.height + bfPaperButton_raisedShadowYOffset);
    
    if (_isRaised) {
        // Draw shadow
        self.layer.shadowColor = [UIColor colorWithWhite:0.2f alpha:1.f].CGColor;
        self.layer.shadowOpacity = bfPaperButton_loweredShadowOpacity;
        self.layer.shadowRadius = bfPaperButton_loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.0f);
    }
    else {
        // Erase shadow:
        self.layer.shadowOpacity = 0.f;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
    self.backgroundColorFadeLayer.cornerRadius = _cornerRadius;

    if (self.isRaised) {
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
    }
    [self layoutSubviews];
}

- (void)setTitleFont:(UIFont *)font
{
    if (_titleFont != font) {
        _titleFont = font;
        self.titleLabel.font = font;
    }
}

- (void)setRippleFromTapLocation:(BOOL)rippleFromTapLocation
{
    if (_rippleFromTapLocation != rippleFromTapLocation) {
        _rippleFromTapLocation = rippleFromTapLocation;
        
        /* Should I enforce this?
        // Do not allow rippling beyond bounds when tracking touch location. Seriously this just looks terrible ;P
        if (_rippleFromTapLocation) {
            _rippleBeyondBounds = NO;
        }*/
    }
}

- (void)setRippleBeyondBounds:(BOOL)rippleBeyondBounds
{
    if (_rippleBeyondBounds != rippleBeyondBounds) {
        _rippleBeyondBounds = rippleBeyondBounds;
        
        /* Should I enforce this?
        // Do not allow tracking touch location when rippling beyond bounds. Seriously this just looks terrible ;P
        if (_rippleBeyondBounds) {
            _rippleFromTapLocation = NO;
        }*/
    }
}


#pragma mark - Gesture Recognizer Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    CGPoint location = [touch locationInView:self];
    //NSLog(@"location: x = %0.2f, y = %0.2f", location.x, location.y);
    
    self.tapPoint = location;
    
    return NO;  // Disallow recognition of tap gestures. We just needed this to grab that tasty tap location.
}


#pragma mark - IBAction Callback Handlers
- (void)paperTouchDown:(id)sender
{
    //NSLog(@"Touch down handler");
    self.letGo = NO;
    self.growthFinished = NO;
    
    [self growTapCircle];
}


- (void)paperTouchUp:(id)sender
{
    //NSLog(@"Touch Up handler");
    self.letGo = YES;
    
    if (self.growthFinished) {
        [self growTapCircleABit];
    }
    [self fadeTapCircleOut];
    [self fadeBGOutAndBringShadowBackToStart];
}


#pragma mark - Animation
- (void)animationDidStop:(CAAnimation *)theAnimation2 finished:(BOOL)flag
{
    //NSLog(@"animation ENDED");
    self.growthFinished = YES;
    
    if ([[theAnimation2 valueForKey:@"id"] isEqualToString:@"fadeCircleOut"]) {
        [[self.deathRowForCircleLayers objectAtIndex:0] removeFromSuperlayer];
        if (self.deathRowForCircleLayers.count > 0) {
            [self.deathRowForCircleLayers removeObjectAtIndex:0];
        }
    }
    else if ([[theAnimation2 valueForKey:@"id"] isEqualToString:@"removeFadeBackgroundDarker"]) {
        self.backgroundColorFadeLayer.backgroundColor = [UIColor clearColor].CGColor;
    }
}


- (void)growTapCircle
{
    //NSLog(@"expanding a tap circle");
    if (self.isRaised) {
        // Increase shadow radius:
        CABasicAnimation *increaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        increaseRadius.fromValue = [NSNumber numberWithFloat:bfPaperButton_loweredShadowRadius];
        increaseRadius.toValue = [NSNumber numberWithFloat:bfPaperButton_raisedShadowRadius];
        increaseRadius.duration = bfPaperButton_animationDurationConstant;
        increaseRadius.fillMode = kCAFillModeForwards;
        increaseRadius.removedOnCompletion = NO;
        
        // Change its frame a bit larger and shift it down a bit:
        CABasicAnimation *shadowAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        shadowAnimation.duration = bfPaperButton_animationDurationConstant;
        shadowAnimation.fromValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        shadowAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.upRect cornerRadius:self.cornerRadius].CGPath;
        shadowAnimation.fillMode = kCAFillModeForwards;
        shadowAnimation.removedOnCompletion = NO;
        
        // Lighten the shadow opacity:
        CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        shadowOpacityAnimation.duration = bfPaperButton_animationDurationConstant;
        shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:bfPaperButton_loweredShadowOpacity];
        shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:bfPaperButton_raisedShadowOpacity];
        shadowOpacityAnimation.fillMode = kCAFillModeBackwards;
        shadowOpacityAnimation.removedOnCompletion = NO;
        
        [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
        [self.layer addAnimation:increaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    }
    
    // Spawn a growing circle that "ripples" through the button:
    
    CGRect endRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.frame.size.width, self.frame.size.height);
    
    if ([UIColor isColorClear:self.backgroundColor]) {
        // CLEAR BACKROUND SHOULD ONLY BE FOR FLAT BUTTONS!!!
        
        // Set the fill color for the tap circle (self.animationLayer's fill color):
        if (!self.tapCircleColor) {
            self.tapCircleColor = self.usesSmartColor ? [self.titleLabel.textColor colorWithAlphaComponent:bfPaperButton_clearBGTapFillConstant] : BFPAPERBUTTON__CLEAR_BG_DUMB_TAP_FILL_COLOR;
        }
        
        if (!self.backgroundFadeColor) {
            self.backgroundFadeColor = self.usesSmartColor ? self.titleLabel.textColor : BFPAPERBUTTON__CLEAR_BG_DUMB_FADE_COLOR;
        }
        
        // Setup background fade layer:
        self.backgroundColorFadeLayer.frame = endRect;
        //NSLog(@"endRect in animation = (%0.2f, %0.2f, %0.2f %0.2f", endRect.origin.x, endRect.origin.y, endRect.size.width, endRect.size.height);
        self.backgroundColorFadeLayer.cornerRadius = self.cornerRadius;
        self.backgroundColorFadeLayer.backgroundColor = self.backgroundFadeColor.CGColor;
        
        // Fade the background color a bit darker:
        CABasicAnimation *fadeBackgroundDarker = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeBackgroundDarker.duration = bfPaperButton_animationDurationConstant;
        fadeBackgroundDarker.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        fadeBackgroundDarker.fromValue = [NSNumber numberWithFloat:0.f];
        fadeBackgroundDarker.toValue = [NSNumber numberWithFloat:bfPaperButton_clearBGFadeConstant];
        fadeBackgroundDarker.fillMode = kCAFillModeForwards;
        fadeBackgroundDarker.removedOnCompletion = NO;
        
        [self.backgroundColorFadeLayer addAnimation:fadeBackgroundDarker forKey:@"animateOpacity"];
    }
    else {
        // COLORED BACKGROUNDS (can be smart or dumb):
        
        // Set the fill color for the tap circle (self.animationLayer's fill color):
        if (!self.tapCircleColor) {
            self.tapCircleColor = self.usesSmartColor ? [self.titleLabel.textColor colorWithAlphaComponent:bfPaperButton_tapFillConstant] : BFPAPERBUTTON__DUMB_TAP_FILL_COLOR;
        }
    }
    
    
    
    // Calculate the tap circle's ending diameter:
    CGFloat tapCircleFinalDiameter = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;

    // Create a UIView which we can modify for its frame value later (specifically, the ability to use .center):
    UIView *tapCircleLayerSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleFinalDiameter, tapCircleFinalDiameter)];
    tapCircleLayerSizerView.center = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

    // Calculate starting path:
    UIView *startingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bfPaperButton_tapCircleDiameterStartValue, bfPaperButton_tapCircleDiameterStartValue)];
    startingRectSizerView.center = tapCircleLayerSizerView.center;
    
    // Create starting circle path:
    UIBezierPath *startingCirclePath = [UIBezierPath bezierPathWithRoundedRect:startingRectSizerView.frame cornerRadius:bfPaperButton_tapCircleDiameterStartValue / 2.f];
    
    // Calculate ending path:
    UIView *endingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleFinalDiameter, tapCircleFinalDiameter)];
    endingRectSizerView.center = tapCircleLayerSizerView.center;
    
    // Create ending circle path:
    UIBezierPath *endingCirclePath = [UIBezierPath bezierPathWithRoundedRect:endingRectSizerView.frame cornerRadius:tapCircleFinalDiameter / 2.f];

    // Create tap circle:
    CAShapeLayer *tapCircle = [CAShapeLayer layer];
    tapCircle.fillColor = self.tapCircleColor.CGColor;
    tapCircle.strokeColor = [UIColor clearColor].CGColor;
    tapCircle.borderColor = [UIColor clearColor].CGColor;
    tapCircle.borderWidth = 0;
    tapCircle.path = startingCirclePath.CGPath;
    
    // Create a mask if we are not going to ripple over bounds:
    if (!self.rippleBeyondBounds) {
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.cornerRadius].CGPath;
        mask.fillColor = [UIColor blackColor].CGColor;
        mask.strokeColor = [UIColor clearColor].CGColor;
        mask.borderColor = [UIColor clearColor].CGColor;
        mask.borderWidth = 0;
        
        // Set tap circle layer's mask to the mask:
        tapCircle.mask = mask;
    }

    // Add tap circle to array and view:
    [self.rippleAnimationQueue addObject:tapCircle];
    [self.layer insertSublayer:tapCircle above:self.backgroundColorFadeLayer];
    
    
    /*
     * Animations:
     */
    // Grow tap-circle animation (performed on mask layer):
    CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    tapCircleGrowthAnimation.delegate = self;
    [tapCircleGrowthAnimation setValue:@"tapGrowth" forKey:@"id"];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    tapCircleGrowthAnimation.duration = bfPaperButton_tapCircleGrowthDurationConstant;
    tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    tapCircleGrowthAnimation.fromValue = (__bridge id)startingCirclePath.CGPath;
    tapCircleGrowthAnimation.toValue = (__bridge id)endingCirclePath.CGPath;
    tapCircleGrowthAnimation.fillMode = kCAFillModeForwards;
    tapCircleGrowthAnimation.removedOnCompletion = NO;
    
    // Fade in self.animationLayer:
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.duration = bfPaperButton_animationDurationConstant;
    fadeIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fadeIn.fromValue = [NSNumber numberWithFloat:0.f];
    fadeIn.toValue = [NSNumber numberWithFloat:1.f];
    fadeIn.fillMode = kCAFillModeForwards;
    fadeIn.removedOnCompletion = NO;
    
    // Add the animations to the layers:
    [tapCircle addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
    [tapCircle addAnimation:fadeIn forKey:@"opacityAnimation"];
}


- (void)fadeBGOutAndBringShadowBackToStart
{
   // NSLog(@"fading bg");
    
    if (self.isRaised) {
        // Decrease shadow radius:
        CABasicAnimation *decreaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        decreaseRadius.fromValue = [NSNumber numberWithFloat:bfPaperButton_raisedShadowRadius];
        decreaseRadius.toValue = [NSNumber numberWithFloat:bfPaperButton_loweredShadowRadius];
        decreaseRadius.duration = bfPaperButton_animationDurationConstant;
        decreaseRadius.fillMode = kCAFillModeForwards;
        decreaseRadius.removedOnCompletion = NO;
        
        // Move shadow back up a bit and shrink it a bit:
        CABasicAnimation *shadowAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        shadowAnimation.duration = bfPaperButton_animationDurationConstant;
        shadowAnimation.fromValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.upRect cornerRadius:self.cornerRadius].CGPath;
        shadowAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        shadowAnimation.fillMode = kCAFillModeForwards;
        shadowAnimation.removedOnCompletion = NO;
        
        // Darken shadow opacity:
        CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        shadowOpacityAnimation.duration = bfPaperButton_animationDurationConstant;
        shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:bfPaperButton_raisedShadowOpacity];
        shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:bfPaperButton_loweredShadowOpacity];
        shadowOpacityAnimation.fillMode = kCAFillModeBackwards;
        shadowOpacityAnimation.removedOnCompletion = NO;
        
        [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
        [self.layer addAnimation:decreaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    }
    
    if ([UIColor isColorClear:self.backgroundColor]) {
        // Remove darkened background fade:
        CABasicAnimation *removeFadeBackgroundDarker = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [removeFadeBackgroundDarker setValue:@"removeFadeBackgroundDarker" forKey:@"id"];
        removeFadeBackgroundDarker.delegate = self;
        removeFadeBackgroundDarker.duration = bfPaperButton_animationDurationConstant;
        removeFadeBackgroundDarker.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        removeFadeBackgroundDarker.fromValue = [NSNumber numberWithFloat:bfPaperButton_clearBGFadeConstant];
        removeFadeBackgroundDarker.toValue = [NSNumber numberWithFloat:0.f];
        removeFadeBackgroundDarker.fillMode = kCAFillModeForwards;
        removeFadeBackgroundDarker.removedOnCompletion = NO;
        
        [self.backgroundColorFadeLayer addAnimation:removeFadeBackgroundDarker forKey:@"removeBGShade"];
    }
}


- (void)growTapCircleABit
{
    //NSLog(@"expanding a bit more");

    // Create a UIView which we can modify for its frame value later (specifically, the ability to use .center):
    CGFloat tapCircleDiameterStartValue = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;
    UIView *tapCircleLayerSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleDiameterStartValue, tapCircleDiameterStartValue)];
    tapCircleLayerSizerView.center = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

    // Calculate mask starting path:
    UIView *startingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleDiameterStartValue, tapCircleDiameterStartValue)];
    startingRectSizerView.center = tapCircleLayerSizerView.center;
    
    // Create starting circle path for mask:
    UIBezierPath *startingCirclePath = [UIBezierPath bezierPathWithRoundedRect:startingRectSizerView.frame cornerRadius:tapCircleDiameterStartValue / 2.f];
    
    // Calculate mask ending path:
    CGFloat tapCircleDiameterEndValue = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;
    tapCircleDiameterEndValue += 40.f;
    UIView *endingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleDiameterEndValue, tapCircleDiameterEndValue)];
    endingRectSizerView.center = tapCircleLayerSizerView.center;
    
    // Create ending circle path for mask:
    UIBezierPath *endingCirclePath = [UIBezierPath bezierPathWithRoundedRect:endingRectSizerView.frame cornerRadius:tapCircleDiameterEndValue / 2.f];

    
    // Get the next tap circle to expand:
    CAShapeLayer *tapCircle = [self.rippleAnimationQueue firstObject];
    
    // Expand tap-circle animation:
    CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    tapCircleGrowthAnimation.duration = bfPaperButton_tapCircleGrowthDurationConstant;
    tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    tapCircleGrowthAnimation.fromValue = (__bridge id)startingCirclePath.CGPath;
    tapCircleGrowthAnimation.toValue = (__bridge id)endingCirclePath.CGPath;
    tapCircleGrowthAnimation.fillMode = kCAFillModeForwards;
    tapCircleGrowthAnimation.removedOnCompletion = NO;
    
    [tapCircle addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
}


- (void)fadeTapCircleOut
{
    //NSLog(@"Fading away");

    if (self.rippleAnimationQueue.count > 0) {
        CALayer *tempAnimationLayer = [self.rippleAnimationQueue firstObject];
        [self.rippleAnimationQueue removeObjectAtIndex:0];
        
        [self.deathRowForCircleLayers addObject:tempAnimationLayer];

        CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [fadeOut setValue:@"fadeCircleOut" forKey:@"id"];
        fadeOut.delegate = self;
        fadeOut.fromValue = [NSNumber numberWithFloat:tempAnimationLayer.opacity];
        fadeOut.toValue = [NSNumber numberWithFloat:0.f];
        fadeOut.duration = bfPaperButton_tapCircleGrowthDurationConstant;
        fadeOut.fillMode = kCAFillModeForwards;
        fadeOut.removedOnCompletion = NO;
        
        [tempAnimationLayer addAnimation:fadeOut forKey:@"opacityAnimation"];
    }
}
#pragma mark -


@end
