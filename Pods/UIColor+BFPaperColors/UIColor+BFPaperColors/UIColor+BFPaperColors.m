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
+ (UIColor *)paperColorRed50    { return UIColorFromRGB(0xFFEBEE); }
+ (UIColor *)paperColorRed100   { return UIColorFromRGB(0xFFCDD2); }
+ (UIColor *)paperColorRed200   { return UIColorFromRGB(0xEF9A9A); }
+ (UIColor *)paperColorRed300   { return UIColorFromRGB(0xE57373); }
+ (UIColor *)paperColorRed400   { return UIColorFromRGB(0xEF5350); }
+ (UIColor *)paperColorRed500   { return UIColorFromRGB(0xF44336); }
+ (UIColor *)paperColorRed600   { return UIColorFromRGB(0xE53935); }
+ (UIColor *)paperColorRed700   { return UIColorFromRGB(0xD32F2F); }
+ (UIColor *)paperColorRed800   { return UIColorFromRGB(0xC62828); }
+ (UIColor *)paperColorRed900   { return UIColorFromRGB(0xB71C1C); }
+ (UIColor *)paperColorRedA100  { return UIColorFromRGB(0xFF8A80); }
+ (UIColor *)paperColorRedA200  { return UIColorFromRGB(0xFF5252); }
+ (UIColor *)paperColorRedA400  { return UIColorFromRGB(0xFF1744); }
+ (UIColor *)paperColorRedA700  { return UIColorFromRGB(0xD50000); }
+ (UIColor *)paperColorRed      { return [UIColor paperColorRed500]; }


#pragma mark - Pink
+ (UIColor *)paperColorPink50   { return UIColorFromRGB(0xFCE4EC); }
+ (UIColor *)paperColorPink100  { return UIColorFromRGB(0xF8BBD0); }
+ (UIColor *)paperColorPink200  { return UIColorFromRGB(0xF48FB1); }
+ (UIColor *)paperColorPink300  { return UIColorFromRGB(0xF06292); }
+ (UIColor *)paperColorPink400  { return UIColorFromRGB(0xEC407A); }
+ (UIColor *)paperColorPink500  { return UIColorFromRGB(0xE91E63); }
+ (UIColor *)paperColorPink600  { return UIColorFromRGB(0xD81B60); }
+ (UIColor *)paperColorPink700  { return UIColorFromRGB(0xC2185B); }
+ (UIColor *)paperColorPink800  { return UIColorFromRGB(0xAD1457); }
+ (UIColor *)paperColorPink900  { return UIColorFromRGB(0x880E4F); }
+ (UIColor *)paperColorPinkA100 { return UIColorFromRGB(0xFF80AB); }
+ (UIColor *)paperColorPinkA200 { return UIColorFromRGB(0xFF4081); }
+ (UIColor *)paperColorPinkA400 { return UIColorFromRGB(0xF50057); }
+ (UIColor *)paperColorPinkA700 { return UIColorFromRGB(0xC51162); }
+ (UIColor *)paperColorPink     { return [UIColor paperColorPink500]; }


#pragma mark - Purple
+ (UIColor *)paperColorPurple50     { return UIColorFromRGB(0xF3E5F5); }
+ (UIColor *)paperColorPurple100    { return UIColorFromRGB(0xE1BEE7); }
+ (UIColor *)paperColorPurple200    { return UIColorFromRGB(0xCE93D8); }
+ (UIColor *)paperColorPurple300    { return UIColorFromRGB(0xBA68C8); }
+ (UIColor *)paperColorPurple400    { return UIColorFromRGB(0xAB47BC); }
+ (UIColor *)paperColorPurple500    { return UIColorFromRGB(0x9C27B0); }
+ (UIColor *)paperColorPurple600    { return UIColorFromRGB(0x8E24AA); }
+ (UIColor *)paperColorPurple700    { return UIColorFromRGB(0x7B1FA2); }
+ (UIColor *)paperColorPurple800    { return UIColorFromRGB(0x6A1B9A); }
+ (UIColor *)paperColorPurple900    { return UIColorFromRGB(0x4A148C); }
+ (UIColor *)paperColorPurpleA100   { return UIColorFromRGB(0xEA80FC); }
+ (UIColor *)paperColorPurpleA200   { return UIColorFromRGB(0xE040FB); }
+ (UIColor *)paperColorPurpleA400   { return UIColorFromRGB(0xD500F9); }
+ (UIColor *)paperColorPurpleA700   { return UIColorFromRGB(0xAA00FF); }
+ (UIColor *)paperColorPurple;      { return [UIColor paperColorPurple500]; }


#pragma mark - Deep Purple
+ (UIColor *)paperColorDeepPurple50     { return UIColorFromRGB(0xEDE7F6); }
+ (UIColor *)paperColorDeepPurple100    { return UIColorFromRGB(0xD1C4E9); }
+ (UIColor *)paperColorDeepPurple200    { return UIColorFromRGB(0xB39DDB); }
+ (UIColor *)paperColorDeepPurple300    { return UIColorFromRGB(0x9575CD); }
+ (UIColor *)paperColorDeepPurple400    { return UIColorFromRGB(0x7E57C2); }
+ (UIColor *)paperColorDeepPurple500    { return UIColorFromRGB(0x673AB7); }
+ (UIColor *)paperColorDeepPurple600    { return UIColorFromRGB(0x5E35B1); }
+ (UIColor *)paperColorDeepPurple700    { return UIColorFromRGB(0x512DA8); }
+ (UIColor *)paperColorDeepPurple800    { return UIColorFromRGB(0x4527A0); }
+ (UIColor *)paperColorDeepPurple900    { return UIColorFromRGB(0x311B92); }
+ (UIColor *)paperColorDeepPurpleA100   { return UIColorFromRGB(0xB388FF); }
+ (UIColor *)paperColorDeepPurpleA200   { return UIColorFromRGB(0x7C4DFF); }
+ (UIColor *)paperColorDeepPurpleA400   { return UIColorFromRGB(0x651FFF); }
+ (UIColor *)paperColorDeepPurpleA700   { return UIColorFromRGB(0x6200EA); }
+ (UIColor *)paperColorDeepPurple       { return [UIColor paperColorDeepPurple500]; }


#pragma mark - Indigo
+ (UIColor *)paperColorIndigo50     { return UIColorFromRGB(0xE8EAF6); }
+ (UIColor *)paperColorIndigo100    { return UIColorFromRGB(0xC5CAE9); }
+ (UIColor *)paperColorIndigo200    { return UIColorFromRGB(0x9FA8DA); }
+ (UIColor *)paperColorIndigo300    { return UIColorFromRGB(0x7986CB); }
+ (UIColor *)paperColorIndigo400    { return UIColorFromRGB(0x5C6BC0); }
+ (UIColor *)paperColorIndigo500    { return UIColorFromRGB(0x3F51B5); }
+ (UIColor *)paperColorIndigo600    { return UIColorFromRGB(0x3949AB); }
+ (UIColor *)paperColorIndigo700    { return UIColorFromRGB(0x303F9F); }
+ (UIColor *)paperColorIndigo800    { return UIColorFromRGB(0x283593); }
+ (UIColor *)paperColorIndigo900    { return UIColorFromRGB(0x1A237E); }
+ (UIColor *)paperColorIndigoA100   { return UIColorFromRGB(0x8C9EFF); }
+ (UIColor *)paperColorIndigoA200   { return UIColorFromRGB(0x536DFE); }
+ (UIColor *)paperColorIndigoA400   { return UIColorFromRGB(0x3D5AFE); }
+ (UIColor *)paperColorIndigoA700   { return UIColorFromRGB(0x304FFE); }
+ (UIColor *)paperColorIndigo       { return [UIColor paperColorIndigo500]; }


#pragma mark - Blue
+ (UIColor *)paperColorBlue50       { return UIColorFromRGB(0xE3F2FD); }
+ (UIColor *)paperColorBlue100      { return UIColorFromRGB(0xBBDEFB); }
+ (UIColor *)paperColorBlue200      { return UIColorFromRGB(0x90CAF9); }
+ (UIColor *)paperColorBlue300      { return UIColorFromRGB(0x64B5F6); }
+ (UIColor *)paperColorBlue400      { return UIColorFromRGB(0x42A5F5); }
+ (UIColor *)paperColorBlue500      { return UIColorFromRGB(0x2196F3); }
+ (UIColor *)paperColorBlue600      { return UIColorFromRGB(0x1E88E5); }
+ (UIColor *)paperColorBlue700      { return UIColorFromRGB(0x1976D2); }
+ (UIColor *)paperColorBlue800      { return UIColorFromRGB(0x1565C0); }
+ (UIColor *)paperColorBlue900      { return UIColorFromRGB(0x0D47A1); }
+ (UIColor *)paperColorBlueA100     { return UIColorFromRGB(0x82B1FF); }
+ (UIColor *)paperColorBlueA200     { return UIColorFromRGB(0x448AFF); }
+ (UIColor *)paperColorBlueA400     { return UIColorFromRGB(0x2979FF); }
+ (UIColor *)paperColorBlueA700     { return UIColorFromRGB(0x2962FF); }
+ (UIColor *)paperColorBlue         { return [UIColor paperColorBlue500]; }


#pragma mark - Light Blue
+ (UIColor *)paperColorLightBlue50      { return UIColorFromRGB(0xE1F5FE); }
+ (UIColor *)paperColorLightBlue100     { return UIColorFromRGB(0xB3E5FC); }
+ (UIColor *)paperColorLightBlue200     { return UIColorFromRGB(0x81D4FA); }
+ (UIColor *)paperColorLightBlue300     { return UIColorFromRGB(0x4FC3F7); }
+ (UIColor *)paperColorLightBlue400     { return UIColorFromRGB(0x29B6F6); }
+ (UIColor *)paperColorLightBlue500     { return UIColorFromRGB(0x03A9F4); }
+ (UIColor *)paperColorLightBlue600     { return UIColorFromRGB(0x039BE5); }
+ (UIColor *)paperColorLightBlue700     { return UIColorFromRGB(0x0288D1); }
+ (UIColor *)paperColorLightBlue800     { return UIColorFromRGB(0x0277BD); }
+ (UIColor *)paperColorLightBlue900     { return UIColorFromRGB(0x01579B); }
+ (UIColor *)paperColorLightBlueA100    { return UIColorFromRGB(0x80D8FF); }
+ (UIColor *)paperColorLightBlueA200    { return UIColorFromRGB(0x40C4FF); }
+ (UIColor *)paperColorLightBlueA400    { return UIColorFromRGB(0x00B0FF); }
+ (UIColor *)paperColorLightBlueA700    { return UIColorFromRGB(0x0091EA); }
+ (UIColor *)paperColorLightBlue        { return [UIColor paperColorLightBlue500]; }


#pragma mark - Cyan
+ (UIColor *)paperColorCyan50   { return UIColorFromRGB(0xE0F7FA); }
+ (UIColor *)paperColorCyan100  { return UIColorFromRGB(0xB2EBF2); }
+ (UIColor *)paperColorCyan200  { return UIColorFromRGB(0x80DEEA); }
+ (UIColor *)paperColorCyan300  { return UIColorFromRGB(0x4DD0E1); }
+ (UIColor *)paperColorCyan400  { return UIColorFromRGB(0x26C6DA); }
+ (UIColor *)paperColorCyan500  { return UIColorFromRGB(0x00BCD4); }
+ (UIColor *)paperColorCyan600  { return UIColorFromRGB(0x00ACC1); }
+ (UIColor *)paperColorCyan700  { return UIColorFromRGB(0x0097A7); }
+ (UIColor *)paperColorCyan800  { return UIColorFromRGB(0x00838F); }
+ (UIColor *)paperColorCyan900  { return UIColorFromRGB(0x006064); }
+ (UIColor *)paperColorCyanA100 { return UIColorFromRGB(0x84FFFF); }
+ (UIColor *)paperColorCyanA200 { return UIColorFromRGB(0x18FFFF); }
+ (UIColor *)paperColorCyanA400 { return UIColorFromRGB(0x00E5FF); }
+ (UIColor *)paperColorCyanA700 { return UIColorFromRGB(0x00B8D4); }
+ (UIColor *)paperColorCyan     { return [UIColor paperColorCyan500]; }


#pragma mark - Teal
+ (UIColor *)paperColorTeal50   { return UIColorFromRGB(0xE0F2F1); }
+ (UIColor *)paperColorTeal100  { return UIColorFromRGB(0xB2DFDB); }
+ (UIColor *)paperColorTeal200  { return UIColorFromRGB(0x80CBC4); }
+ (UIColor *)paperColorTeal300  { return UIColorFromRGB(0x4DB6AC); }
+ (UIColor *)paperColorTeal400  { return UIColorFromRGB(0x26A69A); }
+ (UIColor *)paperColorTeal500  { return UIColorFromRGB(0x009688); }
+ (UIColor *)paperColorTeal600  { return UIColorFromRGB(0x00897B); }
+ (UIColor *)paperColorTeal700  { return UIColorFromRGB(0x00796B); }
+ (UIColor *)paperColorTeal800  { return UIColorFromRGB(0x00695C); }
+ (UIColor *)paperColorTeal900  { return UIColorFromRGB(0x004D40); }
+ (UIColor *)paperColorTealA100 { return UIColorFromRGB(0xA7FFEB); }
+ (UIColor *)paperColorTealA200 { return UIColorFromRGB(0x64FFDA); }
+ (UIColor *)paperColorTealA400 { return UIColorFromRGB(0x1DE9B6); }
+ (UIColor *)paperColorTealA700 { return UIColorFromRGB(0x00BFA5); }
+ (UIColor *)paperColorTeal     { return [UIColor paperColorTeal500]; }


#pragma mark - Green
+ (UIColor *)paperColorGreen50      { return UIColorFromRGB(0xE8F5E9); }
+ (UIColor *)paperColorGreen100     { return UIColorFromRGB(0xC8E6C9); }
+ (UIColor *)paperColorGreen200     { return UIColorFromRGB(0xA5D6A7); }
+ (UIColor *)paperColorGreen300     { return UIColorFromRGB(0x81C784); }
+ (UIColor *)paperColorGreen400     { return UIColorFromRGB(0x66BB6A); }
+ (UIColor *)paperColorGreen500     { return UIColorFromRGB(0x4CAF50); }
+ (UIColor *)paperColorGreen600     { return UIColorFromRGB(0x43A047); }
+ (UIColor *)paperColorGreen700     { return UIColorFromRGB(0x388E3C); }
+ (UIColor *)paperColorGreen800     { return UIColorFromRGB(0x2E7D32); }
+ (UIColor *)paperColorGreen900     { return UIColorFromRGB(0x1B5E20); }
+ (UIColor *)paperColorGreenA100    { return UIColorFromRGB(0xB9F6CA); }
+ (UIColor *)paperColorGreenA200    { return UIColorFromRGB(0x69F0AE); }
+ (UIColor *)paperColorGreenA400    { return UIColorFromRGB(0x00E676); }
+ (UIColor *)paperColorGreenA700    { return UIColorFromRGB(0x00C853); }
+ (UIColor *)paperColorGreen        { return [UIColor paperColorGreen500]; }


#pragma mark - Light Green
+ (UIColor *)paperColorLightGreen50     { return UIColorFromRGB(0xF1F8E9); }
+ (UIColor *)paperColorLightGreen100    { return UIColorFromRGB(0xDCEDC8); }
+ (UIColor *)paperColorLightGreen200    { return UIColorFromRGB(0xC5E1A5); }
+ (UIColor *)paperColorLightGreen300    { return UIColorFromRGB(0xAED581); }
+ (UIColor *)paperColorLightGreen400    { return UIColorFromRGB(0x9CCC65); }
+ (UIColor *)paperColorLightGreen500    { return UIColorFromRGB(0x8BC34A); }
+ (UIColor *)paperColorLightGreen600    { return UIColorFromRGB(0x7CB342); }
+ (UIColor *)paperColorLightGreen700    { return UIColorFromRGB(0x689F38); }
+ (UIColor *)paperColorLightGreen800    { return UIColorFromRGB(0x558B2F); }
+ (UIColor *)paperColorLightGreen900    { return UIColorFromRGB(0x33691E); }
+ (UIColor *)paperColorLightGreenA100   { return UIColorFromRGB(0xCCFF90); }
+ (UIColor *)paperColorLightGreenA200   { return UIColorFromRGB(0xB2FF59); }
+ (UIColor *)paperColorLightGreenA400   { return UIColorFromRGB(0x76FF03); }
+ (UIColor *)paperColorLightGreenA700   { return UIColorFromRGB(0x64DD17); }
+ (UIColor *)paperColorLightGreen       { return [UIColor paperColorLightGreen500]; }


#pragma mark - Lime
+ (UIColor *)paperColorLime50   { return UIColorFromRGB(0xF9FBE7); }
+ (UIColor *)paperColorLime100  { return UIColorFromRGB(0xF0F4C3); }
+ (UIColor *)paperColorLime200  { return UIColorFromRGB(0xE6EE9C); }
+ (UIColor *)paperColorLime300  { return UIColorFromRGB(0xDCE775); }
+ (UIColor *)paperColorLime400  { return UIColorFromRGB(0xD4E157); }
+ (UIColor *)paperColorLime500  { return UIColorFromRGB(0xCDDC39); }
+ (UIColor *)paperColorLime600  { return UIColorFromRGB(0xC0CA33); }
+ (UIColor *)paperColorLime700  { return UIColorFromRGB(0xAFB42B); }
+ (UIColor *)paperColorLime800  { return UIColorFromRGB(0x9E9D24); }
+ (UIColor *)paperColorLime900  { return UIColorFromRGB(0x827717); }
+ (UIColor *)paperColorLimeA100 { return UIColorFromRGB(0xF4FF81); }
+ (UIColor *)paperColorLimeA200 { return UIColorFromRGB(0xEEFF41); }
+ (UIColor *)paperColorLimeA400 { return UIColorFromRGB(0xC6FF00); }
+ (UIColor *)paperColorLimeA700 { return UIColorFromRGB(0xAEEA00); }
+ (UIColor *)paperColorLime     { return [UIColor paperColorLime500]; }


#pragma mark - Yellow
+ (UIColor *)paperColorYellow50     { return UIColorFromRGB(0xFFFDE7); }
+ (UIColor *)paperColorYellow100    { return UIColorFromRGB(0xFFF9C4); }
+ (UIColor *)paperColorYellow200    { return UIColorFromRGB(0xFFF59D); }
+ (UIColor *)paperColorYellow300    { return UIColorFromRGB(0xFFF176); }
+ (UIColor *)paperColorYellow400    { return UIColorFromRGB(0xFFEE58); }
+ (UIColor *)paperColorYellow500    { return UIColorFromRGB(0xFFEB3B); }
+ (UIColor *)paperColorYellow600    { return UIColorFromRGB(0xFDD835); }
+ (UIColor *)paperColorYellow700    { return UIColorFromRGB(0xFBC02D); }
+ (UIColor *)paperColorYellow800    { return UIColorFromRGB(0xF9A825); }
+ (UIColor *)paperColorYellow900    { return UIColorFromRGB(0xF57F17); }
+ (UIColor *)paperColorYellowA100   { return UIColorFromRGB(0xFFFF8D); }
+ (UIColor *)paperColorYellowA200   { return UIColorFromRGB(0xFFFF00); }
+ (UIColor *)paperColorYellowA400   { return UIColorFromRGB(0xFFEA00); }
+ (UIColor *)paperColorYellowA700   { return UIColorFromRGB(0xFFD600); }
+ (UIColor *)paperColorYellow       { return [UIColor paperColorYellow500]; }


#pragma mark - Amber
+ (UIColor *)paperColorAmber50      { return UIColorFromRGB(0xFFF8E1); }
+ (UIColor *)paperColorAmber100     { return UIColorFromRGB(0xFFECB3); }
+ (UIColor *)paperColorAmber200     { return UIColorFromRGB(0xFFE082); }
+ (UIColor *)paperColorAmber300     { return UIColorFromRGB(0xFFD54F); }
+ (UIColor *)paperColorAmber400     { return UIColorFromRGB(0xFFCA28); }
+ (UIColor *)paperColorAmber500     { return UIColorFromRGB(0xFFC107); }
+ (UIColor *)paperColorAmber600     { return UIColorFromRGB(0xFFB300); }
+ (UIColor *)paperColorAmber700     { return UIColorFromRGB(0xFFA000); }
+ (UIColor *)paperColorAmber800     { return UIColorFromRGB(0xFF8F00); }
+ (UIColor *)paperColorAmber900     { return UIColorFromRGB(0xFF6F00); }
+ (UIColor *)paperColorAmberA100    { return UIColorFromRGB(0xFFE57F); }
+ (UIColor *)paperColorAmberA200    { return UIColorFromRGB(0xFFD740); }
+ (UIColor *)paperColorAmberA400    { return UIColorFromRGB(0xFFC400); }
+ (UIColor *)paperColorAmberA700    { return UIColorFromRGB(0xFFAB00); }
+ (UIColor *)paperColorAmber        { return [UIColor paperColorAmber500]; }


#pragma mark - Orange
+ (UIColor *)paperColorOrange50     { return UIColorFromRGB(0xFFF3E0); }
+ (UIColor *)paperColorOrange100    { return UIColorFromRGB(0xFFE0B2); }
+ (UIColor *)paperColorOrange200    { return UIColorFromRGB(0xFFCC80); }
+ (UIColor *)paperColorOrange300    { return UIColorFromRGB(0xFFB74D); }
+ (UIColor *)paperColorOrange400    { return UIColorFromRGB(0xFFA726); }
+ (UIColor *)paperColorOrange500    { return UIColorFromRGB(0xFF9800); }
+ (UIColor *)paperColorOrange600    { return UIColorFromRGB(0xFB8C00); }
+ (UIColor *)paperColorOrange700    { return UIColorFromRGB(0xF57C00); }
+ (UIColor *)paperColorOrange800    { return UIColorFromRGB(0xEF6C00); }
+ (UIColor *)paperColorOrange900    { return UIColorFromRGB(0xE65100); }
+ (UIColor *)paperColorOrangeA100   { return UIColorFromRGB(0xFFD180); }
+ (UIColor *)paperColorOrangeA200   { return UIColorFromRGB(0xFFAB40); }
+ (UIColor *)paperColorOrangeA400   { return UIColorFromRGB(0xFF9100); }
+ (UIColor *)paperColorOrangeA700   { return UIColorFromRGB(0xFF6D00); }
+ (UIColor *)paperColorOrange       { return [UIColor paperColorOrange500]; }


#pragma mark - Deep Orange
+ (UIColor *)paperColorDeepOrange50     { return UIColorFromRGB(0xFBE9E7); }
+ (UIColor *)paperColorDeepOrange100    { return UIColorFromRGB(0xFFCCBC); }
+ (UIColor *)paperColorDeepOrange200    { return UIColorFromRGB(0xFFAB91); }
+ (UIColor *)paperColorDeepOrange300    { return UIColorFromRGB(0xFF8A65); }
+ (UIColor *)paperColorDeepOrange400    { return UIColorFromRGB(0xFF7043); }
+ (UIColor *)paperColorDeepOrange500    { return UIColorFromRGB(0xFF5722); }
+ (UIColor *)paperColorDeepOrange600    { return UIColorFromRGB(0xF4511E); }
+ (UIColor *)paperColorDeepOrange700    { return UIColorFromRGB(0xE64A19); }
+ (UIColor *)paperColorDeepOrange800    { return UIColorFromRGB(0xD84315); }
+ (UIColor *)paperColorDeepOrange900    { return UIColorFromRGB(0xBF360C); }
+ (UIColor *)paperColorDeepOrangeA100   { return UIColorFromRGB(0xFF9E80); }
+ (UIColor *)paperColorDeepOrangeA200   { return UIColorFromRGB(0xFF6E40); }
+ (UIColor *)paperColorDeepOrangeA400   { return UIColorFromRGB(0xFF3D00); }
+ (UIColor *)paperColorDeepOrangeA700   { return UIColorFromRGB(0xDD2C00); }
+ (UIColor *)paperColorDeepOrange       { return [UIColor paperColorDeepOrange500]; }


#pragma mark - Brown
+ (UIColor *)paperColorBrown50      { return UIColorFromRGB(0xEFEBE9); }
+ (UIColor *)paperColorBrown100     { return UIColorFromRGB(0xD7CCC8); }
+ (UIColor *)paperColorBrown200     { return UIColorFromRGB(0xBCAAA4); }
+ (UIColor *)paperColorBrown300     { return UIColorFromRGB(0xA1887F); }
+ (UIColor *)paperColorBrown400     { return UIColorFromRGB(0x8D6E63); }
+ (UIColor *)paperColorBrown500     { return UIColorFromRGB(0x795548); }
+ (UIColor *)paperColorBrown600     { return UIColorFromRGB(0x6D4C41); }
+ (UIColor *)paperColorBrown700     { return UIColorFromRGB(0x5D4037); }
+ (UIColor *)paperColorBrown800     { return UIColorFromRGB(0x4E342E); }
+ (UIColor *)paperColorBrown900     { return UIColorFromRGB(0x3E2723); }
+ (UIColor *)paperColorBrown        { return [UIColor paperColorBrown500]; }


#pragma mark - Gray
+ (UIColor *)paperColorGray50   { return UIColorFromRGB(0xFAFAFA); }
+ (UIColor *)paperColorGray100  { return UIColorFromRGB(0xF5F5F5); }
+ (UIColor *)paperColorGray200  { return UIColorFromRGB(0xEEEEEE); }
+ (UIColor *)paperColorGray300  { return UIColorFromRGB(0xE0E0E0); }
+ (UIColor *)paperColorGray400  { return UIColorFromRGB(0xBDBDBD); }
+ (UIColor *)paperColorGray500  { return UIColorFromRGB(0x9E9E9E); }
+ (UIColor *)paperColorGray600  { return UIColorFromRGB(0x757575); }
+ (UIColor *)paperColorGray700  { return UIColorFromRGB(0x616161); }
+ (UIColor *)paperColorGray800  { return UIColorFromRGB(0x424242); }
+ (UIColor *)paperColorGray900  { return UIColorFromRGB(0x212121); }
+ (UIColor *)paperColorGray     { return [UIColor paperColorGray500]; }


#pragma mark - Blue Gray
+ (UIColor *)paperColorBlueGray50   { return UIColorFromRGB(0xECEFF1); }
+ (UIColor *)paperColorBlueGray100  { return UIColorFromRGB(0xCFD8DC); }
+ (UIColor *)paperColorBlueGray200  { return UIColorFromRGB(0xB0BEC5); }
+ (UIColor *)paperColorBlueGray300  { return UIColorFromRGB(0x90A4AE); }
+ (UIColor *)paperColorBlueGray400  { return UIColorFromRGB(0x78909C); }
+ (UIColor *)paperColorBlueGray500  { return UIColorFromRGB(0x607D8B); }
+ (UIColor *)paperColorBlueGray600  { return UIColorFromRGB(0x546E7A); }
+ (UIColor *)paperColorBlueGray700  { return UIColorFromRGB(0x455A64); }
+ (UIColor *)paperColorBlueGray800  { return UIColorFromRGB(0x37474F); }
+ (UIColor *)paperColorBlueGray900  { return UIColorFromRGB(0x263238); }
+ (UIColor *)paperColorBlueGray     { return [UIColor paperColorBlueGray500]; }


#pragma mark - Utilities
// Private:
+ (CGFloat)brightnessOfColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000;
    return brightness;
}

// Public:
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

+ (BOOL)isColorDark:(UIColor *)color
{
    CGFloat brightness = [UIColor brightnessOfColor:color];
    if (brightness < 0.5f) {
        return YES;
    }
    return NO;
}

+ (BOOL)isColorLight:(UIColor *)color
{
    return ![UIColor isColorDark:color];
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

+ (CAGradientLayer *)gradientWithStartColor:(UIColor *)startColor
                                   endColor:(UIColor *)endColor
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    
    return gradient;
}

+ (NSString *)hexStringFromRGBColor:(UIColor *)color
{
    NSString *hexColor = nil;
    
    // This method only works for RGB colors.
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
        hexColor = [[[NSString alloc] initWithFormat:@"%02x%02x%02x", (int)red, (int)green, (int)blue] uppercaseString];
    }
    
    return hexColor;
}


@end
