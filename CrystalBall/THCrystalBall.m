//
//  THCrystalBall.m
//  CrystalBall
//
//  Created by Dave on 9/24/14.
//  Copyright (c) 2014 RockITProject. All rights reserved.
//

#import "THCrystalBall.h"

@implementation THCrystalBall

- (NSArray *) predictions {
    if (_predictions == nil){
        _predictions = [[NSArray alloc] initWithObjects:@"It is Certain, Seb", @"It is Decidedly so, Seb", @"All signs say YES, Heather", @"The stars are not aligned, Chad", @"My reply is no, Shannon", @"It is doubtful, Greg", @"Better not tell you now, Wil", @"Concentrate and ask again, Nancy", @"Unable to answer now, Dave", nil];
    }
    return _predictions;
}

- (NSString*) randomPrediction {
    int random = arc4random_uniform((int) self.predictions.count);
    return [self.predictions objectAtIndex:random];
}


@end
