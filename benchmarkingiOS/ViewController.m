//
//  ViewController.m
//  benchmarkingiOS
//
//  Created by computer on 2015-12-04.
//  Copyright (c) 2015 Chung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.scrollviewViewContainer addGestureRecognizer:singleTap];
    
    UIView *contentView;
    self.scrollviewViewContainer.contentSize =contentView.frame.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Start button handler
- (IBAction)startTest:(id)sender {
    self.textfieldNumViews.resignFirstResponder;
    //[self resetTesting];
    [self startTesting];
}

// Reset button handler
- (IBAction)resetTest:(id)sender {
    [self resetTesting];
}

// Dismiss keyboard when empty space on the screen is touched
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.textfieldNumViews.resignFirstResponder;
}

// Dismis keyboard when the scrollview is touched
- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture{
    self.textfieldNumViews.resignFirstResponder;
}

// Start the test
-(void) startTesting{
    NSInteger numberOfViews = [self.textfieldNumViews.text intValue];
    NSDate *methodStart = [NSDate date];
    for (int i = 0; i < numberOfViews ; i++){
        // Create a label with height 12, width same as scrollview container
        UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 12*2*i, self.scrollviewViewContainer.bounds.size.width, 14)];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.scrollviewViewContainer addSubview:label];
    }
    NSDate *methodFinish = [NSDate date];
    // timeIntervalSinceDate returns value in seconds, we want milliseconds so multiply 1000.
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart] * 1000;
    NSString *intervalString = [@"Time: " stringByAppendingString:[[NSString stringWithFormat:@"%f", executionTime] stringByAppendingString: @" ms"]];
    self.labelTime.text=intervalString;
    // Resize the ScrollView to fit contents
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scrollviewViewContainer.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    contentRect.size.width = 200;
    self.scrollviewViewContainer.contentSize = contentRect.size;
}

// Reset test and remove all child views from scrollview-container
-(void) resetTesting{
    [[self.scrollviewViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.textfieldNumViews.text = @"";
}

@end