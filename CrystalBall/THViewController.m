//
//  THViewController.m
//  CrystalBall
//
//  Created by Dave on 9/17/14.
//  Copyright (c) 2014 RockITProject. All rights reserved.
//

#import "THViewController.h"
#import "THCrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>

@interface THViewController ()

@end

@implementation THViewController {
    SystemSoundID soundEffect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //locating sound file
    //1st line is the path to soundfile;  starts with the mainBundle; provides directory path of file
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    //2nd line is the "URL" that corresponds to the path;  AudioServices can't just use a path, must use the equivalent of an URL for the file
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    //3rd line is C function; takes soundURL object and stores into soundEffect instance variable;  & is the reference to the pointer for the instance variable;  not actually returning a value; setting a value
    //just calling the soundURL created error because this is a C function;  the CFBridgingRetain helper function helps to convert the Objective-C object to the C Type so it can be used by the C function
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &soundEffect);
    
    
    //initialize predictions for the instance of viewcontroller
    //self.predictions = [[NSArray alloc] initWithObjects:@"It is Certain", @"It is Decidedly so", @"All signs say YES", @"The stars are not aligned", @"My reply is no", @"It is doubtful", @"Better not tell you now", @"Concentrate and ask again", @"Unable to answer now", nil];
    
    self.crystalBall = [[THCrystalBall alloc] init];
    self.backgroundImageView.animationImages = [[NSArray alloc] initWithObjects:
                                                [UIImage imageNamed:@"CB00001"],
                                                [UIImage imageNamed:@"CB00002"],
                                                [UIImage imageNamed:@"CB00003"],
                                                [UIImage imageNamed:@"CB00004"],
                                                [UIImage imageNamed:@"CB00005"],
                                                [UIImage imageNamed:@"CB00006"],
                                                [UIImage imageNamed:@"CB00007"],
                                                [UIImage imageNamed:@"CB00008"],
                                                [UIImage imageNamed:@"CB00009"],
                                                [UIImage imageNamed:@"CB00010"],
                                                [UIImage imageNamed:@"CB00011"],
                                                [UIImage imageNamed:@"CB00012"],
                                                [UIImage imageNamed:@"CB00013"],
                                                [UIImage imageNamed:@"CB00014"],
                                                [UIImage imageNamed:@"CB00015"],
                                                [UIImage imageNamed:@"CB00016"],
                                                [UIImage imageNamed:@"CB00017"],
                                                [UIImage imageNamed:@"CB00018"],
                                                [UIImage imageNamed:@"CB00019"],
                                                [UIImage imageNamed:@"CB00020"],
                                                [UIImage imageNamed:@"CB00021"],
                                                [UIImage imageNamed:@"CB00022"],
                                                [UIImage imageNamed:@"CB00023"],
                                                [UIImage imageNamed:@"CB00024"],
                                                [UIImage imageNamed:@"CB00025"],
                                                [UIImage imageNamed:@"CB00026"],
                                                [UIImage imageNamed:@"CB00027"],
                                                [UIImage imageNamed:@"CB00028"],
                                                [UIImage imageNamed:@"CB00029"],
                                                [UIImage imageNamed:@"CB00030"],
                                                [UIImage imageNamed:@"CB00031"],
                                                [UIImage imageNamed:@"CB00032"],
                                                [UIImage imageNamed:@"CB00033"],
                                                [UIImage imageNamed:@"CB00034"],
                                                [UIImage imageNamed:@"CB00035"],
                                                [UIImage imageNamed:@"CB00036"],
                                                [UIImage imageNamed:@"CB00037"],
                                                [UIImage imageNamed:@"CB00038"],
                                                [UIImage imageNamed:@"CB00039"],
                                                [UIImage imageNamed:@"CB00040"],
                                                [UIImage imageNamed:@"CB00041"],
                                                [UIImage imageNamed:@"CB00042"],
                                                [UIImage imageNamed:@"CB00043"],
                                                [UIImage imageNamed:@"CB00044"],
                                                [UIImage imageNamed:@"CB00045"],
                                                [UIImage imageNamed:@"CB00046"],
                                                [UIImage imageNamed:@"CB00047"],
                                                [UIImage imageNamed:@"CB00048"],
                                                [UIImage imageNamed:@"CB00049"],
                                                [UIImage imageNamed:@"CB00050"],
                                                [UIImage imageNamed:@"CB00051"],
                                                [UIImage imageNamed:@"CB00052"],
                                                [UIImage imageNamed:@"CB00053"],
                                                [UIImage imageNamed:@"CB00054"],
                                                [UIImage imageNamed:@"CB00055"],
                                                [UIImage imageNamed:@"CB00056"],
                                                [UIImage imageNamed:@"CB00057"],
                                                [UIImage imageNamed:@"CB00058"],
                                                [UIImage imageNamed:@"CB00059"],
                                                [UIImage imageNamed:@"CB00060"],nil];
    self.backgroundImageView.animationDuration = 2.5f;
    self.backgroundImageView.animationRepeatCount = 1;
    
    //extra credit to randomize labelColors
    self.labelColors = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor], nil];
    //code for programming background image
    //create variable for the image
    //UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    //create variable for ImageView
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:(backgroundImage)];
    //add subview to the View
    //[self.view addSubview:imageView];
    //[self.view insertSubview:imageView atIndex:0];
}

//example to show how to use frame to modify label
//- (void) viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    CGRect frame = self.predictionLabel.frame;  //store original value before overwriting
//    self.predictionLabel.frame = CGRectMake(50, 200, frame.size.width, frame.size.height);
//    //could use frame.origin.x instead of '50' to keep the original x value as well, just allowing y to vary
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - button events
- (IBAction)buttonPressed {
    //create local variable array to hold predictions; because is local, array is created and destroyed each time button is pressed
    //NSArray *predictions = [[NSArray alloc] initWithObjects:@"It is Certain", @"It is Decidedly so", @"All signs say YES", @"The stars are not aligned", @"My reply is no", @"It is doubtful", @"Better not tell you now", @"Concentrate and ask again", @"Unable to answer now", nil];
    
    //NSLog(@"Button Pressed");
    //self.predictionLabel.text = @"YES";  //text property of the predictionLabel property;  predictionLabel property of this instance of ViewController
    
    //int random = arc4random_uniform(self.predictions.count);
    int randomColor = arc4random_uniform((int) self.labelColors.count);

    [self makePrediction];
    
    //extra credit to randomize labelColors
    self.predictionLabel.textColor = [self.labelColors objectAtIndex:randomColor];
}
#pragma mark - prediction
- (void) makePrediction {
    [self.backgroundImageView startAnimating];
    self.predictionLabel.text = [self.crystalBall randomPrediction];
    
    //playing sound that is "declared" when view first loaded
    AudioServicesPlaySystemSound(soundEffect);
    
    [UIView animateWithDuration:6.0 animations:^{
        self.predictionLabel.alpha = 1.0f;
    }];
    
}


#pragma mark - motion events
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    //sets transparency to 0 at start; will do the animate to make visible within the Make prediction method that is called when event ends
    self.predictionLabel.alpha=0.0f;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake){
        //self.predictionLabel.text = [self.crystalBall randomPrediction];
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion cancelled");
}

#pragma mark - touch events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    //sets transparency to 0 at start; will do the animate to make visible within the Make prediction method that is called when event ends
    self.predictionLabel.alpha=0.0f;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //self.predictionLabel.text = [self.crystalBall randomPrediction];
    [self makePrediction];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches cancelled");
}

@end
