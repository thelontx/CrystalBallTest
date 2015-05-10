//
//  THCrystalBall.h
//  CrystalBall
//
//  Created by Dave on 9/24/14.
//  Copyright (c) 2014 RockITProject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THCrystalBall : NSObject {
    NSArray *_predictions; //manually declaring the instance variable returned; because of readonly property, instance variable is not automaically created
}

@property (strong, nonatomic, readonly) NSArray *predictions;

- (NSString*) randomPrediction;


@end
