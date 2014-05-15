//
//  DYAppDelegate.m
//  ListRunningApplication
//
//  Created by danny on 2014/5/15.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import "DYAppDelegate.h"

@implementation DYAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    self.workspace = [NSWorkspace sharedWorkspace];
    self.tableview.dataSource = self;
    [self.tableview reloadData];


}



- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;
{
    if ([[tableColumn identifier] isEqualToString:@"Column_1"])
    {
        
        NSRunningApplication *runningApplication = [[self.workspace runningApplications] objectAtIndex:row];
        
        return [runningApplication icon];
        
    }
    if ([[tableColumn identifier] isEqualToString:@"Column_2"])
    {
        
        NSRunningApplication *runningApplication = [[self.workspace runningApplications] objectAtIndex:row];
        
        return [runningApplication localizedName];
        
    }
    if ([[tableColumn identifier] isEqualToString:@"Column_3"])
    {
        
        NSRunningApplication *runningApplication = [[self.workspace runningApplications] objectAtIndex:row];
        
        return [[NSNumber alloc] initWithInteger:(NSInteger)[runningApplication processIdentifier]];
        
    }
    return Nil;
}
//- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [[[NSWorkspace sharedWorkspace] runningApplications] count];
}
@end
