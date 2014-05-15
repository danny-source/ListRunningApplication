//
//  DYAppDelegate.h
//  ListRunningApplication
//
//  Created by danny on 2014/5/15.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DYAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSArrayController *arrayController;


@property (strong) NSWorkspace *workspace;

@property (strong) IBOutlet NSTableView *tableview;


@end
