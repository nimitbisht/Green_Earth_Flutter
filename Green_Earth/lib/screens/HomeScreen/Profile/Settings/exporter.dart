// Export all Settings files from here (start)
export 'package:greenearth/screens/HomeScreen/Profile/Settings/about.dart';
export 'package:greenearth/screens/HomeScreen/Profile/Settings/account.dart';
export 'package:greenearth/screens/HomeScreen/Profile/Settings/appearance.dart';
export 'package:greenearth/screens/HomeScreen/Profile/Settings/feedback.dart';
export 'package:greenearth/screens/HomeScreen/Profile/Settings/settings.dart';
// Export all Settings files from here (end)

// Imported Files (start)
import 'dart:ui';
import 'package:flutter_zoom_drawer/config.dart';
// Imported Files (end)

// Global Variable for Profile Members (start)
final drawerController = ZoomDrawerController();
// Global Variable for Profile Members (start)


// Screen Size [Width & Height] (start)
var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;
// Screen Size [Width & Height] (end)