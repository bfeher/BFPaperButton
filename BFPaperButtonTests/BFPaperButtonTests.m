//
//  BFPaperButtonTests.m
//  BFPaperButtonTests
//
//  Created by Bence Feher on 7/16/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//

#import <XCTest/XCTest.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "BFPaperButton.h"

@interface BFPaperButton (Tests)

- (void)paperTouchDown:(id)sender;

@end

@interface BFPaperButtonTests : XCTestCase

@property (nonatomic) BFPaperButton *button;

@end

@implementation BFPaperButtonTests

- (void)setUp
{
    [super setUp];
    self.button = [[BFPaperButton alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.button = nil;
    [super tearDown];
}

#pragma mark - Initialisers

- (void)testRaisedButton
{
    BFPaperButton *raisedButton = [[BFPaperButton alloc] initWithRaised:YES];
    expect(raisedButton.isRaised).to.beTruthy();
}

- (void)testCustomFrameRaisedButton
{
    CGRect customFrame = CGRectMake(99, 99, 99, 99);
    BFPaperButton *raisedFramedButton = [[BFPaperButton alloc] initWithFrame:customFrame raised:YES];
    expect(raisedFramedButton.frame).to.equal(customFrame);
    expect(raisedFramedButton.isRaised).to.beTruthy();
}

- (void)testCustomFrameFlatButton
{
    CGRect customFrame = CGRectMake(999, 999, 999, 999);
    BFPaperButton *flatFramedButton = [[BFPaperButton alloc] initWithFrame:customFrame raised:NO];
    expect(flatFramedButton.frame).to.equal(customFrame);
    expect(flatFramedButton.isRaised).to.beFalsy();
}

- (void)testFlatButton
{
    BFPaperButton *flatButton = [[BFPaperButton alloc] initWithRaised:NO];
    expect(flatButton.isRaised).to.beFalsy();
}

#pragma mark - Animation

- (void)testTouchUpDurationWithTouchDownDurationAnimation
{
    CGFloat animationDuration = 1.0;
    BFPaperButton *button = [[BFPaperButton alloc] initWithRaised:YES];
    button.touchDownAnimationDuration = animationDuration;
    
    expect(button.touchUpAnimationDuration).to.equal(2 * animationDuration);
}

- (void)testSmartColorsAppliesToTapCircleAfterButtonTouchDown
{
    CGFloat smartColorAlpha = 0.12f;
    UIColor *textColor = [UIColor redColor];
    UIColor *smartColor = [textColor colorWithAlphaComponent:smartColorAlpha];
    
    expect(self.button.usesSmartColor).to.beTruthy();
    expect(self.button.tapCircleColor).to.beNil();
    self.button.titleLabel.textColor = textColor;
    [self.button paperTouchDown:self.button];
    expect(self.button.tapCircleColor).equal(smartColor);
}

- (void)testSmartColorsAppliesToTapCircleOpagueBackgroundAfterButtonTouchDown
{
    CGFloat smartColorAlpha = 0.16f;
    UIColor *textColor = [UIColor redColor];
    UIColor *smartColor = [textColor colorWithAlphaComponent:smartColorAlpha];
    
    expect(self.button.usesSmartColor).to.beTruthy();
    expect(self.button.tapCircleColor).to.beNil();
    self.button.titleLabel.textColor = textColor;
    self.button.backgroundColor = [UIColor redColor];
    [self.button paperTouchDown:self.button];
    expect(self.button.tapCircleColor).equal(smartColor);
}

- (void)testSmartColorsAppliesToBackgroundFadeColorAfterButtonTouchDown
{
    CGFloat smartColorAlpha = 0.12f;
    UIColor *textColor = [UIColor redColor];
    UIColor *smartColor = [textColor colorWithAlphaComponent:smartColorAlpha];
    
    expect(self.button.usesSmartColor).to.beTruthy();
    expect(self.button.tapCircleColor).to.beNil();
    self.button.titleLabel.textColor = textColor;
    [self.button paperTouchDown:self.button];
    expect(self.button.backgroundFadeColor).equal(smartColor);
}

@end
