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


@interface BFPaperButton ()
@property CGRect downRect;
@property CGRect upRect;
@property CGRect fadeAndClippingMaskRect;
@property CGPoint tapPoint;
@property BOOL letGo;
@property CALayer *backgroundColorFadeLayer;
@property NSMutableArray *rippleAnimationQueue;
@property NSMutableArray *deathRowForCircleLayers;  // This is where old circle layers go to be killed :(
@property UIColor *dumbTapCircleFillColor;
@property UIColor *clearBackgroundDumbTapCircleColor;
@property UIColor *clearBackgroundDumbFadeColor;
@end

@implementation BFPaperButton
// Public consts:
CGFloat const bfPaperButton_tapCircleDiameterMedium  = 305.f;
CGFloat const bfPaperButton_tapCircleDiameterSmall   = bfPaperButton_tapCircleDiameterMedium / 2.f;
CGFloat const bfPaperButton_tapCircleDiameterLarge   = bfPaperButton_tapCircleDiameterMedium * 1.5f;
CGFloat const bfPaperButton_tapCircleDiameterFull    = -1.f;
CGFloat const bfPaperButton_tapCircleDiameterDefault = -2.f;


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


#pragma mark - Super Overrides
- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if (self.isRaised) {
        if (!enabled) {
            self.layer.shadowOpacity = 0;
        }
        else {
            self.layer.shadowOpacity = self.loweredShadowOpacity;
        }
    }
    [self setNeedsDisplay];
}

- (void)sizeToFit
{
    [super sizeToFit];
    
    if (self.isRaised) {
        // Draw shadow
        self.downRect = CGRectMake(self.bounds.origin.x - self.loweredShadowOffset.width,
                                   self.bounds.origin.y + self.loweredShadowOffset.height,
                                   self.bounds.size.width + (2 * self.loweredShadowOffset.width),
                                   self.bounds.size.height + self.loweredShadowOffset.height);
        
        self.upRect = CGRectMake(self.bounds.origin.x - self.liftedShadowOffset.width,
                                 self.bounds.origin.y + self.liftedShadowOffset.height,
                                 self.bounds.size.width + (2 * self.liftedShadowOffset.width),
                                 self.bounds.size.height + self.liftedShadowOffset.height);
        
        self.layer.shadowColor = self.shadowColor.CGColor;
        self.layer.shadowOpacity = self.letGo ? self.loweredShadowOpacity : self.liftedShadowOpacity;
        self.layer.shadowRadius = self.letGo ? self.loweredShadowRadius : self.liftedShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.letGo ? self.downRect : self.upRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = self.loweredShadowOffset;
    }
    else {
        // Erase shadow:
        self.layer.shadowOpacity = 0.f;
        
        self.backgroundColorFadeLayer.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
        self.backgroundColorFadeLayer.cornerRadius = self.cornerRadius;
    }
    
    self.fadeAndClippingMaskRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
    
    [self setEnabled:self.enabled];

    [self setNeedsDisplay];
    [self.layer setNeedsDisplay];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isRaised) {
        // Draw shadow
        self.downRect = CGRectMake(self.bounds.origin.x - self.loweredShadowOffset.width,
                                   self.bounds.origin.y + self.loweredShadowOffset.height,
                                   self.bounds.size.width + (2 * self.loweredShadowOffset.width),
                                   self.bounds.size.height + self.loweredShadowOffset.height);
        
        self.upRect = CGRectMake(self.bounds.origin.x - self.liftedShadowOffset.width,
                                 self.bounds.origin.y + self.liftedShadowOffset.height,
                                 self.bounds.size.width + (2 * self.liftedShadowOffset.width),
                                 self.bounds.size.height + self.liftedShadowOffset.height);
        
        self.layer.shadowColor = self.shadowColor.CGColor;
        self.layer.shadowOpacity = self.letGo ? self.loweredShadowOpacity : self.liftedShadowOpacity;
        self.layer.shadowRadius = self.letGo ? self.loweredShadowRadius : self.liftedShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.letGo ? self.downRect : self.upRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = self.loweredShadowOffset;
    }
    else {
        // Erase shadow:
        self.layer.shadowOpacity = 0.f;
        
        self.backgroundColorFadeLayer.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
        self.backgroundColorFadeLayer.cornerRadius = self.cornerRadius;
    }
    
    self.fadeAndClippingMaskRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
    
    [self setEnabled:self.enabled];

    [self setNeedsDisplay];
    [self.layer setNeedsDisplay];
}


#pragma mark - Setup
- (void)setupRaised:(BOOL)isRaised
{
    self.letGo = YES;
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Defaults for visual properties:                                                                                      //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Shadow (for raised views) - Down:
    self.loweredShadowOpacity = 0.5f;
    self.loweredShadowRadius  = 1.5f;
    self.loweredShadowOffset  = CGSizeMake(0, 1);
    // Shadow (for raised views) - Up:
    self.liftedShadowOpacity = 0.5f;
    self.liftedShadowRadius  = 4.5f;
    self.liftedShadowOffset  = CGSizeMake(2, 4);
    // Animation:
    self.touchDownAnimationDuration  = 0.25f;
    self.touchUpAnimationDuration    = self.touchDownAnimationDuration * 2.5f;
    // Prettyness and Behaviour:
    self.usesSmartColor                    = YES;
    self.isRaised                          = isRaised;
    self.cornerRadius                      = 0;
    self.tapCircleColor                    = nil;
    self.backgroundFadeColor               = nil;
    self.shadowColor                       = [UIColor colorWithWhite:0.2f alpha:1.f];
    self.rippleFromTapLocation             = YES;
    self.rippleBeyondBounds                = NO;
    self.tapCircleDiameterStartValue       = 5.f;
    self.tapCircleDiameter                 = bfPaperButton_tapCircleDiameterDefault;
    self.tapCircleBurstAmount              = 100.f;
    self.dumbTapCircleFillColor            = [UIColor colorWithWhite:0.1 alpha:0.16f];
    self.clearBackgroundDumbTapCircleColor = [UIColor colorWithWhite:0.3 alpha:0.12f];
    self.clearBackgroundDumbFadeColor      = [UIColor colorWithWhite:0.3 alpha:0.12f];
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    self.rippleAnimationQueue = [NSMutableArray array];
    self.deathRowForCircleLayers = [NSMutableArray array];
    
    self.fadeAndClippingMaskRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
    self.backgroundColorFadeLayer = [[CALayer alloc] init];
    self.backgroundColorFadeLayer.frame = self.fadeAndClippingMaskRect;
    self.backgroundColorFadeLayer.cornerRadius = self.cornerRadius;
    self.backgroundColorFadeLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.backgroundColorFadeLayer.opacity = 0;
    [self.layer insertSublayer:self.backgroundColorFadeLayer atIndex:0];
    
    self.layer.masksToBounds = NO;
    self.clipsToBounds = NO;
    
    [self.layer setNeedsDisplayOnBoundsChange:YES];
    [self setContentMode:UIViewContentModeRedraw];
    
    self.tapCircleColor = nil;
    self.backgroundFadeColor = nil;
    
    if (self.isRaised) {
        // Draw shadow
        self.downRect = CGRectMake(self.bounds.origin.x - self.loweredShadowOffset.width,
                                   self.bounds.origin.y + self.loweredShadowOffset.height,
                                   self.bounds.size.width + (2 * self.loweredShadowOffset.width),
                                   self.bounds.size.height + self.loweredShadowOffset.height);
        
        self.upRect = CGRectMake(self.bounds.origin.x - self.liftedShadowOffset.width,
                                 self.bounds.origin.y + self.liftedShadowOffset.height,
                                 self.bounds.size.width + (2 * self.liftedShadowOffset.width),
                                 self.bounds.size.height + self.liftedShadowOffset.height);
        
        self.layer.shadowColor = self.shadowColor.CGColor;
        self.layer.shadowOpacity = self.loweredShadowOpacity;
        self.layer.shadowRadius = self.loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = self.loweredShadowOffset;
    }
    else {
        // Erase shadow:
        self.layer.shadowOpacity = 0.f;
    }
    
    [self addTarget:self action:@selector(paperTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(paperTouchUp:) forControlEvents:UIControlEventTouchCancel];
    
    // Make a Tap Gesture Recognizer for getting the tap location:
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    tapGestureRecognizer.delegate = self;
    [self addGestureRecognizer:tapGestureRecognizer];
    
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
}


#pragma mark - Setters:
- (void)setIsRaised:(BOOL)isRaised
{
    _isRaised = isRaised;
    self.downRect = CGRectMake(self.bounds.origin.x - self.loweredShadowOffset.width,
                               self.bounds.origin.y + self.loweredShadowOffset.height,
                               self.bounds.size.width + (2 * self.loweredShadowOffset.width),
                               self.bounds.size.height + self.loweredShadowOffset.height);
    
    self.upRect = CGRectMake(self.bounds.origin.x - self.liftedShadowOffset.width,
                             self.bounds.origin.y + self.liftedShadowOffset.height,
                             self.bounds.size.width + (2 * self.liftedShadowOffset.width),
                             self.bounds.size.height + self.liftedShadowOffset.height);
    
    if (_isRaised) {
        // Draw shadow
        self.layer.shadowColor = self.shadowColor.CGColor;
        self.layer.shadowOpacity = self.loweredShadowOpacity;
        self.layer.shadowRadius = self.loweredShadowRadius;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        self.layer.shadowOffset = self.loweredShadowOffset;
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
    [self touchDownAnimations]; // Go Steelers!
}


- (void)paperTouchUp:(id)sender
{
    //NSLog(@"Touch Up handler");
    self.letGo = YES;
    [self touchUpAnimations];
}


#pragma mark - Animation
- (void)animationDidStop:(CAAnimation *)theAnimation2 finished:(BOOL)flag
{
    //NSLog(@"animation ENDED");
    if ([[theAnimation2 valueForKey:@"id"] isEqualToString:@"fadeCircleOut"]) {
        [[self.deathRowForCircleLayers objectAtIndex:0] removeFromSuperlayer];
        if (self.deathRowForCircleLayers.count > 0) {
            [self.deathRowForCircleLayers removeObjectAtIndex:0];
        }
    }
}

- (void)touchDownAnimations
{
    [self liftButton];
    [self fadeInBackgroundAndRippleTapCircle];
}

- (void)touchUpAnimations
{
    [self lowerButtonAndFadeOutBackground];
    [self burstTapCircle];
}

- (void)liftButton
{
    //NSLog(@"expanding a tap circle");
    if (self.isRaised) {
        
        CGFloat startRadius = self.loweredShadowRadius;
        CGFloat startOpacity = self.loweredShadowOpacity;
        CGPathRef startPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        
        // Grab the current values if we are currently animating:
        if ([[self.layer animationKeys] count] > 0) {
            startRadius = [[self.layer presentationLayer] shadowRadius];
            startOpacity = [[self.layer presentationLayer] shadowOpacity];
            startPath = [[self.layer presentationLayer] shadowPath];
        }
        
        // Increase shadow radius:
        CABasicAnimation *increaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        increaseRadius.fromValue = [NSNumber numberWithFloat:startRadius];
        increaseRadius.toValue = [NSNumber numberWithFloat:self.liftedShadowRadius];
        increaseRadius.duration = self.touchDownAnimationDuration;
        increaseRadius.fillMode = kCAFillModeForwards;
        increaseRadius.removedOnCompletion = YES;
        self.layer.shadowRadius = self.liftedShadowRadius;
        
        // Lighten the shadow opacity:
        CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        shadowOpacityAnimation.duration = self.touchDownAnimationDuration;
        shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:startOpacity];
        shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:self.liftedShadowOpacity];
        shadowOpacityAnimation.fillMode = kCAFillModeBackwards;
        shadowOpacityAnimation.removedOnCompletion = YES;
        self.layer.shadowOpacity = self.liftedShadowOpacity;
        
        // Change its frame a bit larger and shift it down a bit:
        CABasicAnimation *shadowPathAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        shadowPathAnimation.duration = self.touchDownAnimationDuration;
        shadowPathAnimation.fromValue = (__bridge id)(startPath);
        shadowPathAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.upRect cornerRadius:self.cornerRadius].CGPath;
        shadowPathAnimation.fillMode = kCAFillModeForwards;
        shadowPathAnimation.removedOnCompletion = YES;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.upRect cornerRadius:self.cornerRadius].CGPath;
        
        // Add the animations:
        [self.layer addAnimation:increaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
        [self.layer addAnimation:shadowPathAnimation forKey:@"shadow"];
    }
}

- (void)fadeInBackgroundAndRippleTapCircle
{
    // Spawn a growing circle that "ripples" through the view:
    if ([BFPaperButton isColorClear:self.backgroundColor]) {
        // CLEAR BACKROUND SHOULD ONLY BE FOR FLAT VIEW!!!
        
        // Set the fill color for the tap circle (self.animationLayer's fill color):
        if (!self.tapCircleColor) {
            self.tapCircleColor = self.usesSmartColor ? [self.titleLabel.textColor colorWithAlphaComponent:CGColorGetAlpha(self.clearBackgroundDumbTapCircleColor.CGColor)] : self.clearBackgroundDumbTapCircleColor;
        }
        
        if (!self.backgroundFadeColor) {
            self.backgroundFadeColor = self.usesSmartColor ? [self.titleLabel.textColor colorWithAlphaComponent:CGColorGetAlpha(self.clearBackgroundDumbFadeColor.CGColor)] : self.clearBackgroundDumbFadeColor;
        }
        
        // Setup background fade layer:
        self.backgroundColorFadeLayer.backgroundColor = self.backgroundFadeColor.CGColor;
        
        CGFloat startingOpacity = self.backgroundColorFadeLayer.opacity;
        
        if ([[self.backgroundColorFadeLayer animationKeys] count] > 0) {
            startingOpacity = [[self.backgroundColorFadeLayer presentationLayer] opacity];
        }
        
        // Fade the background color a bit darker:
        CABasicAnimation *fadeBackgroundDarker = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeBackgroundDarker.duration = self.touchDownAnimationDuration;
        fadeBackgroundDarker.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        fadeBackgroundDarker.fromValue = [NSNumber numberWithFloat:startingOpacity];
        fadeBackgroundDarker.toValue = [NSNumber numberWithFloat:1];
        fadeBackgroundDarker.fillMode = kCAFillModeForwards;
        fadeBackgroundDarker.removedOnCompletion = !NO;
        self.backgroundColorFadeLayer.opacity = 1;
        
        [self.backgroundColorFadeLayer addAnimation:fadeBackgroundDarker forKey:@"animateOpacity"];
    }
    else {
        // COLORED BACKGROUNDS (can be smart or dumb):
        
        // Set the fill color for the tap circle (self.animationLayer's fill color):
        if (!self.tapCircleColor) {
            self.tapCircleColor = self.usesSmartColor ? [self.titleLabel.textColor colorWithAlphaComponent:CGColorGetAlpha(self.dumbTapCircleFillColor.CGColor)] : self.dumbTapCircleFillColor;
        }
    }
    
    // Calculate the tap circle's ending diameter:
    CGFloat tapCircleFinalDiameter = [self calculateTapCircleFinalDiameter];
    
    // Create a UIView which we can modify for its frame value later (specifically, the ability to use .center):
    UIView *tapCircleLayerSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleFinalDiameter, tapCircleFinalDiameter)];
    tapCircleLayerSizerView.center = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    // Calculate starting path:
    UIView *startingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tapCircleDiameterStartValue, self.tapCircleDiameterStartValue)];
    startingRectSizerView.center = tapCircleLayerSizerView.center;
    
    // Create starting circle path:
    UIBezierPath *startingCirclePath = [UIBezierPath bezierPathWithRoundedRect:startingRectSizerView.frame cornerRadius:self.tapCircleDiameterStartValue / 2.f];
    
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
        mask.path = [UIBezierPath bezierPathWithRoundedRect:self.fadeAndClippingMaskRect cornerRadius:self.cornerRadius].CGPath;
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
    
    
    // Grow tap-circle animation (performed on mask layer):
    CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    tapCircleGrowthAnimation.duration = self.touchDownAnimationDuration;
    tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    tapCircleGrowthAnimation.fromValue = (__bridge id)startingCirclePath.CGPath;
    tapCircleGrowthAnimation.toValue = (__bridge id)endingCirclePath.CGPath;
    tapCircleGrowthAnimation.fillMode = kCAFillModeForwards;
    tapCircleGrowthAnimation.removedOnCompletion = NO;
    
    // Fade in self.animationLayer:
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.duration = self.touchDownAnimationDuration;
    fadeIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fadeIn.fromValue = [NSNumber numberWithFloat:0.f];
    fadeIn.toValue = [NSNumber numberWithFloat:1.f];
    fadeIn.fillMode = kCAFillModeForwards;
    fadeIn.removedOnCompletion = NO;
    
    // Add the animations to the layers:
    [tapCircle addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
    [tapCircle addAnimation:fadeIn forKey:@"opacityAnimation"];
}

- (void)lowerButtonAndFadeOutBackground
{
    // NSLog(@"fading bg");
    
    if (self.isRaised) {
        CGFloat startRadius = self.liftedShadowRadius;
        CGFloat startOpacity = self.liftedShadowOpacity;
        CGPathRef startPath = [UIBezierPath bezierPathWithRoundedRect:self.upRect cornerRadius:self.cornerRadius].CGPath;
        
        // Grab the current values if we are currently animating:
        if ([[self.layer animationKeys] count] > 0) {
            startRadius = [[self.layer presentationLayer] shadowRadius];
            startOpacity = [[self.layer presentationLayer] shadowOpacity];
            startPath = [[self.layer presentationLayer] shadowPath];
        }
        
        // Decrease shadow radius:
        CABasicAnimation *decreaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        decreaseRadius.fromValue = [NSNumber numberWithFloat:startRadius];
        decreaseRadius.toValue = [NSNumber numberWithFloat:self.loweredShadowRadius];
        decreaseRadius.duration = self.touchUpAnimationDuration;
        decreaseRadius.fillMode = kCAFillModeForwards;
        decreaseRadius.removedOnCompletion = YES;
        self.layer.shadowRadius = self.loweredShadowRadius;
        
        // Darken shadow opacity:
        CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        shadowOpacityAnimation.duration = self.touchUpAnimationDuration;
        shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:startOpacity];
        shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:self.loweredShadowOpacity];
        shadowOpacityAnimation.fillMode = kCAFillModeBackwards;
        shadowOpacityAnimation.removedOnCompletion = YES;
        self.layer.shadowOpacity = self.loweredShadowOpacity;
        
        // Move shadow back up a bit and shrink it a bit:
        CABasicAnimation *shadowAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        shadowAnimation.duration = self.touchUpAnimationDuration;
        shadowAnimation.fromValue = (__bridge id)(startPath);
        shadowAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        shadowAnimation.fillMode = kCAFillModeForwards;
        shadowAnimation.removedOnCompletion = YES;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.downRect cornerRadius:self.cornerRadius].CGPath;
        
        // Add the animations:
        [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
        [self.layer addAnimation:decreaseRadius forKey:@"shadowRadius"];
        [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    }
    
    if ([BFPaperButton isColorClear:self.backgroundColor]) {
        // Remove darkened background fade:
        
        CGFloat startingOpacity = self.backgroundColorFadeLayer.opacity;
        
        // Grab the current value if we are currently animating:
        if ([[self.backgroundColorFadeLayer animationKeys] count] > 0) {
            startingOpacity = [[self.backgroundColorFadeLayer presentationLayer] opacity];
        }
        
        CABasicAnimation *removeFadeBackgroundDarker = [CABasicAnimation animationWithKeyPath:@"opacity"];
        removeFadeBackgroundDarker.duration = self.touchUpAnimationDuration;
        removeFadeBackgroundDarker.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        removeFadeBackgroundDarker.fromValue = [NSNumber numberWithFloat:startingOpacity];
        removeFadeBackgroundDarker.toValue = [NSNumber numberWithFloat:0];
        removeFadeBackgroundDarker.fillMode = kCAFillModeForwards;
        removeFadeBackgroundDarker.removedOnCompletion = !NO;
        self.backgroundColorFadeLayer.opacity = 0;
        
        [self.backgroundColorFadeLayer addAnimation:removeFadeBackgroundDarker forKey:@"animateOpacity"];
    }
}

- (void)burstTapCircle
{
    //NSLog(@"expanding a bit more");
    
    // Calculate the tap circle's ending diameter:
    CGFloat tapCircleFinalDiameter = [self calculateTapCircleFinalDiameter];
    tapCircleFinalDiameter += self.tapCircleBurstAmount;
    
    UIView *endingRectSizerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tapCircleFinalDiameter, tapCircleFinalDiameter)];
    endingRectSizerView.center = self.rippleFromTapLocation ? self.tapPoint : CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    // Create ending circle path for mask:
    UIBezierPath *endingCirclePath = [UIBezierPath bezierPathWithRoundedRect:endingRectSizerView.frame cornerRadius:tapCircleFinalDiameter / 2.f];
    
    // Get the next tap circle to expand:
    CAShapeLayer *tapCircle = [self.rippleAnimationQueue firstObject];
    if (nil != tapCircle) {
        if (self.rippleAnimationQueue.count > 0) {
            [self.rippleAnimationQueue removeObjectAtIndex:0];
        }
        [self.deathRowForCircleLayers addObject:tapCircle];
        
        
        CGPathRef startingPath = tapCircle.path;
        CGFloat startingOpacity = tapCircle.opacity;
        
        if ([[tapCircle animationKeys] count] > 0) {
            startingPath = [[tapCircle presentationLayer] path];
            startingOpacity = [[tapCircle presentationLayer] opacity];
        }
        
        // Burst tap-circle:
        CABasicAnimation *tapCircleGrowthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        tapCircleGrowthAnimation.duration = self.touchUpAnimationDuration;
        tapCircleGrowthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        tapCircleGrowthAnimation.fromValue = (__bridge id)startingPath;
        tapCircleGrowthAnimation.toValue = (__bridge id)endingCirclePath.CGPath;
        tapCircleGrowthAnimation.fillMode = kCAFillModeForwards;
        tapCircleGrowthAnimation.removedOnCompletion = NO;
        
        // Fade tap-circle out:
        CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [fadeOut setValue:@"fadeCircleOut" forKey:@"id"];
        fadeOut.delegate = self;
        fadeOut.fromValue = [NSNumber numberWithFloat:startingOpacity];
        fadeOut.toValue = [NSNumber numberWithFloat:0.f];
        fadeOut.duration = self.touchUpAnimationDuration;
        fadeOut.fillMode = kCAFillModeForwards;
        fadeOut.removedOnCompletion = NO;
        
        [tapCircle addAnimation:tapCircleGrowthAnimation forKey:@"animatePath"];
        [tapCircle addAnimation:fadeOut forKey:@"opacityAnimation"];
    }
}

- (CGFloat)calculateTapCircleFinalDiameter
{
    CGFloat finalDiameter = self.tapCircleDiameter;
    if (self.tapCircleDiameter == bfPaperButton_tapCircleDiameterFull) {
        // Calulate a diameter that will always cover the entire button:
        //////////////////////////////////////////////////////////////////////////////
        // Special thanks to github user @ThePantsThief for providing this code!    //
        //////////////////////////////////////////////////////////////////////////////
        CGFloat centerWidth   = self.frame.size.width;
        CGFloat centerHeight  = self.frame.size.height;
        CGFloat tapWidth      = 2 * MAX(self.tapPoint.x, centerWidth - self.tapPoint.x);
        CGFloat tapHeight     = 2 * MAX(self.tapPoint.y, centerHeight - self.tapPoint.y);
        CGFloat desiredWidth  = self.rippleFromTapLocation ? tapWidth : centerWidth;
        CGFloat desiredHeight = self.rippleFromTapLocation ? tapHeight : centerHeight;
        CGFloat diameter      = sqrt(pow(desiredWidth, 2) + pow(desiredHeight, 2));
        finalDiameter = diameter;
    }
    else if (self.tapCircleDiameter < bfPaperButton_tapCircleDiameterFull) {    // default
        finalDiameter = MAX(self.frame.size.width, self.frame.size.height);
    }
    return finalDiameter;
}


#pragma mark - Utility Functions
#pragma mark Private
+ (BOOL)isColorClear:(UIColor *)color
{
    if (color == [UIColor clearColor]) { return YES; }
    
    NSUInteger totalComponents = CGColorGetNumberOfComponents(color.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    CGFloat *components = (CGFloat *)CGColorGetComponents(color.CGColor);
    if (!components) { return YES; }
    if(isGreyscale) {
        if (components[1] <= 0) { return YES; }
    } else {
        if (components[3] <= 0) { return YES; }
    }
    return NO;
}

#pragma mark Public


@end
