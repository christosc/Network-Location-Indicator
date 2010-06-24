//
//  Location_IndicatorAppDelegate.m
//  Location Indicator
//
//  Created by Christos Chryssochoidis on 22/06/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "Network_Location_IndicatorAppDelegate.h"

@implementation Network_Location_IndicatorAppDelegate

//@synthesize window;
@synthesize statusItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

//- (void) makeMenu {
//	SCPreferencesRef prefs = SCPreferencesCreate(NULL, (CFStringRef)@"Location Indicator", NULL);	
//	NSArray *locations = (NSArray *)SCNetworkSetCopyAll(prefs);
//	for (id item in locations) {
//		NSString *name = (NSString *)SCNetworkSetGetName((SCNetworkSetRef)item);
//		//NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:name action:@selector(switchLocation) keyEquivalent:@""];
//		//[menuItem setTarget:
//		[statusMenu addItemWithTitle:name action:NULL keyEquivalent:@""];
//	}
//}

void updateLocation(SCDynamicStoreRef	store, CFArrayRef changedKeys, void	*info) {
	NSLog(@"updateLocation is being run!");
	SCPreferencesRef prefs = SCPreferencesCreate(NULL, CFSTR("Network Location Indicator"), NULL);
	SCNetworkSetRef currLoc = SCNetworkSetCopyCurrent(prefs);
	NSLog(@"info is of class:%@", [(id)info class]);
	[[(id)info statusItem] setTitle:(NSString *)SCNetworkSetGetName(currLoc)];
	CFRelease(currLoc);
	CFRelease(prefs);

}
	

- (void)awakeFromNib {
//	[self makeMenu];
	
	SCDynamicStoreContext context = {0, self, NULL, NULL, NULL};
	SCDynamicStoreRef dynStore = SCDynamicStoreCreate(NULL, CFSTR("Network Location Indicator"), updateLocation, &context);  
	
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength: 37];
	[statusItem retain];
	[statusItem setHighlightMode:YES];
	
//	[statusItem setMenu:statusMenu];
	SCPreferencesRef prefs = SCPreferencesCreate(NULL, CFSTR("Network Location Indicator"), NULL);
	SCNetworkSetRef currLoc = SCNetworkSetCopyCurrent(prefs);
	[statusItem setTitle:(NSString *)SCNetworkSetGetName(currLoc)];
	[statusItem setToolTip:@"Current network location"];
	CFRelease(currLoc);
	CFRelease(prefs);
	
//	[self updateLocation];
	CFStringRef key[1] = {CFSTR("Setup:")};
	CFArrayRef keyArray = CFArrayCreate(NULL, (const void **)key, 1, &kCFTypeArrayCallBacks);
	SCDynamicStoreSetNotificationKeys(dynStore, keyArray, NULL);
	CFRelease(keyArray);
	CFRunLoopSourceRef storeRLSource = SCDynamicStoreCreateRunLoopSource(NULL, dynStore, 0);
	CFRunLoopAddSource(CFRunLoopGetCurrent(), storeRLSource, kCFRunLoopCommonModes);
	CFRelease(storeRLSource);
//	CFRelease(context);
	CFRelease(dynStore);
//	CFRelease(storeRLSource);
//	[statusItem setTitle:(NSString *)SCNetworkSetGetName(currLoc)];
	
}
@end
