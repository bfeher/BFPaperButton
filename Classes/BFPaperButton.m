//
//  BFPaperButton.m
//  BFPaperKit
//
//  Created by Bence Feher on 7/11/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
/*
 The MIT License (MIT)
 
 Copyright (c) 2014 Bence Feher
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "BFPaperButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+BFPaperColors.h"


@interface BFPaperButton ()
@property CGRect downRect;
@property CGRect upRect;
@property CALayer *backgroundColorFadeLayer;
@property CGPoint tapPoint;
@property BOOL letGo;
@property BOOL growthFinished;
@property NSMutableArray *rippleAnimationQueue;
@end

@implementation BFPaperButton
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

/*- (instancetype)initRaisedSmartColor
{
    self = [super init];
    if (self) {
        [self setupRaised:YES withSmartColor:YES];
    }
    return self;
}*/

/*- (instancetype)initRaisedSmartColorWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:YES withSmartColor:YES];
    }
    return self;
}*/

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

/*- (instancetype)initFlatSmartColor
{
    self = [super init];
    if (self) {
        [self setupRaised:NO withSmartColor:YES];
    }
    return self;
}*/

/*- (instancetype)initFlatSmartColorWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRaised:NO withSmartColor:YES];
    }
    return self;
}*/


#pragma mark - Parent Overrides
/*- (void)setHighlighted:(BOOL)highlighted
 {
 [super setHighlighted:highlighted];
 [self setNeedsDisplay];
 }*/

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if (!enabled) {
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
    }
    [self setNeedsDisplay];
}


#pragma mark - Setup
- (void)setupRaised:(BOOL)isRaised
{
    self.isRaised = isRaised;
    
    // Default setup:
    self.usesSmartColor = YES;
    self.cornerRadius = bfPaperButton_loweredShadowRadius;
    self.tapCircleDiameter = -1.f;
    self.rippleFromTapLocation = YES;
    
    self.rippleAnimationQueue = [NSMutableArray array];
    
    CGRect endRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.frame.size.width, self.frame.size.height);
    
    self.backgroundColorFadeLayer = [[CALayer alloc] init];
    self.backgroundColorFadeLayer.frame = endRect;
    self.backgroundColorFadeLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer insertSublayer:self.backgroundColorFadeLayer atIndex:0];

    
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    
    self.tapCircleColor = nil;
    self.backgroundFadeColor = nil;
    
    self.titleLabel.font = [UIFont systemFontOfSize:15.f];
//    [self setTitle:@"BFPaperButton" forState:UIControlStateNormal];
    [self setBackgroundImage:[UIColor imageFromColor:[UIColor paperColorBlue]] forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor paperColorGray700] forState:UIControlStateDisabled];
    
    if (self.isRaised) {
        self.backgroundColor = [UIColor paperColorBlue];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        // Draw shadow
        self.downRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + bfPaperButton_loweredShadowYOffset);
        self.upRect = CGRectMake(0 - bfPaperButton_raisedShadowXOffset, self.bounds.origin.y + bfPaperButton_raisedShadowYOffset, self.bounds.size.width + (2 * bfPaperButton_raisedShadowXOffset), self.bounds.size.height + bfPaperButton_raisedShadowYOffset);
        
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor colorWithWhite:0.2f alpha:1.f].CGColor;
        self.layer.shadowOpacity = bfPaperButton_loweredShadowOpacity;
        self.layer.shadowRadius = bfPaperButton_loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.0f);
    }
    else {
        self.backgroundColor = [UIColor clearColor];
        [self setTitleColor:[UIColor paperColorBlue] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor paperColorBlue] forState:UIControlStateHighlighted];
        
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
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
        // Reset the button to look like a raised one: (Not sure if I should be forcing this, or letting the user make clear buttons with shadows below them.)
        /*if ([UIColor isColorClear:self.backgroundColor]) {
         self.backgroundColor = [UIColor paperBlueColor];
         [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
         }*/
        // Draw shadow
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor colorWithWhite:0.2f alpha:1.f].CGColor;
        self.layer.shadowOpacity = bfPaperButton_loweredShadowOpacity;
        self.layer.shadowRadius = bfPaperButton_loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.0f);
    }
    else {
        // Reset the button to look like a flat one: (Not sure if I should be forcing this, or letting the user make flat buttons with the raised look sans shadow.)
        /*if (![UIColor isColorClear:self.backgroundColor]) {
         self.backgroundColor = [UIColor clearColor];
         [self setTitleColor:[UIColor paperBlueColor] forState:UIControlStateNormal];
         [self setTitleColor:[UIColor paperBlueColor] forState:UIControlStateHighlighted];
         [self setTitleColor:[UIColor paperDarkGrayColor] forState:UIControlStateDisabled];
         }*/
        
        // Erase shadow:
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        self.layer.shadowOpacity = 0.f;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
    
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
        shadowOpacityAnimation.fillMode = kCAFillModeForwards;
        shadowOpacityAnimation.removedOnCompletion = NO;
        
        [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
        [self.layer addAnimation:increaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    }
    
    // Spawn a growing circle that "ripples" through the button:
    
    CGRect endRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.frame.size.width, self.frame.size.height);
    
    
    CALayer *tempAnimationLayer = [CALayer new];
    tempAnimationLayer.frame = endRect;
    tempAnimationLayer.cornerRadius = self.cornerRadius;
    
    
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
    
    // Set animation layer's background color:
    tempAnimationLayer.backgroundColor = self.tapCircleColor.CGColor;
    tempAnimationLayer.borderColor = [UIColor clearColor].CGColor;
    tempAnimationLayer.borderWidth = 0;
    
    
    // Animation Mask Rects
    CGPoint origin = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    //NSLog(@"self.center: (x%0.2f, y%0.2f)", self.center.x, self.center.y);
    UIBezierPath *startingTapCirclePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(origin.x - (bfPaperButton_tapCircleDiameterStartValue / 2.f), origin.y - (bfPaperButton_tapCircleDiameterStartValue / 2.f), bfPaperButton_tapCircleDiameterStartValue, bfPaperButton_tapCircleDiameterStartValue) cornerRadius:bfPaperButton_tapCircleDiameterStartValue / 2.f];
    
    CGFloat tapCircleDiameterEndValue = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;
    UIBezierPath *endTapCirclePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(origin.x - (tapCircleDiameterEndValue/ 2.f), origin.y - (tapCircleDiameterEndValue/ 2.f), tapCircleDiameterEndValue, tapCircleDiameterEndValue) cornerRadius:tapCircleDiameterEndValue/ 2.f];
    
    // Animation Mask Layer:
    CAShapeLayer *animationMaskLayer = [CAShapeLayer layer];
    animationMaskLayer.path = endTapCirclePath.CGPath;
    animationMaskLayer.fillColor = [UIColor blackColor].CGColor;
    animationMaskLayer.strokeColor = [UIColor clearColor].CGColor;
    animationMaskLayer.borderColor = [UIColor clearColor].CGColor;
    animationMaskLayer.borderWidth = 0;
    
    tempAnimationLayer.mask = animationMaskLayer;
    
    // Grow tap-circle animation:
    CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    tapCircleGrowthAnimation.delegate = self;
    [tapCircleGrowthAnimation setValue:@"tapGrowth" forKey:@"id"];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    tapCircleGrowthAnimation.duration = bfPaperButton_tapCircleGrowthDurationConstant;
    tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    tapCircleGrowthAnimation.fromValue = (__bridge id)startingTapCirclePath.CGPath;
    tapCircleGrowthAnimation.toValue = (__bridge id)endTapCirclePath.CGPath;
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
    
    
    // Add the animation layer to our animation queue and insert it into our view:
    [self.rippleAnimationQueue addObject:tempAnimationLayer];
    [self.layer insertSublayer:tempAnimationLayer above:self.backgroundColorFadeLayer];

    [animationMaskLayer addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
    [tempAnimationLayer addAnimation:fadeIn forKey:@"opacityAnimation"];
}


- (void)animationDidStop:(CAAnimation *)theAnimation2 finished:(BOOL)flag
{
    //NSLog(@"animation ENDED");
    self.growthFinished = YES;
    
    /*if([[theAnimation2 valueForKey:@"id"] isEqual:@"tapGrowth"]
     &&
     self.letGo) {
     [self removeTapCircle];
     }*/
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
        shadowOpacityAnimation.fillMode = kCAFillModeForwards;
        shadowOpacityAnimation.removedOnCompletion = NO;
        
        [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
        [self.layer addAnimation:decreaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    }
    
    if ([UIColor isColorClear:self.backgroundColor]) {
        // Remove darkened background fade:
        CABasicAnimation *removeFadeBackgroundDarker = [CABasicAnimation animationWithKeyPath:@"opacity"];
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
    
    CALayer *tempAnimationLayer = [self.rippleAnimationQueue firstObject];

    // Animation Mask Rects
    CGFloat newTapCircleStartValue = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;
    
    CGPoint origin = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *startingTapCirclePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(origin.x - (newTapCircleStartValue / 2.f), origin.y - (newTapCircleStartValue / 2.f), newTapCircleStartValue, newTapCircleStartValue) cornerRadius:newTapCircleStartValue / 2.f];
    
    CGFloat tapCircleDiameterEndValue = (self.tapCircleDiameter < 0) ? MAX(self.frame.size.width, self.frame.size.height) : self.tapCircleDiameter;
    tapCircleDiameterEndValue += 40.f;
    UIBezierPath *endTapCirclePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(origin.x - (tapCircleDiameterEndValue/ 2.f), origin.y - (tapCircleDiameterEndValue/ 2.f), tapCircleDiameterEndValue, tapCircleDiameterEndValue) cornerRadius:tapCircleDiameterEndValue/ 2.f];
    
    // Animation Mask Layer:
    CAShapeLayer *animationMaskLayer = [CAShapeLayer layer];
    animationMaskLayer.path = endTapCirclePath.CGPath;
    animationMaskLayer.fillColor = [UIColor blackColor].CGColor;
    animationMaskLayer.strokeColor = [UIColor clearColor].CGColor;
    animationMaskLayer.borderColor = [UIColor clearColor].CGColor;
    animationMaskLayer.borderWidth = 0;
    
    tempAnimationLayer.mask = animationMaskLayer;
    
    // Grow tap-circle animation:
    CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    tapCircleGrowthAnimation.duration = bfPaperButton_tapCircleGrowthDurationConstant;
    tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    tapCircleGrowthAnimation.fromValue = (__bridge id)startingTapCirclePath.CGPath;
    tapCircleGrowthAnimation.toValue = (__bridge id)endTapCirclePath.CGPath;
    tapCircleGrowthAnimation.fillMode = kCAFillModeForwards;
    tapCircleGrowthAnimation.removedOnCompletion = NO;
    
    [animationMaskLayer addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
}


- (void)fadeTapCircleOut
{
    //NSLog(@"Fading away");

    CALayer *tempAnimationLayer = [self.rippleAnimationQueue firstObject];
    [self.rippleAnimationQueue removeObjectAtIndex:0];

    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeOut.fromValue = [NSNumber numberWithFloat:tempAnimationLayer.opacity];
    fadeOut.toValue = [NSNumber numberWithFloat:0.f];
    fadeOut.duration = bfPaperButton_tapCircleGrowthDurationConstant;
    fadeOut.fillMode = kCAFillModeForwards;
    fadeOut.removedOnCompletion = NO;
    
    [tempAnimationLayer addAnimation:fadeOut forKey:@"opacityAnimation"];
}
#pragma mark -


@end
