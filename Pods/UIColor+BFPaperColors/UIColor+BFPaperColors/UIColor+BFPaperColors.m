//
//  UIColor+BFPaperColors.m
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

#import "UIColor+BFPaperColors.h"

@implementation UIColor (BFPaperColors)


#pragma mark - Red
+ (UIColor *)paperColorRed50    { return UIColorFromRGB(0xfde0dc); }
+ (UIColor *)paperColorRed100   { return UIColorFromRGB(0xf9bdbb); }
+ (UIColor *)paperColorRed200   { return UIColorFromRGB(0xf69988); }
+ (UIColor *)paperColorRed300   { return UIColorFromRGB(0xf36c60); }
+ (UIColor *)paperColorRed400   { return UIColorFromRGB(0xe84e40); }
+ (UIColor *)paperColorRed500   { return UIColorFromRGB(0xe51c23); }
+ (UIColor *)paperColorRed600   { return UIColorFromRGB(0xdd191d); }
+ (UIColor *)paperColorRed700   { return UIColorFromRGB(0xd01716); }
+ (UIColor *)paperColorRed800   { return UIColorFromRGB(0xc41411); }
+ (UIColor *)paperColorRed900   { return UIColorFromRGB(0xb0120a); }
+ (UIColor *)paperColorRedA100  { return UIColorFromRGB(0xff7997); }
+ (UIColor *)paperColorRedA200  { return UIColorFromRGB(0xff5177); }
+ (UIColor *)paperColorRedA400  { return UIColorFromRGB(0xff2d6f); }
+ (UIColor *)paperColorRedA700  { return UIColorFromRGB(0xe00032); }
+ (UIColor *)paperColorRed      { return [UIColor paperColorRed500]; }


#pragma mark - Pink
+ (UIColor *)paperColorPink50   { return UIColorFromRGB(0xfce4ec); }
+ (UIColor *)paperColorPink100  { return UIColorFromRGB(0xf8bbd0); }
+ (UIColor *)paperColorPink200  { return UIColorFromRGB(0xf48fb1); }
+ (UIColor *)paperColorPink300  { return UIColorFromRGB(0xf06292); }
+ (UIColor *)paperColorPink400  { return UIColorFromRGB(0xec407a); }
+ (UIColor *)paperColorPink500  { return UIColorFromRGB(0xe91e63); }
+ (UIColor *)paperColorPink600  { return UIColorFromRGB(0xd81b60); }
+ (UIColor *)paperColorPink700  { return UIColorFromRGB(0xc2185b); }
+ (UIColor *)paperColorPink800  { return UIColorFromRGB(0xad1457); }
+ (UIColor *)paperColorPink900  { return UIColorFromRGB(0x880e4f); }
+ (UIColor *)paperColorPinkA100 { return UIColorFromRGB(0xff80ab); }
+ (UIColor *)paperColorPinkA200 { return UIColorFromRGB(0xff4081); }
+ (UIColor *)paperColorPinkA400 { return UIColorFromRGB(0xf50057); }
+ (UIColor *)paperColorPinkA700 { return UIColorFromRGB(0xc51162); }
+ (UIColor *)paperColorPink     { return [UIColor paperColorPink500]; }


#pragma mark - Purple
+ (UIColor *)paperColorPurple50     { return UIColorFromRGB(0xf3e5f5); }
+ (UIColor *)paperColorPurple100    { return UIColorFromRGB(0xe1bee7); }
+ (UIColor *)paperColorPurple200    { return UIColorFromRGB(0xce93d8); }
+ (UIColor *)paperColorPurple300    { return UIColorFromRGB(0xba68c8); }
+ (UIColor *)paperColorPurple400    { return UIColorFromRGB(0xab47bc); }
+ (UIColor *)paperColorPurple500    { return UIColorFromRGB(0x9c27b0); }
+ (UIColor *)paperColorPurple600    { return UIColorFromRGB(0x8e24aa); }
+ (UIColor *)paperColorPurple700    { return UIColorFromRGB(0x7b1fa2); }
+ (UIColor *)paperColorPurple800    { return UIColorFromRGB(0x6a1b9a); }
+ (UIColor *)paperColorPurple900    { return UIColorFromRGB(0x4a148c); }
+ (UIColor *)paperColorPurpleA100   { return UIColorFromRGB(0xea80fc); }
+ (UIColor *)paperColorPurpleA200   { return UIColorFromRGB(0xe040fb); }
+ (UIColor *)paperColorPurpleA400   { return UIColorFromRGB(0xd500f9); }
+ (UIColor *)paperColorPurpleA700   { return UIColorFromRGB(0xaa00ff); }
+ (UIColor *)paperColorPurple;      { return [UIColor paperColorPurple500]; }


#pragma mark - Deep Purple
+ (UIColor *)paperColorDeepPurple50     { return UIColorFromRGB(0xede7f6); }
+ (UIColor *)paperColorDeepPurple100    { return UIColorFromRGB(0xd1c4e9); }
+ (UIColor *)paperColorDeepPurple200    { return UIColorFromRGB(0xb39ddb); }
+ (UIColor *)paperColorDeepPurple300    { return UIColorFromRGB(0x9575cd); }
+ (UIColor *)paperColorDeepPurple400    { return UIColorFromRGB(0x7e57c2); }
+ (UIColor *)paperColorDeepPurple500    { return UIColorFromRGB(0x673ab7); }
+ (UIColor *)paperColorDeepPurple600    { return UIColorFromRGB(0x5e35b1); }
+ (UIColor *)paperColorDeepPurple700    { return UIColorFromRGB(0x512da8); }
+ (UIColor *)paperColorDeepPurple800    { return UIColorFromRGB(0x4527a0); }
+ (UIColor *)paperColorDeepPurple900    { return UIColorFromRGB(0x311b92); }
+ (UIColor *)paperColorDeepPurpleA100   { return UIColorFromRGB(0xb388ff); }
+ (UIColor *)paperColorDeepPurpleA200   { return UIColorFromRGB(0x7c4dff); }
+ (UIColor *)paperColorDeepPurpleA400   { return UIColorFromRGB(0x651fff); }
+ (UIColor *)paperColorDeepPurpleA700   { return UIColorFromRGB(0x6200ea); }
+ (UIColor *)paperColorDeepPurple       { return [UIColor paperColorDeepPurple500]; }


#pragma mark - Indigo
+ (UIColor *)paperColorIndigo50     { return UIColorFromRGB(0xe8eaf6); }
+ (UIColor *)paperColorIndigo100    { return UIColorFromRGB(0xc5cae9); }
+ (UIColor *)paperColorIndigo200    { return UIColorFromRGB(0x9fa8da); }
+ (UIColor *)paperColorIndigo300    { return UIColorFromRGB(0x7986cb); }
+ (UIColor *)paperColorIndigo400    { return UIColorFromRGB(0x5c6bc0); }
+ (UIColor *)paperColorIndigo500    { return UIColorFromRGB(0x3f51b5); }
+ (UIColor *)paperColorIndigo600    { return UIColorFromRGB(0x3949ab); }
+ (UIColor *)paperColorIndigo700    { return UIColorFromRGB(0x303f9f); }
+ (UIColor *)paperColorIndigo800    { return UIColorFromRGB(0x283593); }
+ (UIColor *)paperColorIndigo900    { return UIColorFromRGB(0x1a237e); }
+ (UIColor *)paperColorIndigoA100   { return UIColorFromRGB(0x8c9eff); }
+ (UIColor *)paperColorIndigoA200   { return UIColorFromRGB(0x536dfe); }
+ (UIColor *)paperColorIndigoA400   { return UIColorFromRGB(0x3d5afe); }
+ (UIColor *)paperColorIndigoA700   { return UIColorFromRGB(0x304ffe); }
+ (UIColor *)paperColorIndigo       { return [UIColor paperColorIndigo500]; }


#pragma mark - Blue
+ (UIColor *)paperColorBlue50       { return UIColorFromRGB(0xe7e9fd); }
+ (UIColor *)paperColorBlue100      { return UIColorFromRGB(0xd0d9ff); }
+ (UIColor *)paperColorBlue200      { return UIColorFromRGB(0xafbfff); }
+ (UIColor *)paperColorBlue300      { return UIColorFromRGB(0x91a7ff); }
+ (UIColor *)paperColorBlue400      { return UIColorFromRGB(0x738ffe); }
+ (UIColor *)paperColorBlue500      { return UIColorFromRGB(0x5677fc); }
+ (UIColor *)paperColorBlue600      { return UIColorFromRGB(0x4e6cef); }
+ (UIColor *)paperColorBlue700      { return UIColorFromRGB(0x455ede); }
+ (UIColor *)paperColorBlue800      { return UIColorFromRGB(0x3b50ce); }
+ (UIColor *)paperColorBlue900      { return UIColorFromRGB(0x2a36b1); }
+ (UIColor *)paperColorBlueA100     { return UIColorFromRGB(0xa6baff); }
+ (UIColor *)paperColorBlueA200     { return UIColorFromRGB(0x6889ff); }
+ (UIColor *)paperColorBlueA400     { return UIColorFromRGB(0x4d73ff); }
+ (UIColor *)paperColorBlueA700     { return UIColorFromRGB(0x4d69ff); }
+ (UIColor *)paperColorBlue         { return [UIColor paperColorBlue500]; }


#pragma mark - Light Blue
+ (UIColor *)paperColorLightBlue50      { return UIColorFromRGB(0xe1f5fe); }
+ (UIColor *)paperColorLightBlue100     { return UIColorFromRGB(0xb3e5fc); }
+ (UIColor *)paperColorLightBlue200     { return UIColorFromRGB(0x81d4fa); }
+ (UIColor *)paperColorLightBlue300     { return UIColorFromRGB(0x4fc3f7); }
+ (UIColor *)paperColorLightBlue400     { return UIColorFromRGB(0x29b6f6); }
+ (UIColor *)paperColorLightBlue500     { return UIColorFromRGB(0x03a9f4); }
+ (UIColor *)paperColorLightBlue600     { return UIColorFromRGB(0x039be5); }
+ (UIColor *)paperColorLightBlue700     { return UIColorFromRGB(0x0288d1); }
+ (UIColor *)paperColorLightBlue800     { return UIColorFromRGB(0x0277bd); }
+ (UIColor *)paperColorLightBlue900     { return UIColorFromRGB(0x01579b); }
+ (UIColor *)paperColorLightBlueA100    { return UIColorFromRGB(0x80d8ff); }
+ (UIColor *)paperColorLightBlueA200    { return UIColorFromRGB(0x40c4ff); }
+ (UIColor *)paperColorLightBlueA400    { return UIColorFromRGB(0x00b0ff); }
+ (UIColor *)paperColorLightBlueA700    { return UIColorFromRGB(0x0091ea); }
+ (UIColor *)paperColorLightBlue        { return [UIColor paperColorLightBlue500]; }


#pragma mark - Cyan
+ (UIColor *)paperColorCyan50   { return UIColorFromRGB(0xe0f7fa); }
+ (UIColor *)paperColorCyan100  { return UIColorFromRGB(0xb2ebf2); }
+ (UIColor *)paperColorCyan200  { return UIColorFromRGB(0x80deea); }
+ (UIColor *)paperColorCyan300  { return UIColorFromRGB(0x4dd0e1); }
+ (UIColor *)paperColorCyan400  { return UIColorFromRGB(0x26c6da); }
+ (UIColor *)paperColorCyan500  { return UIColorFromRGB(0x00bcd4); }
+ (UIColor *)paperColorCyan600  { return UIColorFromRGB(0x00acc1); }
+ (UIColor *)paperColorCyan700  { return UIColorFromRGB(0x0097a7); }
+ (UIColor *)paperColorCyan800  { return UIColorFromRGB(0x00838f); }
+ (UIColor *)paperColorCyan900  { return UIColorFromRGB(0x006064); }
+ (UIColor *)paperColorCyanA100 { return UIColorFromRGB(0x84ffff); }
+ (UIColor *)paperColorCyanA200 { return UIColorFromRGB(0x18ffff); }
+ (UIColor *)paperColorCyanA400 { return UIColorFromRGB(0x00e5ff); }
+ (UIColor *)paperColorCyanA700 { return UIColorFromRGB(0x00b8d4); }
+ (UIColor *)paperColorCyan     { return [UIColor paperColorCyan500]; }


#pragma mark - Teal
+ (UIColor *)paperColorTeal50   { return UIColorFromRGB(0xe0f2f1); }
+ (UIColor *)paperColorTeal100  { return UIColorFromRGB(0xb2dfdb); }
+ (UIColor *)paperColorTeal200  { return UIColorFromRGB(0x80cbc4); }
+ (UIColor *)paperColorTeal300  { return UIColorFromRGB(0x4db6ac); }
+ (UIColor *)paperColorTeal400  { return UIColorFromRGB(0x26a69a); }
+ (UIColor *)paperColorTeal500  { return UIColorFromRGB(0x009688); }
+ (UIColor *)paperColorTeal600  { return UIColorFromRGB(0x00897b); }
+ (UIColor *)paperColorTeal700  { return UIColorFromRGB(0x00796b); }
+ (UIColor *)paperColorTeal800  { return UIColorFromRGB(0x00695c); }
+ (UIColor *)paperColorTeal900  { return UIColorFromRGB(0x004d40); }
+ (UIColor *)paperColorTealA100 { return UIColorFromRGB(0xa7ffeb); }
+ (UIColor *)paperColorTealA200 { return UIColorFromRGB(0x64ffda); }
+ (UIColor *)paperColorTealA400 { return UIColorFromRGB(0x1de9b6); }
+ (UIColor *)paperColorTealA700 { return UIColorFromRGB(0x00bfa5); }
+ (UIColor *)paperColorTeal     { return [UIColor paperColorTeal500]; }


#pragma mark - Green
+ (UIColor *)paperColorGreen50      { return UIColorFromRGB(0xd0f8ce); }
+ (UIColor *)paperColorGreen100     { return UIColorFromRGB(0xa3e9a4); }
+ (UIColor *)paperColorGreen200     { return UIColorFromRGB(0x72d572); }
+ (UIColor *)paperColorGreen300     { return UIColorFromRGB(0x42bd41); }
+ (UIColor *)paperColorGreen400     { return UIColorFromRGB(0x2baf2b); }
+ (UIColor *)paperColorGreen500     { return UIColorFromRGB(0x259b24); }
+ (UIColor *)paperColorGreen600     { return UIColorFromRGB(0x0a8f08); }
+ (UIColor *)paperColorGreen700     { return UIColorFromRGB(0x0a7e07); }
+ (UIColor *)paperColorGreen800     { return UIColorFromRGB(0x056f00); }
+ (UIColor *)paperColorGreen900     { return UIColorFromRGB(0x0d5302); }
+ (UIColor *)paperColorGreenA100    { return UIColorFromRGB(0xa2f78d); }
+ (UIColor *)paperColorGreenA200    { return UIColorFromRGB(0x5af158); }
+ (UIColor *)paperColorGreenA400    { return UIColorFromRGB(0x14e715); }
+ (UIColor *)paperColorGreenA700    { return UIColorFromRGB(0x12c700); }
+ (UIColor *)paperColorGreen        { return [UIColor paperColorGreen500]; }


#pragma mark - Light Green
+ (UIColor *)paperColorLightGreen50     { return UIColorFromRGB(0xf1f8e9); }
+ (UIColor *)paperColorLightGreen100    { return UIColorFromRGB(0xdcedc8); }
+ (UIColor *)paperColorLightGreen200    { return UIColorFromRGB(0xc5e1a5); }
+ (UIColor *)paperColorLightGreen300    { return UIColorFromRGB(0xaed581); }
+ (UIColor *)paperColorLightGreen400    { return UIColorFromRGB(0x9ccc65); }
+ (UIColor *)paperColorLightGreen500    { return UIColorFromRGB(0x8bc34a); }
+ (UIColor *)paperColorLightGreen600    { return UIColorFromRGB(0x7cb342); }
+ (UIColor *)paperColorLightGreen700    { return UIColorFromRGB(0x689f38); }
+ (UIColor *)paperColorLightGreen800    { return UIColorFromRGB(0x558b2f); }
+ (UIColor *)paperColorLightGreen900    { return UIColorFromRGB(0x33691e); }
+ (UIColor *)paperColorLightGreenA100   { return UIColorFromRGB(0xccff90); }
+ (UIColor *)paperColorLightGreenA200   { return UIColorFromRGB(0xb2ff59); }
+ (UIColor *)paperColorLightGreenA400   { return UIColorFromRGB(0x76ff03); }
+ (UIColor *)paperColorLightGreenA700   { return UIColorFromRGB(0x64dd17); }
+ (UIColor *)paperColorLightGreen       { return [UIColor paperColorLightGreen500]; }


#pragma mark - Lime
+ (UIColor *)paperColorLime50   { return UIColorFromRGB(0xf9fbe7); }
+ (UIColor *)paperColorLime100  { return UIColorFromRGB(0xf0f4c3); }
+ (UIColor *)paperColorLime200  { return UIColorFromRGB(0xe6ee9c); }
+ (UIColor *)paperColorLime300  { return UIColorFromRGB(0xdce775); }
+ (UIColor *)paperColorLime400  { return UIColorFromRGB(0xd4e157); }
+ (UIColor *)paperColorLime500  { return UIColorFromRGB(0xcddc39); }
+ (UIColor *)paperColorLime600  { return UIColorFromRGB(0xc0ca33); }
+ (UIColor *)paperColorLime700  { return UIColorFromRGB(0xafb42b); }
+ (UIColor *)paperColorLime800  { return UIColorFromRGB(0x9e9d24); }
+ (UIColor *)paperColorLime900  { return UIColorFromRGB(0x827717); }
+ (UIColor *)paperColorLimeA100 { return UIColorFromRGB(0xf4ff81); }
+ (UIColor *)paperColorLimeA200 { return UIColorFromRGB(0xeeff41); }
+ (UIColor *)paperColorLimeA400 { return UIColorFromRGB(0xc6ff00); }
+ (UIColor *)paperColorLimeA700 { return UIColorFromRGB(0xaeea00); }
+ (UIColor *)paperColorLime     { return [UIColor paperColorLime500]; }


#pragma mark - Yellow
+ (UIColor *)paperColorYellow50     { return UIColorFromRGB(0xfffde7); }
+ (UIColor *)paperColorYellow100    { return UIColorFromRGB(0xfff9c4); }
+ (UIColor *)paperColorYellow200    { return UIColorFromRGB(0xfff59d); }
+ (UIColor *)paperColorYellow300    { return UIColorFromRGB(0xfff176); }
+ (UIColor *)paperColorYellow400    { return UIColorFromRGB(0xffee58); }
+ (UIColor *)paperColorYellow500    { return UIColorFromRGB(0xffeb3b); }
+ (UIColor *)paperColorYellow600    { return UIColorFromRGB(0xfdd835); }
+ (UIColor *)paperColorYellow700    { return UIColorFromRGB(0xfbc02d); }
+ (UIColor *)paperColorYellow800    { return UIColorFromRGB(0xf9a825); }
+ (UIColor *)paperColorYellow900    { return UIColorFromRGB(0xf57f17); }
+ (UIColor *)paperColorYellowA100   { return UIColorFromRGB(0xffff8d); }
+ (UIColor *)paperColorYellowA200   { return UIColorFromRGB(0xffff00); }
+ (UIColor *)paperColorYellowA400   { return UIColorFromRGB(0xffea00); }
+ (UIColor *)paperColorYellowA700   { return UIColorFromRGB(0xffd600); }
+ (UIColor *)paperColorYellow       { return [UIColor paperColorYellow500]; }


#pragma mark - Amber
+ (UIColor *)paperColorAmber50      { return UIColorFromRGB(0xfff8e1); }
+ (UIColor *)paperColorAmber100     { return UIColorFromRGB(0xffecb3); }
+ (UIColor *)paperColorAmber200     { return UIColorFromRGB(0xffe082); }
+ (UIColor *)paperColorAmber300     { return UIColorFromRGB(0xffd54f); }
+ (UIColor *)paperColorAmber400     { return UIColorFromRGB(0xffca28); }
+ (UIColor *)paperColorAmber500     { return UIColorFromRGB(0xffc107); }
+ (UIColor *)paperColorAmber600     { return UIColorFromRGB(0xffb300); }
+ (UIColor *)paperColorAmber700     { return UIColorFromRGB(0xffa000); }
+ (UIColor *)paperColorAmber800     { return UIColorFromRGB(0xff8f00); }
+ (UIColor *)paperColorAmber900     { return UIColorFromRGB(0xff6f00); }
+ (UIColor *)paperColorAmberA100    { return UIColorFromRGB(0xffe57f); }
+ (UIColor *)paperColorAmberA200    { return UIColorFromRGB(0xffd740); }
+ (UIColor *)paperColorAmberA400    { return UIColorFromRGB(0xffc400); }
+ (UIColor *)paperColorAmberA700    { return UIColorFromRGB(0xffab00); }
+ (UIColor *)paperColorAmber        { return [UIColor paperColorAmber500]; }


#pragma mark - Orange
+ (UIColor *)paperColorOrange50     { return UIColorFromRGB(0xfff3e0); }
+ (UIColor *)paperColorOrange100    { return UIColorFromRGB(0xffe0b2); }
+ (UIColor *)paperColorOrange200    { return UIColorFromRGB(0xffcc80); }
+ (UIColor *)paperColorOrange300    { return UIColorFromRGB(0xffb74d); }
+ (UIColor *)paperColorOrange400    { return UIColorFromRGB(0xffa726); }
+ (UIColor *)paperColorOrange500    { return UIColorFromRGB(0xff9800); }
+ (UIColor *)paperColorOrange600    { return UIColorFromRGB(0xfb8c00); }
+ (UIColor *)paperColorOrange700    { return UIColorFromRGB(0xf57c00); }
+ (UIColor *)paperColorOrange800    { return UIColorFromRGB(0xef6c00); }
+ (UIColor *)paperColorOrange900    { return UIColorFromRGB(0xe65100); }
+ (UIColor *)paperColorOrangeA100   { return UIColorFromRGB(0xffd180); }
+ (UIColor *)paperColorOrangeA200   { return UIColorFromRGB(0xffab40); }
+ (UIColor *)paperColorOrangeA400   { return UIColorFromRGB(0xff9100); }
+ (UIColor *)paperColorOrangeA700   { return UIColorFromRGB(0xff6d00); }
+ (UIColor *)paperColorOrange       { return [UIColor paperColorOrange500]; }


#pragma mark - Deep Orange
+ (UIColor *)paperColorDeepOrange50     { return UIColorFromRGB(0xfbe9e7); }
+ (UIColor *)paperColorDeepOrange100    { return UIColorFromRGB(0xffccbc); }
+ (UIColor *)paperColorDeepOrange200    { return UIColorFromRGB(0xffab91); }
+ (UIColor *)paperColorDeepOrange300    { return UIColorFromRGB(0xff8a65); }
+ (UIColor *)paperColorDeepOrange400    { return UIColorFromRGB(0xff7043); }
+ (UIColor *)paperColorDeepOrange500    { return UIColorFromRGB(0xff5722); }
+ (UIColor *)paperColorDeepOrange600    { return UIColorFromRGB(0xf4511e); }
+ (UIColor *)paperColorDeepOrange700    { return UIColorFromRGB(0xe64a19); }
+ (UIColor *)paperColorDeepOrange800    { return UIColorFromRGB(0xd84315); }
+ (UIColor *)paperColorDeepOrange900    { return UIColorFromRGB(0xbf360c); }
+ (UIColor *)paperColorDeepOrangeA100   { return UIColorFromRGB(0xff9e80); }
+ (UIColor *)paperColorDeepOrangeA200   { return UIColorFromRGB(0xff6e40); }
+ (UIColor *)paperColorDeepOrangeA400   { return UIColorFromRGB(0xff3d00); }
+ (UIColor *)paperColorDeepOrangeA700   { return UIColorFromRGB(0xdd2c00); }
+ (UIColor *)paperColorDeepOrange       { return [UIColor paperColorDeepOrange500]; }


#pragma mark - Brown
+ (UIColor *)paperColorBrown50      { return UIColorFromRGB(0xefebe9); }
+ (UIColor *)paperColorBrown100     { return UIColorFromRGB(0xd7ccc8); }
+ (UIColor *)paperColorBrown200     { return UIColorFromRGB(0xbcaaa4); }
+ (UIColor *)paperColorBrown300     { return UIColorFromRGB(0xa1887f); }
+ (UIColor *)paperColorBrown400     { return UIColorFromRGB(0x8d6e63); }
+ (UIColor *)paperColorBrown500     { return UIColorFromRGB(0x795548); }
+ (UIColor *)paperColorBrown600     { return UIColorFromRGB(0x6d4c41); }
+ (UIColor *)paperColorBrown700     { return UIColorFromRGB(0x5d4037); }
+ (UIColor *)paperColorBrown800     { return UIColorFromRGB(0x4e342e); }
+ (UIColor *)paperColorBrown900     { return UIColorFromRGB(0x3e2723); }
+ (UIColor *)paperColorBrown        { return [UIColor paperColorBrown500]; }


#pragma mark - Gray
+ (UIColor *)paperColorGray50   { return UIColorFromRGB(0xfafafa); }
+ (UIColor *)paperColorGray100  { return UIColorFromRGB(0xf5f5f5); }
+ (UIColor *)paperColorGray200  { return UIColorFromRGB(0xeeeeee); }
+ (UIColor *)paperColorGray300  { return UIColorFromRGB(0xe0e0e0); }
+ (UIColor *)paperColorGray400  { return UIColorFromRGB(0xbdbdbd); }
+ (UIColor *)paperColorGray500  { return UIColorFromRGB(0x9e9e9e); }
+ (UIColor *)paperColorGray600  { return UIColorFromRGB(0x757575); }
+ (UIColor *)paperColorGray700  { return UIColorFromRGB(0x616161); }
+ (UIColor *)paperColorGray800  { return UIColorFromRGB(0x424242); }
+ (UIColor *)paperColorGray900  { return UIColorFromRGB(0x212121); }
+ (UIColor *)paperColorGray     { return [UIColor paperColorGray500]; }


#pragma mark - Blue Gray
+ (UIColor *)paperColorBlueGray50   { return UIColorFromRGB(0xeceff1); }
+ (UIColor *)paperColorBlueGray100  { return UIColorFromRGB(0xcfd8dc); }
+ (UIColor *)paperColorBlueGray200  { return UIColorFromRGB(0xb0bec5); }
+ (UIColor *)paperColorBlueGray300  { return UIColorFromRGB(0x90a4ae); }
+ (UIColor *)paperColorBlueGray400  { return UIColorFromRGB(0x78909c); }
+ (UIColor *)paperColorBlueGray500  { return UIColorFromRGB(0x607d8b); }
+ (UIColor *)paperColorBlueGray600  { return UIColorFromRGB(0x546e7a); }
+ (UIColor *)paperColorBlueGray700  { return UIColorFromRGB(0x455a64); }
+ (UIColor *)paperColorBlueGray800  { return UIColorFromRGB(0x37474f); }
+ (UIColor *)paperColorBlueGray900  { return UIColorFromRGB(0x263238); }
+ (UIColor *)paperColorBlueGray     { return [UIColor paperColorBlueGray500]; }


#pragma mark - Utilities
+ (BOOL)isColorClear:(UIColor *)color
{
    if (color == [UIColor clearColor]) {
        return YES;
    }
    
    NSUInteger totalComponents = CGColorGetNumberOfComponents(color.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    CGFloat *components = (CGFloat *)CGColorGetComponents(color.CGColor);
    if (!components) {
        return YES;
    }
    
    if(isGreyscale) {
        if (components[1] <= 0) {
            return YES;
        }
    }
    else {
        if (components[3] <= 0) {
            return YES;
        }
    }
    
    return NO;
}


+ (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (NSString *)colorToHex:(UIColor *)color
{
    NSString *hexColor = nil;
    
    // This method only works for RGB colors
    if (color
        &&
        CGColorGetNumberOfComponents(color.CGColor) == 4) {
        // Get the red, green and blue components
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        
        // These components range from [0.0, 1.0] and need to be converted to [0, 255]
        CGFloat red, green, blue;
        red = roundf(components[0] * 255.0);
        green = roundf(components[1] * 255.0);
        blue = roundf(components[2] * 255.0);
        
        // Convert with %02x (use 02 to always get two chars)
        hexColor = [[NSString alloc]initWithFormat:@"%02x%02x%02x", (int)red, (int)green, (int)blue];
    }
    
    return hexColor;
}


@end
