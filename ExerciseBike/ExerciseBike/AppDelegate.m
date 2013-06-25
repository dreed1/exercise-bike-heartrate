//
//  AppDelegate.m
//  ExerciseBike
//
//  Created by Dan Reed on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    buttonMasher = [[ButtonMasher alloc]init];
    bpm =0;
    portManager = [ORSSerialPortManager sharedSerialPortManager];
    NSLog(@"port manager is kickin");
    port = [[portManager availablePorts]objectAtIndex:0];
    NSLog(@"port: %@",port);
    [port setDelegate:self];
    [port open];
}

#pragma mark - serial port delegate methods

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data{
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    dataString = [dataString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    NSArray *lines = [dataString componentsSeparatedByString:@"\n"];
    for(NSString *aLine in lines){
        NSString *someLine = [aLine stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        if([someLine length]){
            char prefix = [someLine characterAtIndex:0];
            NSString *postFix = [someLine substringFromIndex:1];
            if(prefix == 'B' && bpm != [postFix intValue]){
                [buttonMasher maintainButtonMashingForBPM:[postFix intValue]];
                bpm = [postFix intValue];
            }
        }
    }
}

- (void)serialPortWasRemovedFromSystem:(ORSSerialPort *)serialPort{
    [port close];
}

@end
