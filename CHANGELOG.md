BFPaperButton
=============
[![CocoaPods](https://img.shields.io/cocoapods/v/BFPaperButton.svg?style=flat)](https://github.com/bfeher/BFPaperButton)

> Note that this changelog was started very late, at roughly the time between version 2.0.17 and 2.0.18. Non consecutive jumps in changelog mean that there were incremental builds that weren't released as a pod, typically while solving a problem.


2.1.2
---------
* (^) Removed warnings about CAAnimationDelegate in Xcode 8 (thanks [Nicola](https://github.com/ndebei) and [h-umus](https://github.com/h-umus)). [Pull Request 9](https://github.com/bfeher/BFPaperButton/pull/31)  


2.1.1
---------
* (^) Fixed bug where '.enabled' property was not being taken into account during sizeToFit and layoutSubviews calls. [Issue 28](https://github.com/bfeher/BFPaperButton/issues/28)  


2.1.0
---------
* (+) Added IB_DESIGNABLE/IBInspectable attributes to properties courtesy of github user [Bhargav Mogra](https://github.com/bhargavms)  
* (^) Updated README to be more readable courtesy of github user [Bhargav Mogra](https://github.com/bhargavms)  
* (-) Removed BFPaperColor dependency courtesy of github user [Bhargav Mogra](https://github.com/bhargavms)  


2.0.29
---------
* (+) Migrated to Cocoapods 1.0.


2.0.27
---------
* (+) Added LaunchScreen.xib to get fullscreen for iPhone 5 and up. (Lazy demo app doesn't scroll so iPhone 4 and down won't fit everything on screen.)  
* (^) Modified BFPaperButton.m to check if tapCircles are nil first (credit goes to github user [Adam Szeptycki](https://github.com/adamszeptycki))


2.0.18
---------
* (^) Fixed bug where loweredShadowOffset property wasn't being utilized and instead was ignored for a hardcoded default value.
