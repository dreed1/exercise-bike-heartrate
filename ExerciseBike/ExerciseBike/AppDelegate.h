//
//  AppDelegate.h
//  ExerciseBike
//
//  Created by Dan Reed on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ORSSerialPort.h"
#import "ORSSerialPortManager.h"
#import "ButtonMasher.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, ORSSerialPortDelegate>{
    ORSSerialPortManager *portManager;
    ORSSerialPort *port;
    
    ButtonMasher *buttonMasher;
    
    int bpm;
}

@property (assign) IBOutlet NSWindow *window;

@end
