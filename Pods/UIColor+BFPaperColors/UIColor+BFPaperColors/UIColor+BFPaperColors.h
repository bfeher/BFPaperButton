//
//  UIColor+BFPaperColors.h
//  BFPaperKit
//
//  Created by Bence Feher on 7/11/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
/* LICENSE:
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


#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]



@interface UIColor (BFPaperColors)

#pragma mark - Utilities
+ (BOOL)isColorClear:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color;

#pragma mark - Red
+ (UIColor *)paperColorRed50;
+ (UIColor *)paperColorRed100;
+ (UIColor *)paperColorRed200;
+ (UIColor *)paperColorRed300;
+ (UIColor *)paperColorRed400;
+ (UIColor *)paperColorRed500;
+ (UIColor *)paperColorRed600;
+ (UIColor *)paperColorRed700;
+ (UIColor *)paperColorRed800;
+ (UIColor *)paperColorRed900;
+ (UIColor *)paperColorRedA100;
+ (UIColor *)paperColorRedA200;
+ (UIColor *)paperColorRedA400;
+ (UIColor *)paperColorRedA700;
+ (UIColor *)paperColorRed;

#pragma mark - Pink
+ (UIColor *)paperColorPink50;
+ (UIColor *)paperColorPink100;
+ (UIColor *)paperColorPink200;
+ (UIColor *)paperColorPink300;
+ (UIColor *)paperColorPink400;
+ (UIColor *)paperColorPink500;
+ (UIColor *)paperColorPink600;
+ (UIColor *)paperColorPink700;
+ (UIColor *)paperColorPink800;
+ (UIColor *)paperColorPink900;
+ (UIColor *)paperColorPinkA100;
+ (UIColor *)paperColorPinkA200;
+ (UIColor *)paperColorPinkA400;
+ (UIColor *)paperColorPinkA700;
+ (UIColor *)paperColorPink;

#pragma mark - Purple
+ (UIColor *)paperColorPurple50;
+ (UIColor *)paperColorPurple100;
+ (UIColor *)paperColorPurple200;
+ (UIColor *)paperColorPurple300;
+ (UIColor *)paperColorPurple400;
+ (UIColor *)paperColorPurple500;
+ (UIColor *)paperColorPurple600;
+ (UIColor *)paperColorPurple700;
+ (UIColor *)paperColorPurple800;
+ (UIColor *)paperColorPurple900;
+ (UIColor *)paperColorPurpleA100;
+ (UIColor *)paperColorPurpleA200;
+ (UIColor *)paperColorPurpleA400;
+ (UIColor *)paperColorPurpleA700;
+ (UIColor *)paperColorPurple;

#pragma mark - Deep Purple
+ (UIColor *)paperColorDeepPurple50;
+ (UIColor *)paperColorDeepPurple100;
+ (UIColor *)paperColorDeepPurple200;
+ (UIColor *)paperColorDeepPurple300;
+ (UIColor *)paperColorDeepPurple400;
+ (UIColor *)paperColorDeepPurple500;
+ (UIColor *)paperColorDeepPurple600;
+ (UIColor *)paperColorDeepPurple700;
+ (UIColor *)paperColorDeepPurple800;
+ (UIColor *)paperColorDeepPurple900;
+ (UIColor *)paperColorDeepPurpleA100;
+ (UIColor *)paperColorDeepPurpleA200;
+ (UIColor *)paperColorDeepPurpleA400;
+ (UIColor *)paperColorDeepPurpleA700;
+ (UIColor *)paperColorDeepPurple;

#pragma mark - Indigo
+ (UIColor *)paperColorIndigo50;
+ (UIColor *)paperColorIndigo100;
+ (UIColor *)paperColorIndigo200;
+ (UIColor *)paperColorIndigo300;
+ (UIColor *)paperColorIndigo400;
+ (UIColor *)paperColorIndigo500;
+ (UIColor *)paperColorIndigo600;
+ (UIColor *)paperColorIndigo700;
+ (UIColor *)paperColorIndigo800;
+ (UIColor *)paperColorIndigo900;
+ (UIColor *)paperColorIndigoA100;
+ (UIColor *)paperColorIndigoA200;
+ (UIColor *)paperColorIndigoA400;
+ (UIColor *)paperColorIndigoA700;
+ (UIColor *)paperColorIndigo;

#pragma mark - Blue
+ (UIColor *)paperColorBlue50;
+ (UIColor *)paperColorBlue100;
+ (UIColor *)paperColorBlue200;
+ (UIColor *)paperColorBlue300;
+ (UIColor *)paperColorBlue400;
+ (UIColor *)paperColorBlue500;
+ (UIColor *)paperColorBlue600;
+ (UIColor *)paperColorBlue700;
+ (UIColor *)paperColorBlue800;
+ (UIColor *)paperColorBlue900;
+ (UIColor *)paperColorBlueA100;
+ (UIColor *)paperColorBlueA200;
+ (UIColor *)paperColorBlueA400;
+ (UIColor *)paperColorBlueA700;
+ (UIColor *)paperColorBlue;

#pragma mark - Light Blue
+ (UIColor *)paperColorLightBlue50;
+ (UIColor *)paperColorLightBlue100;
+ (UIColor *)paperColorLightBlue200;
+ (UIColor *)paperColorLightBlue300;
+ (UIColor *)paperColorLightBlue400;
+ (UIColor *)paperColorLightBlue500;
+ (UIColor *)paperColorLightBlue600;
+ (UIColor *)paperColorLightBlue700;
+ (UIColor *)paperColorLightBlue800;
+ (UIColor *)paperColorLightBlue900;
+ (UIColor *)paperColorLightBlueA100;
+ (UIColor *)paperColorLightBlueA200;
+ (UIColor *)paperColorLightBlueA400;
+ (UIColor *)paperColorLightBlueA700;
+ (UIColor *)paperColorLightBlue;

#pragma mark - Cyan
+ (UIColor *)paperColorCyan50;
+ (UIColor *)paperColorCyan100;
+ (UIColor *)paperColorCyan200;
+ (UIColor *)paperColorCyan300;
+ (UIColor *)paperColorCyan400;
+ (UIColor *)paperColorCyan500;
+ (UIColor *)paperColorCyan600;
+ (UIColor *)paperColorCyan700;
+ (UIColor *)paperColorCyan800;
+ (UIColor *)paperColorCyan900;
+ (UIColor *)paperColorCyanA100;
+ (UIColor *)paperColorCyanA200;
+ (UIColor *)paperColorCyanA400;
+ (UIColor *)paperColorCyanA700;
+ (UIColor *)paperColorCyan;

#pragma mark - Teal
+ (UIColor *)paperColorTeal50;
+ (UIColor *)paperColorTeal100;
+ (UIColor *)paperColorTeal200;
+ (UIColor *)paperColorTeal300;
+ (UIColor *)paperColorTeal400;
+ (UIColor *)paperColorTeal500;
+ (UIColor *)paperColorTeal600;
+ (UIColor *)paperColorTeal700;
+ (UIColor *)paperColorTeal800;
+ (UIColor *)paperColorTeal900;
+ (UIColor *)paperColorTealA100;
+ (UIColor *)paperColorTealA200;
+ (UIColor *)paperColorTealA400;
+ (UIColor *)paperColorTealA700;
+ (UIColor *)paperColorTeal;

#pragma mark - Green
+ (UIColor *)paperColorGreen50;
+ (UIColor *)paperColorGreen100;
+ (UIColor *)paperColorGreen200;
+ (UIColor *)paperColorGreen300;
+ (UIColor *)paperColorGreen400;
+ (UIColor *)paperColorGreen500;
+ (UIColor *)paperColorGreen600;
+ (UIColor *)paperColorGreen700;
+ (UIColor *)paperColorGreen800;
+ (UIColor *)paperColorGreen900;
+ (UIColor *)paperColorGreenA100;
+ (UIColor *)paperColorGreenA200;
+ (UIColor *)paperColorGreenA400;
+ (UIColor *)paperColorGreenA700;
+ (UIColor *)paperColorGreen;

#pragma mark - Light Green
+ (UIColor *)paperColorLightGreen50;
+ (UIColor *)paperColorLightGreen100;
+ (UIColor *)paperColorLightGreen200;
+ (UIColor *)paperColorLightGreen300;
+ (UIColor *)paperColorLightGreen400;
+ (UIColor *)paperColorLightGreen500;
+ (UIColor *)paperColorLightGreen600;
+ (UIColor *)paperColorLightGreen700;
+ (UIColor *)paperColorLightGreen800;
+ (UIColor *)paperColorLightGreen900;
+ (UIColor *)paperColorLightGreenA100;
+ (UIColor *)paperColorLightGreenA200;
+ (UIColor *)paperColorLightGreenA400;
+ (UIColor *)paperColorLightGreenA700;
+ (UIColor *)paperColorLightGreen;

#pragma mark - Lime
+ (UIColor *)paperColorLime50;
+ (UIColor *)paperColorLime100;
+ (UIColor *)paperColorLime200;
+ (UIColor *)paperColorLime300;
+ (UIColor *)paperColorLime400;
+ (UIColor *)paperColorLime500;
+ (UIColor *)paperColorLime600;
+ (UIColor *)paperColorLime700;
+ (UIColor *)paperColorLime800;
+ (UIColor *)paperColorLime900;
+ (UIColor *)paperColorLimeA100;
+ (UIColor *)paperColorLimeA200;
+ (UIColor *)paperColorLimeA400;
+ (UIColor *)paperColorLimeA700;
+ (UIColor *)paperColorLime;

#pragma mark - Yellow
+ (UIColor *)paperColorYellow50;
+ (UIColor *)paperColorYellow100;
+ (UIColor *)paperColorYellow200;
+ (UIColor *)paperColorYellow300;
+ (UIColor *)paperColorYellow400;
+ (UIColor *)paperColorYellow500;
+ (UIColor *)paperColorYellow600;
+ (UIColor *)paperColorYellow700;
+ (UIColor *)paperColorYellow800;
+ (UIColor *)paperColorYellow900;
+ (UIColor *)paperColorYellowA100;
+ (UIColor *)paperColorYellowA200;
+ (UIColor *)paperColorYellowA400;
+ (UIColor *)paperColorYellowA700;
+ (UIColor *)paperColorYellow;

#pragma mark - Amber
+ (UIColor *)paperColorAmber50;
+ (UIColor *)paperColorAmber100;
+ (UIColor *)paperColorAmber200;
+ (UIColor *)paperColorAmber300;
+ (UIColor *)paperColorAmber400;
+ (UIColor *)paperColorAmber500;
+ (UIColor *)paperColorAmber600;
+ (UIColor *)paperColorAmber700;
+ (UIColor *)paperColorAmber800;
+ (UIColor *)paperColorAmber900;
+ (UIColor *)paperColorAmberA100;
+ (UIColor *)paperColorAmberA200;
+ (UIColor *)paperColorAmberA400;
+ (UIColor *)paperColorAmberA700;
+ (UIColor *)paperColorAmber;

#pragma mark - Orange
+ (UIColor *)paperColorOrange50;
+ (UIColor *)paperColorOrange100;
+ (UIColor *)paperColorOrange200;
+ (UIColor *)paperColorOrange300;
+ (UIColor *)paperColorOrange400;
+ (UIColor *)paperColorOrange500;
+ (UIColor *)paperColorOrange600;
+ (UIColor *)paperColorOrange700;
+ (UIColor *)paperColorOrange800;
+ (UIColor *)paperColorOrange900;
+ (UIColor *)paperColorOrangeA100;
+ (UIColor *)paperColorOrangeA200;
+ (UIColor *)paperColorOrangeA400;
+ (UIColor *)paperColorOrangeA700;
+ (UIColor *)paperColorOrange;

#pragma mark - Deep Orange
+ (UIColor *)paperColorDeepOrange50;
+ (UIColor *)paperColorDeepOrange100;
+ (UIColor *)paperColorDeepOrange200;
+ (UIColor *)paperColorDeepOrange300;
+ (UIColor *)paperColorDeepOrange400;
+ (UIColor *)paperColorDeepOrange500;
+ (UIColor *)paperColorDeepOrange600;
+ (UIColor *)paperColorDeepOrange700;
+ (UIColor *)paperColorDeepOrange800;
+ (UIColor *)paperColorDeepOrange900;
+ (UIColor *)paperColorDeepOrangeA100;
+ (UIColor *)paperColorDeepOrangeA200;
+ (UIColor *)paperColorDeepOrangeA400;
+ (UIColor *)paperColorDeepOrangeA700;
+ (UIColor *)paperColorDeepOrange;

#pragma mark - Brown
+ (UIColor *)paperColorBrown50;
+ (UIColor *)paperColorBrown100;
+ (UIColor *)paperColorBrown200;
+ (UIColor *)paperColorBrown300;
+ (UIColor *)paperColorBrown400;
+ (UIColor *)paperColorBrown500;
+ (UIColor *)paperColorBrown600;
+ (UIColor *)paperColorBrown700;
+ (UIColor *)paperColorBrown800;
+ (UIColor *)paperColorBrown900;
+ (UIColor *)paperColorBrown;

#pragma mark - Gray
+ (UIColor *)paperColorGray50;
+ (UIColor *)paperColorGray100;
+ (UIColor *)paperColorGray200;
+ (UIColor *)paperColorGray300;
+ (UIColor *)paperColorGray400;
+ (UIColor *)paperColorGray500;
+ (UIColor *)paperColorGray600;
+ (UIColor *)paperColorGray700;
+ (UIColor *)paperColorGray800;
+ (UIColor *)paperColorGray900;
+ (UIColor *)paperColorGray;

#pragma mark - Blue Gray
+ (UIColor *)paperColorBlueGray50;
+ (UIColor *)paperColorBlueGray100;
+ (UIColor *)paperColorBlueGray200;
+ (UIColor *)paperColorBlueGray300;
+ (UIColor *)paperColorBlueGray400;
+ (UIColor *)paperColorBlueGray500;
+ (UIColor *)paperColorBlueGray600;
+ (UIColor *)paperColorBlueGray700;
+ (UIColor *)paperColorBlueGray800;
+ (UIColor *)paperColorBlueGray900;
+ (UIColor *)paperColorBlueGray;



@end
