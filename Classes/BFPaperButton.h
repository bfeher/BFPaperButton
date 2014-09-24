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
static CGFloat const bfPaperButton_tapCircleDiameterMedium = 305.f;
static CGFloat const bfPaperButton_tapCircleDiameterSmall = bfPaperButton_tapCircleDiameterMedium / 2.f;
static CGFloat const bfPaperButton_tapCircleDiameterLarge = bfPaperButton_tapCircleDiameterMedium * 1.5f;
extern CGFloat const bfPaperButton_tapCircleDiameterDefault;


@interface BFPaperButton : UIButton <UIGestureRecognizerDelegate>

#pragma mark - Properties
/** The corner radius which propagates through to the sub layers. */
@property (nonatomic) CGFloat cornerRadius;

/** A flag to set to YES to use Smart Color, or NO to use a custom color scheme. While Smart Color is the default (usesSmartColor = YES), customization is cool too. */
@property (nonatomic) BOOL usesSmartColor;

/** The UIColor to use for the circle which appears where you tap. NOTE: Setting this defeats the "Smart Color" ability of the tap circle. Alpha values less than 1 are recommended. */
@property UIColor *tapCircleColor;

/** The UIColor to fade clear backgrounds to. NOTE: Setting this defeats the "Smart Color" ability of the background fade. An alpha value of 1 is recommended, as the fade is a constant (clearBGFadeConstant) defined in the BFPaperButton.m. This bothers me too. */
@property UIColor *backgroundFadeColor;

/** The CGFloat value representing the Diameter of the tap-circle. By default it will be the result of MAX(self.frame.width, self.frame.height). Any value less than zero will result in default being used. The constants: tapCircleDiameterLarge, tapCircleDiameterMedium, and tapCircleDiameterSmall are also available for use. */
@property CGFloat tapCircleDiameter;

/** A flag to set to YES to have the tap-circle ripple from point of touch. If this is set to NO, the tap-circle will always ripple from the center of the button. Default is YES. */
@property (nonatomic) BOOL rippleFromTapLocation;

/** A flag to set to YES to have the tap-circle ripple beyond the bounds of the button. If this is set to NO, the tap-circle will be clipped to the button's bounds. Default is NO. */
@property (nonatomic) BOOL rippleBeyondBounds;

/** A flag to set to YES to CHANGE a flat button to raised, or set to NO to CHANGE a raised button to flat. If you used one of the provided custom initializers, you should probably leave this parameter alone. If you instantiated via storyboard or IB and want to change from riased to flat, this is the parameter for you! */
@property (nonatomic) BOOL isRaised;

/** A property governing the title font. It is settable via UIAppearance! */
@property (nonatomic) UIFont *titleFont UI_APPEARANCE_SELECTOR;



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


#pragma mark - Deprecated Initializers
/**
 *  Initializes a Raised BFPaperButton, obviously without a frame.
 *
 *  @return A Raised BFPaperButton!
 */
- (instancetype)initRaised __attribute__((deprecated("Please use -(instancetype)initWithRaised:(BOOL)raised")));

/**
 *  Initializes a Raised BFPaperButton and assigns it a frame.
 *
 *  @return A Raised BFPaperButton with a frame!
 */
- (instancetype)initRaisedWithFrame:(CGRect)frame __attribute__((deprecated("Please use - (instancetype)initWithFrame:(CGRect)frame raised:(BOOL)raised")));

/**
 *  Initializes a Flat BFPaperButton, obviously without a frame.
 *
 *  @return A Flat BFPaperButton!
 */
- (instancetype)initFlat __attribute__((deprecated("Please use -(instancetype)initWithRaised:(BOOL)raised")));

/**
 *  Initializes a Flat BFPaperButton and assigns it a frame.
 *
 *  @return A Flat BFPaperButton with a frame!
 */
- (instancetype)initFlatWithFrame:(CGRect)frame __attribute__((deprecated("Please use - (instancetype)initWithFrame:(CGRect)frame raised:(BOOL)raised")));

@end
