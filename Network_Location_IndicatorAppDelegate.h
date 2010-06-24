//
//  Location_IndicatorAppDelegate.h
//  Location Indicator
//
//  Created by Christos Chryssochoidis on 22/06/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Location_IndicatorAppDelegate : NSObject <NSApplicationDelegate> {
//    NSWindow *window;
//	IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
}

//@property (assign) IBOutlet NSWindow *window;
@property (readonly) NSStatusItem* statusItem;
@end
