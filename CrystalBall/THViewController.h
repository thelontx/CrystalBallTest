//
//  THViewController.h
//  CrystalBall
//
//  Created by Dave on 9/17/14.
//  Copyright (c) 2014 RockITProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class THCrystalBall;  //forward declaration; not good practice to import a local class;  will import to the implementatin file; this technique allows it to be declared and recognized

@interface THViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
// @property (strong, nonatomic) NSArray *predictions;

@property (strong, nonatomic) THCrystalBall *crystalBall;

//extracredit to randomize labelColors
@property (strong, nonatomic) NSArray *labelColors;

- (IBAction)buttonPressed;

//declare method to keep from repeating predictions
- (void) makePrediction;

//connects background image to the viewcontroller
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
