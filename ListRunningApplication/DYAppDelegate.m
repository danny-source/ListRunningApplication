//
//  DYAppDelegate.m
//  ListRunningApplication
//  http://cms.35g.tw/coding
//  Created by danny on 2014/5/15.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import "DYAppDelegate.h"

@implementation DYAppDelegate
{
    NSArray *runningApplicationArray;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    self.workspace = [NSWorkspace sharedWorkspace];
    self.tableview.dataSource = self;
    [self.tableview reloadData];


}




- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;
{
    //row值當做目前要提供第幾筆資料
    NSRunningApplication *runningApplication;
    //第一欄
    if ([[tableColumn identifier] isEqualToString:@"Column_1"])
    {
        
        runningApplication = [runningApplicationArray objectAtIndex:row];
		//將icon資訊回報
        return [runningApplication icon];
        
    }
    //第二欄
    if ([[tableColumn identifier] isEqualToString:@"Column_2"])
    {
        
        runningApplication = [runningApplicationArray objectAtIndex:row];
		//回報程式名稱
        return [runningApplication localizedName];
        
    }
    //第三欄
    if ([[tableColumn identifier] isEqualToString:@"Column_3"])
    {
        
        runningApplication = [runningApplicationArray objectAtIndex:row];
		//回報程式處理程序ID(PID)
        return [[NSNumber alloc] initWithInteger:(NSInteger)[runningApplication processIdentifier]];
        
    }
    return Nil;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    runningApplicationArray = [self.workspace runningApplications];
    NSLog(@"%@",runningApplicationArray);
    return [runningApplicationArray count];
}
@end
