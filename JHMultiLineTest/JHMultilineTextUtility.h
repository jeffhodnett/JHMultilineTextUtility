//
//  JHMultilineTextUtility.h
//  StellaPerfectPour
//
//  Created by Jeff Hodnett on 27/07/2011.
//  Copyright 2011 Applausible. All rights reserved.
//

#import "cocos2d.h"

typedef enum {
    JHLabelAlignmentCenter,
	JHLabelAlignmentLeft, 
	JHLabelAlignmentRight
} JHLabelAlignment;

@interface JHMultilineTextUtility : NSObject {
    
}

// Utility methods for formatting strings
+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile;
+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height;
+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height position:(CGPoint)position;
+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height position:(CGPoint)position textAlignment:(CGPoint)textAlignment;
+(CCNode *)multilineNodeWithText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(int)glyphHeight position:(CGPoint)position textAlignment:(CGPoint)textAlignment length:(int *)length;

@end
