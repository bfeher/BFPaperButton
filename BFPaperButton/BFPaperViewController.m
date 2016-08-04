//
//  BFPaperViewController.m
//  BFPaperButton
//
//  Created by Bence Feher on 7/16/14.
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


#import "BFPaperViewController.h"
#import "BFPaperButton.h"

@interface BFPaperViewController ()

@end

@implementation BFPaperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BFPaperButton *bfFlatSmart = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 20, 280, 43) raised:NO];
    [bfFlatSmart setTitle:@"BFPaperButton Flat: Smart Color" forState:UIControlStateNormal];
    [bfFlatSmart setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    bfFlatSmart.backgroundColor = [UIColor colorWithRed:117.f/255.f green:117.f/255.f blue:117.f/255.f alpha:1];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatSmart];
    
    BFPaperButton *bfFlatDumb = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 71, 280, 43) raised:NO];
    bfFlatDumb.usesSmartColor = NO;
    [bfFlatDumb setTitle:@"BFPaperButton Flat: !Smart Color" forState:UIControlStateNormal];
    [bfFlatDumb setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    bfFlatDumb.backgroundColor = [UIColor colorWithRed:117.f/255.f green:117.f/255.f blue:117.f/255.f alpha:1];
    [bfFlatDumb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatDumb setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatDumb];
    
    BFPaperButton *bfFlatClearSmart = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 122, 280, 43) raised:NO];
    [bfFlatClearSmart setTitle:@"BFPaperButton Flat: Clear, Smart Color" forState:UIControlStateNormal];
    [bfFlatClearSmart setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfFlatClearSmart setTitleColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1] forState:UIControlStateNormal];
    [bfFlatClearSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatClearSmart];
    
    BFPaperButton *bfFlatClearDumb = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 173, 280, 43) raised:NO];
    bfFlatClearDumb.usesSmartColor = NO;
    [bfFlatClearDumb setTitle:@"BFPaperButton Flat: Clear, !Smart Color" forState:UIControlStateNormal];
    [bfFlatClearDumb setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfFlatClearDumb setTitleColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1] forState:UIControlStateNormal];
    [bfFlatClearDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatClearDumb];
    
    
    
    BFPaperButton *bfRaisedSmart = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 239, 280, 43) raised:YES];
    [bfRaisedSmart setBackgroundColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1]];
    [bfRaisedSmart setTitle:@"BFPaperButton Raised: Smart Color" forState:UIControlStateNormal];
    [bfRaisedSmart setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfRaisedSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedSmart];
    
    BFPaperButton *bfRaisedDumb = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 307, 280, 43) raised:YES];
    bfRaisedDumb.usesSmartColor = NO;
    [bfRaisedDumb setBackgroundColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1]];
    [bfRaisedDumb setTitle:@"BFPaperButton Raised: !Smart Color" forState:UIControlStateNormal];
    [bfRaisedDumb setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfRaisedDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedDumb];
    
    BFPaperButton *bfRaisedSmartSmall = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 375, 135, 83) raised:YES];
    [bfRaisedSmartSmall setBackgroundColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1]];
    bfRaisedSmartSmall.titleLabel.numberOfLines = 0;
    bfRaisedSmartSmall.titleLabel.font = [UIFont systemFontOfSize:10.f];
    [bfRaisedSmartSmall setTitle:@"BFPaperButton Raised: Smart Color" forState:UIControlStateNormal];
    [bfRaisedSmartSmall setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfRaisedSmartSmall addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedSmartSmall];
    
    BFPaperButton *bfRaisedDumbSmall = [[BFPaperButton alloc] initWithFrame:CGRectMake(163, 375, 135, 83) raised:YES];
    bfRaisedDumbSmall.usesSmartColor = NO;
    [bfRaisedDumbSmall setBackgroundColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1]];
    bfRaisedDumbSmall.titleLabel.numberOfLines = 0;
    bfRaisedDumbSmall.titleLabel.font = [UIFont systemFontOfSize:10.f];
    bfRaisedDumbSmall.tapCircleDiameter = bfPaperButton_tapCircleDiameterFull;
    [bfRaisedDumbSmall setTitle:@"BFPaperButton Raised: !Smart Color, large circle" forState:UIControlStateNormal];
    [bfRaisedDumbSmall setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [bfRaisedDumbSmall addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedDumbSmall];
    
    
    
    BFPaperButton *circle1 = [[BFPaperButton alloc] initWithFrame:CGRectMake(20, 468, 86, 86) raised:YES];
    [circle1 setBackgroundColor:[UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1]];
    [circle1 setTitle:@"Center" forState:UIControlStateNormal];
    [circle1 setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [circle1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [circle1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [circle1 addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    circle1.cornerRadius = circle1.frame.size.width / 2;
    circle1.rippleFromTapLocation = NO;
    [self.view addSubview:circle1];
    
    BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(116, 468, 86, 86) raised:YES];
    [circle2 setTitle:@"Custom" forState:UIControlStateNormal];
    [circle2 setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [circle2 addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
    circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
    circle2.cornerRadius = circle2.frame.size.width / 2;
    circle2.rippleFromTapLocation = NO;
    circle2.rippleBeyondBounds = YES;
    circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
    [self.view addSubview:circle2];

    BFPaperButton *circle3 = [[BFPaperButton alloc] initWithFrame:CGRectMake(212, 468, 86, 86) raised:NO];
    [circle3 setTitle:@"Custom" forState:UIControlStateNormal];
    [circle3 setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    [circle3 setTitleColor:[UIColor colorWithRed:33.f/255.f green:33.f/255.f blue:33.f/255.f alpha:1] forState:UIControlStateNormal];
    [circle3 setTitleColor:[UIColor colorWithRed:33.f/255.f green:33.f/255.f blue:33.f/255.f alpha:1] forState:UIControlStateHighlighted];
    [circle3 addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    circle3.cornerRadius = circle3.frame.size.width / 2;
    circle3.tapCircleDiameter = 53;
    circle3.tapCircleColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
    circle3.backgroundFadeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3f]; // Setting this color overrides "Smart Color".
    [self.view addSubview:circle3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonWasPressed:(id)sender
{
    NSLog(@"%@ was pressed!", ((UIButton *)sender).titleLabel.text);
}

@end
