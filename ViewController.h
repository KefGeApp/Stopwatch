//
//  ViewController.h
//  Stopwatch
//
//  Created by kefgeapp on 27.10.2012.
//  Copyright (c) 2012 kefgeapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *hr;
@property (nonatomic, weak) IBOutlet UILabel *min;
@property (nonatomic, weak) IBOutlet UILabel *sec;
@property (nonatomic, weak) IBOutlet UILabel *hun;

@property (nonatomic, weak) IBOutlet UIButton *btnStop;
@property (nonatomic, weak) IBOutlet UIButton *btnStart;
@property (nonatomic, weak) IBOutlet UIButton *btnReset;

@property (nonatomic, strong) NSTimer *timer;

- (IBAction)startTouched:(UIButton *)sender;
- (IBAction)stopTouched:(UIButton *)sender;
- (IBAction)resetTouched:(UIButton *)sender;

@end