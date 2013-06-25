//
//  ButtonMasher.h
//  ExerciseBike
//
//  Created by Dan Reed on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>

@interface ButtonMasher : NSObject{
    int heartRate;
}

- (void) maintainButtonMashingForBPM:(int)bpm;

- (void) pressKey;
- (void) releaseKey;

@end
