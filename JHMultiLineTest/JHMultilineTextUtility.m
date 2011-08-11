//
//  JHMultilineTextUtility.m
//  StellaPerfectPour
//
//  Created by Jeff Hodnett on 27/07/2011.
//  Copyright 2011 Applausible. All rights reserved.
//

#import "JHMultilineTextUtility.h"

static const float kDefaultGlyphHeight = 22.0f;
static const CGPoint kDefaultPosition = {0.0f, 0.0f};	// Default Position
static const CGPoint kDefaultTextAlignment = {0.5f, 0.5f};	// Cenetered

@implementation JHMultilineTextUtility

+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile
{
	return [self multilineNodeWithText:text lineLength:lineLength fontFile:fontFile glyphHeight:kDefaultGlyphHeight position:kDefaultPosition textAlignment:kDefaultTextAlignment length:nil];
}

+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height
{
	return [self multilineNodeWithText:text lineLength:lineLength fontFile:fontFile glyphHeight:height position:kDefaultPosition textAlignment:kDefaultTextAlignment length:nil];
}

+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height position:(CGPoint)position 
{
	return [self multilineNodeWithText:text lineLength:lineLength fontFile:fontFile glyphHeight:height position:position textAlignment:kDefaultTextAlignment length:nil];
}

+(CCNode *)multilineNodeText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(float)height position:(CGPoint)position textAlignment:(CGPoint)textAlignment
{
	return [self multilineNodeWithText:text lineLength:lineLength fontFile:fontFile glyphHeight:height position:position textAlignment:textAlignment length:nil];
}

/*
 * adapted from http://www.cocos2d-iphone.org/forum/topic/207
 *
 * Returns a CCNode with the string. It splits on new lines and returns the length of the final node.
 * The length parameter is there to know the final length of the node (pass nil if you don't need it).
 * 
 * 
 * call it this way:
 *
 *   int length;
 *   CCNode *credits = [self multilineNodeWithText:creditsText length:&length];
 * 
 */
+(CCNode *)multilineNodeWithText:(NSString *)text lineLength:(int)lineLength fontFile:(NSString *)fontFile glyphHeight:(int)glyphHeight position:(CGPoint)position textAlignment:(CGPoint)textAlignment length:(int *)length
{
	NSInteger lineChars = 0;
	BOOL isSpace = NO, isNewLine = NO;
	NSInteger index = 0;
	NSInteger numLines = 0;
		
	float x = position.x;
	float y = position.y;
	
	NSMutableString *line = [NSMutableString stringWithCapacity:lineLength];
	
	CCNode *container = [CCNode node];
	while (index <= [text length]) {
		if (index == [text length]) {
			CCLabelBMFont *tip = [CCLabelBMFont labelWithString:[NSString stringWithString:line] fntFile:fontFile];
			tip.anchorPoint = textAlignment;
			tip.position = ccp(x, y - glyphHeight * numLines); 
			[container addChild:tip];
			
			// set length output parameter if needed
			if (length) {
				*length = glyphHeight * numLines;
			}
			return container;
		}
		
		NSString *tmp = [text substringWithRange:NSMakeRange(index, 1)];
		[line appendString:tmp];
		
		if ([tmp isEqual:@" "])
			isSpace = YES;
		else
			isSpace = NO;
		if ([tmp isEqual:@"\n"])
			isNewLine = YES;
		else
			isNewLine = NO;
		
		if ((lineChars >= lineLength && isSpace) || isNewLine) {
			CCLabelBMFont *tip = [CCLabelBMFont labelWithString:[NSString stringWithString:line] fntFile:fontFile];
			tip.anchorPoint = textAlignment;
			tip.position = ccp(x, y - glyphHeight * numLines);
			[container addChild:tip];
			lineChars = -1;
			[line setString:@""];
			numLines++;
		}
		lineChars++;
		index++;
	}
	// we should never reach this
	return nil;
}


@end
