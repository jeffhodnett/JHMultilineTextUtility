//
//  GameConfig.h
//  JHMultiLineTest
//
//  Created by Jeff Hodnett on 28/07/2011.
//  Copyright Applausible 2011. All rights reserved.
//

#ifndef __GAME_CONFIG_H
#define __GAME_CONFIG_H

//
// Supported Autorotations:
//		None,
//		UIViewController,
//		CCDirector
//
#define kGameAutorotationNone 0
#define kGameAutorotationCCDirector 1
#define kGameAutorotationUIViewController 2

//
// Define here the type of autorotation that you want for your game
//
#define GAME_AUTOROTATION kGameAutorotationUIViewController


#endif // __GAME_CONFIG_H