//
//  HelloWorldLayer.m
//  JHMultiLineTest
//
//  Created by Jeff Hodnett on 28/07/2011.
//  Copyright Applausible 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "JHMultilineTextUtility.h"

#define LongSentencesExample @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
#define LineBreaksExample @"Lorem ipsum dolor\nsit amet\nconsectetur adipisicing elit\nblah\nblah"
#define MixedExample @"ABC\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt\nDEF"

// Font constants
#define kLineLength 15
#define kFontFile @"bubble_20pt.fnt"
#define kGlyphHeight 22.0f

enum {
	kTagTextNode = 1001,
};

@interface HelloWorldLayer(Private)
-(void)menuToggleSelected:(id)sender;
@end

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
	
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
        // Add a title
        CCLabelBMFont *titleLabel = [CCLabelBMFont labelWithString:@"JHMultilineTextUtility" fntFile:kFontFile];
        titleLabel.position = ccp(size.width/2, size.height - 20.0f);
        [self addChild:titleLabel];
        CCLabelBMFont *subtitleLabel = [CCLabelBMFont labelWithString:@"by Jeff Hodnett" fntFile:kFontFile];
        subtitleLabel.position = ccp(size.width/2, size.height - 40.0f);
        [self addChild:subtitleLabel];
        
		// Add a menu for changing text input
		CCLabelBMFont *longSentenceLabel = [CCLabelBMFont labelWithString:@"LongSentencesExample" fntFile:kFontFile];
		CCMenuItemLabel *longSentenceItem = [CCMenuItemLabel itemWithLabel:longSentenceLabel];
		
		CCLabelBMFont *lineBreakLabel = [CCLabelBMFont labelWithString:@"LineBreaksExample" fntFile:kFontFile];
		CCMenuItemLabel *lineBreakItem = [CCMenuItemLabel itemWithLabel:lineBreakLabel];
		
		CCLabelBMFont *mixedLabel = [CCLabelBMFont labelWithString:@"MixedExample" fntFile:kFontFile];
		CCMenuItemLabel *mixedItem = [CCMenuItemLabel itemWithLabel:mixedLabel];

		// Create a toggle
		CCMenuItemToggle *menuToggle = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuToggleSelected:) items: longSentenceItem, lineBreakItem, mixedItem, nil];
		
		// Set default and create text item
		[menuToggle setSelectedIndex:0];
		[self menuToggleSelected:menuToggle];
		
		// Create the menu
		CCMenu *menu = [CCMenu menuWithItems:menuToggle, nil];
		menu.position = ccp(size.width/2, 80);
		[self addChild:menu z:2];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(void)menuToggleSelected:(id)sender
{
	// Find out what index was selected and show the corresponding text
	int selectedIndex = [(CCMenuItemToggle *)sender selectedIndex];
	
	NSString *text;
	NSArray *strings = [NSArray arrayWithObjects:LongSentencesExample, LineBreaksExample, MixedExample, nil];

	if(selectedIndex < [strings count]) {
		text = [strings objectAtIndex:selectedIndex];
	}
	else {
		text = @"Whooops something went wrong!";
	}
	
	// ask director the the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	// Remove any previous versions
	[self removeChildByTag:kTagTextNode cleanup:YES];
	
	// Add the message label
	CCNode *messageLabel = [JHMultilineTextUtility multilineNodeText:text lineLength:kLineLength fontFile:kFontFile glyphHeight:kGlyphHeight];
	messageLabel.position = ccp(size.width/2, size.height/2 + 80.0f);
	[self addChild:messageLabel z:1 tag:kTagTextNode];
}

@end
