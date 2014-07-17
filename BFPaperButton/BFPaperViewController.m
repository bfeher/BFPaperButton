//
//  BFPaperViewController.m
//  BFPaperButton
//
//  Created by Bence Feher on 7/16/14.
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

#import "BFPaperViewController.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"

@interface BFPaperViewController ()

@end

@implementation BFPaperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BFPaperButton *bfFlatSmart = [[BFPaperButton alloc] initFlatWithFrame:CGRectMake(20, 20, 280, 43)];
    [bfFlatSmart setTitle:@"BFPaperButton Flat: Smart Color" forState:UIControlStateNormal];
    bfFlatSmart.backgroundColor = [UIColor paperColorGray600];  // This is from the included cocoapod "UIColor+BFPaperColors".
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatSmart];
    
    
    BFPaperButton *bfFlatDumb = [[BFPaperButton alloc] initFlatWithFrame:CGRectMake(20, 71, 280, 43)];
    bfFlatDumb.usesSmartColor = NO;
    [bfFlatDumb setTitle:@"BFPaperButton Flat: !Smart Color" forState:UIControlStateNormal];
    bfFlatDumb.backgroundColor = [UIColor paperColorGray600];   // This is from the included cocoapod "UIColor+BFPaperColors".
    [bfFlatDumb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatDumb setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatDumb];
    
    
    BFPaperButton *bfFlatClearSmart = [[BFPaperButton alloc] initFlatWithFrame:CGRectMake(20, 122, 280, 43)];
    [bfFlatClearSmart setTitle:@"BFPaperButton Flat: Clear, Smart Color" forState:UIControlStateNormal];
    [bfFlatClearSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatClearSmart];
    
    
    BFPaperButton *bfFlatClearDumb = [[BFPaperButton alloc] initFlatWithFrame:CGRectMake(20, 173, 280, 43)];
    bfFlatClearDumb.usesSmartColor = NO;
    [bfFlatClearDumb setTitle:@"BFPaperButton Flat: Clear, !Smart Color" forState:UIControlStateNormal];
    [bfFlatClearDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfFlatClearDumb];
    
    
    BFPaperButton *bfRaisedSmart = [[BFPaperButton alloc] initRaisedWithFrame:CGRectMake(20, 239, 280, 43)];
    [bfRaisedSmart setTitle:@"BFPaperButton Raised: Smart Color" forState:UIControlStateNormal];
    [bfRaisedSmart addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedSmart];
    
    
    BFPaperButton *bfRaisedDumb = [[BFPaperButton alloc] initRaisedWithFrame:CGRectMake(20, 297, 280, 43)];
    bfRaisedDumb.usesSmartColor = NO;
    [bfRaisedDumb setTitle:@"BFPaperButton Raised: !Smart Color" forState:UIControlStateNormal];
    [bfRaisedDumb addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedDumb];
    
    
    BFPaperButton *bfRaisedSmartSmall = [[BFPaperButton alloc] initRaisedWithFrame:CGRectMake(20, 355, 135, 83)];
    bfRaisedSmartSmall.titleLabel.numberOfLines = 0;
    bfRaisedSmartSmall.titleLabel.font = [UIFont systemFontOfSize:10.f];
    [bfRaisedSmartSmall setTitle:@"BFPaperButton Raised: Smart Color" forState:UIControlStateNormal];
    [bfRaisedSmartSmall addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedSmartSmall];
    
    
    BFPaperButton *bfRaisedDumbSmall = [[BFPaperButton alloc] initRaisedWithFrame:CGRectMake(163, 355, 135, 83)];
    bfRaisedDumbSmall.usesSmartColor = NO;
    bfRaisedDumbSmall.titleLabel.numberOfLines = 0;
    bfRaisedDumbSmall.titleLabel.font = [UIFont systemFontOfSize:10.f];
    bfRaisedDumbSmall.tapCircleDiameter = bfPaperButton_tapCircleDiameterMedium;
    [bfRaisedDumbSmall setTitle:@"BFPaperButton Raised: !Smart Color, large circle" forState:UIControlStateNormal];
    [bfRaisedDumbSmall addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bfRaisedDumbSmall];
    
    
    BFPaperButton *bfRaisedCustom = [[BFPaperButton alloc] initRaisedWithFrame:CGRectMake(20, 453, 280, 43)];
    [bfRaisedCustom setTitle:@"BFPaperButton Raised: Customized" forState:UIControlStateNormal];
    bfRaisedCustom.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
    [bfRaisedCustom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfRaisedCustom setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfRaisedCustom addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    bfRaisedCustom.cornerRadius = 10;
    bfRaisedCustom.tapCircleDiameter = bfPaperButton_tapCircleDiameterSmall;
    bfRaisedCustom.tapCircleColor = [UIColor colorWithRed:0.3 green:1 blue:0.4 alpha:0.4];  // Setting this color overrides "Smart Color".
    [self.view addSubview:bfRaisedCustom];
    
    
    BFPaperButton *bfFlatCustom = [[BFPaperButton alloc] initFlatWithFrame:CGRectMake(20, 511, 280, 43)];
    [bfFlatCustom setTitle:@"BFPaperButton Flat: Customized" forState:UIControlStateNormal];
    [bfFlatCustom setTitleColor:[UIColor colorWithRed:1 green:0 blue:1 alpha:1] forState:UIControlStateNormal];
    [bfFlatCustom setTitleColor:[UIColor colorWithRed:1 green:0 blue:1 alpha:1] forState:UIControlStateHighlighted];
    [bfFlatCustom addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    bfFlatCustom.cornerRadius = 20;
    bfFlatCustom.tapCircleDiameter = bfPaperButton_tapCircleDiameterLarge;
    bfFlatCustom.tapCircleColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
    bfFlatCustom.backgroundFadeColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1]; // Setting this color overrides "Smart Color".
    [self.view addSubview:bfFlatCustom];

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
