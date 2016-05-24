BFPaperButton
=============
[![CocoaPods](https://img.shields.io/cocoapods/v/BFPaperButton.svg?style=flat)](https://github.com/bfeher/BFPaperButton)

> Note that this changelog was started very late, at roughly the time between version 2.0.17 and 2.0.18. Non consecutive jumps in changelog mean that there were incremental builds that weren't released as a pod, typically while solving a problem.



2.0.27.1
---------
+ Migrated to Cocoapods 1.0.


2.0.27
---------
+ Added LaunchScreen.xib to get fullscreen for iPhone 5 and up. (Lazy demo app doesn't scroll so iPhone 4 and down won't fit evertying on screen.)
+^ Modified BFPaperButton.m to check if tapCircles are nil first (credit goes to github user [Adam Szeptycki](https://github.com/adamszeptycki))


2.0.18
---------
+^ Fixed bug where loweredShadowOffset property wasn't being utilized and instead was ignored for a hardcoded default value.