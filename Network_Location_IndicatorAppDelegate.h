//
//  Location_IndicatorAppDelegate.h
//  Location Indicator
//
//  Created by Christos Chryssochoidis on 22/06/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SystemConfiguration/SCNetworkConfiguration.h>
#import <SystemConfiguration/SCPreferences.h>
#import <SystemConfiguration/SCDynamicStore.h>

@interface Network_Location_IndicatorAppDelegate : NSObject <NSApplicationDelegate> {
//    NSWindow *window;
//	IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
}

//@property (assign) IBOutlet NSWindow *window;
@property (readonly) NSStatusItem* statusItem;
@end
