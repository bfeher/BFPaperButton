//
//  BFPaperButton.h
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


#import <UIKit/UIKit.h>

#pragma mark - Useful constants
// Nice circle diameter constants with ugly names:
extern CGFloat const bfPaperButton_tapCircleDiameterMedium;
extern CGFloat const bfPaperButton_tapCircleDiameterSmall;
extern CGFloat const bfPaperButton_tapCircleDiameterLarge;
extern CGFloat const bfPaperButton_tapCircleDiameterFull;
extern CGFloat const bfPaperButton_tapCircleDiameterDefault;

IB_DESIGNABLE
@interface BFPaperButton : UIButton <UIGestureRecognizerDelegate, CAAnimationDelegate>

/* Notes on RAISED vs FLAT and SMART COLOR vs NON SMART COLOR:
 *
 * RAISED
 *  Has a shadow, so a clear background will look silly.
 *  It has only a tap-circle color. No background-fade.
 *
 * FLAT
 *  Has no shadow, therefore clear backgrounds look fine.
 *  If the background is clear, it also has a background-fade
 *  color to help visualize the button and its frame.
 *
 * SMART COLOR
 *  Will use the titleLabel's font color to pick
 *  a tap circle color and, if the background is clear, will
 *  also pick a lighter background fade color.
 *
 * NON SMART COLOR
 *  Will use a translucent gray tap-circle
 *  and, if the background is clear, a lighter translucent
 *  graybackground-fade color.
 */

#pragma mark - Initializers
/**
 *  Initializes a BFPaperButton without a frame. Can be Raised of Flat.
 *
 *  @param raised A BOOL flag to determine whether or not this instance should be raised or flat. YES = Raised, NO = Flat.
 *
 *  @return A (Raised or Flat) BFPaperButton without a frame!
 */
- (instancetype)initWithRaised:(BOOL)raised;

/**
 *  Initializes a BFPaperButton with a frame. Can be Raised of Flat.
 *
 *  @param frame  A CGRect to use as the button's frame.
 *  @param raised A BOOL flag to determine whether or not this instance should be raised or flat. YES = Raised, NO = Flat.
 *
 *  @return A (Raised or Flat) BFPaperButton with a frame!
 */
- (instancetype)initWithFrame:(CGRect)frame raised:(BOOL)raised;


#pragma mark - Properties
#pragma mark Shadow
/** The UIColor for the shadow of a raised button. An alpha value of 1 is recommended as shadowOpacity overwrites the alpha of this color. */
@property IBInspectable UIColor *shadowColor;

#pragma mark Shadow - Down
/** A CGFLoat representing the opacity of the shadow of RAISED buttons when they are lowered (idle). Default is 0.5f. */
@property IBInspectable CGFloat   loweredShadowOpacity;
/** A CGFLoat representing the radius of the shadow of RAISED buttons when they are lowered (idle). Default is 1.5f. */
@property IBInspectable CGFloat   loweredShadowRadius;
/** A CGSize representing the offset of the shadow of RAISED buttons when they are lowered (idle). Default is (0, 1). */
@property IBInspectable CGSize    loweredShadowOffset;

#pragma mark Shadow - Up
/** A CGFLoat representing the opacity of the shadow of RAISED buttons when they are lifted (on touch down). Default is 0.5f. */
@property IBInspectable CGFloat   liftedShadowOpacity;
/** A CGFLoat representing the radius of the shadow of RAISED buttons when they are lifted (on touch down). Default is 4.5f. */
@property IBInspectable CGFloat   liftedShadowRadius;
/** A CGSize representing the offset of the shadow of RAISED buttons when they are lifted (on touch down). Default is (2, 4). */
@property IBInspectable CGSize    liftedShadowOffset;


#pragma mark Animation
/** A CGFLoat representing the duration of the animations which take place on touch DOWN! Default is 0.25f seconds. (Go Steelers) */
@property IBInspectable CGFloat touchDownAnimationDuration;
/** A CGFLoat representing the duration of the animations which take place on touch UP! Default is 2 * touchDownAnimationDuration seconds. */
@property IBInspectable CGFloat touchUpAnimationDuration;


#pragma mark Prettyness and Behaviour
/** The corner radius which propagates through to the sub layers. Default is 0. */
@property (nonatomic) IBInspectable CGFloat cornerRadius;

/** A CGFLoat representing the diameter of the tap-circle as soon as it spawns, before it grows. Default is 5.f. */
@property IBInspectable CGFloat tapCircleDiameterStartValue;

/** The CGFloat value representing the Diameter of the tap-circle. By default it will be the result of MAX(self.frame.width, self.frame.height). tapCircleDiameterFull will calculate a circle that always fills the entire view. Any value less than or equal to tapCircleDiameterFull will result in default being used. The constants: tapCircleDiameterLarge, tapCircleDiameterMedium, and tapCircleDiameterSmall are also available for use. */
@property IBInspectable CGFloat tapCircleDiameter;

/** The CGFloat value representing how much we should increase the diameter of the tap-circle by when we burst it. Default is 100.f. */
@property IBInspectable CGFloat tapCircleBurstAmount;

/** The UIColor to use for the circle which appears where you tap. NOTE: Setting this defeats the "Smart Color" ability of the tap circle. Alpha values less than 1 are recommended. */
@property IBInspectable UIColor *tapCircleColor;

/** The UIColor to fade clear backgrounds to. NOTE: Setting this defeats the "Smart Color" ability of the background fade. Alpha values less than 1 are recommended. */
@property IBInspectable UIColor *backgroundFadeColor;

/** A flag to set to YES to have the tap-circle ripple from point of touch. If this is set to NO, the tap-circle will always ripple from the center of the tab. Default is YES. */
@property (nonatomic) IBInspectable BOOL rippleFromTapLocation;

/** A flag to set to YES to have the tap-circle ripple beyond the bounds of the view. If this is set to NO, the tap-circle will be clipped to the view's bounds. Default is NO. */
@property (nonatomic) IBInspectable BOOL rippleBeyondBounds;

/** A flag to set to YES to CHANGE a flat view to raised, or set to NO to CHANGE a raised view to flat. If you used one of the provided custom initializers, you should probably leave this parameter alone. If you instantiated via storyboard or IB and want to change from riased to flat, this is the parameter for you! Default is YES. */
@property (nonatomic) IBInspectable BOOL isRaised;

/** A flag to set to YES to use Smart Color, or NO to use a custom color scheme. While Smart Color is the default (usesSmartColor = YES), customization is cool too. */
@property (nonatomic) IBInspectable BOOL usesSmartColor;

/** A property governing the title font. It is settable via UIAppearance! */
@property (nonatomic) IBInspectable UIFont *titleFont UI_APPEARANCE_SELECTOR;


@end
