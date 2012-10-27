//
//  ViewController.m
//  Stopwatch
//
//  Created by kefgeapp on 27.10.2012.
//  Copyright (c) 2012 kefgeapp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize hr, min, sec, hun, timer;
@synthesize btnStop, btnStart, btnReset;

- (IBAction)startTouched:(UIButton *)sender
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                  target:self
                                                selector:@selector(showTime)
                                                userInfo:nil
                                                 repeats:YES];
    
    [self buttonStatesWithStartState:NO stopState:YES resetState:NO];
}

- (IBAction)stopTouched:(UIButton *)sender
{
    [self.timer invalidate];
    self.timer = nil;
    
    [self buttonStatesWithStartState:YES stopState:NO resetState:YES];
}

- (IBAction)resetTouched:(UIButton *)sender
{
    self.hr.text = @"0";
    self.min.text = @"0";
    self.sec.text = @"0";
    self.hun.text = @"0";
    
    [self buttonStatesWithStartState:YES stopState:NO resetState:NO];
}

- (void)buttonStatesWithStartState:(BOOL)startState
                         stopState:(BOOL)stopState
                        resetState:(BOOL)resetState
{
    self.btnStart.enabled = startState;
    self.btnStop.enabled = stopState;
    self.btnReset.enabled = resetState;
    
    self.btnStart.alpha = self.btnStop.alpha = self.btnReset.alpha = .5;
    
    if (startState) self.btnStart.alpha = 1;
    if (stopState) self.btnStop.alpha = 1;
    if (resetState) self.btnReset.alpha = 1;
}

- (void)showTime
{
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    int hundredths = 0;
    NSArray *timeArray = [NSArray arrayWithObjects:self.hun.text, self.sec.text, self.min.text, self.hr.text, nil];
    
    for(int i=0;i<[timeArray count];i++)
        //(int i = [timeArray count] - 1; i >= 0; i–)
    {
        int timeComponent = [[timeArray objectAtIndex:i] intValue];
        switch (i) {
            case 3:
                hours = timeComponent;
                break;
            case 2:
                minutes = timeComponent;
                break;
            case 1:
                seconds = timeComponent;
                break;
            case 0:
                hundredths = timeComponent;
                hundredths++;
                break;
                
            default:
                break;
        }
    
    }
    if (hundredths == 100) {
        seconds++;
        hundredths = 0;
    }
    else if (seconds == 60) {
        minutes++;
        seconds = 0;
    }
    else if (minutes == 60) {
        hours++;
        minutes = 0;
    }
    self.hr.text = [NSString stringWithFormat:@"%.0d", hours];
    self.min.text = [NSString stringWithFormat:@"%.2d", minutes];
    self.sec.text = [NSString stringWithFormat:@"%.2d", seconds];
    self.hun.text = [NSString stringWithFormat:@"%.2d", hundredths];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
