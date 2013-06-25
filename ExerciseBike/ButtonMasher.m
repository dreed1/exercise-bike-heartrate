//
//  ButtonMasher.m
//  ExerciseBike
//
//  Created by Dan Reed on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ButtonMasher.h"

@implementation ButtonMasher

- (ButtonMasher *) init{
    self = [super init];
    if(self){
        heartRate = 0;
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pressKey) userInfo:nil repeats:YES];
    }
    return self;
}

- (void) maintainButtonMashingForBPM:(int)bpm{
    if(heartRate != bpm){
        heartRate = bpm;
    }
    
}

- (void) pressKey{
    CGEventRef e = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)6, true);
    CGEventPost(kCGSessionEventTap, e);
    CFRelease(e);
    
    float interval = 0;
    if(heartRate >=160){
        interval = 1.0f;
    }
    else if(heartRate >=140){
        interval = 0.8f;
    }
    else if(heartRate >=120){
        interval = 0.6f;
    }
    else if(heartRate >=100){
        interval = 0.4f;
    }
    else if(heartRate >=60){
        interval = 0.2f;
    }
    else{
        interval = 0.05f;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(releaseKey) userInfo:nil repeats:NO];
}

- (void) releaseKey{
    CGEventRef f = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)6, false);
    CGEventPost(kCGSessionEventTap, f);
    CFRelease(f);
}

@end
