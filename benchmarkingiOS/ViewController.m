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
    self.scrollviewViewContainer.contentSize =CGSizeMake(320, 700);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Start button handler
- (IBAction)startTest:(id)sender {
    //[self resetTest];
    [self startTest];
}

// Reset button handler
- (IBAction)resetTest:(id)sender {
    [self resetTest];
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
-(void) startTest{
    NSInteger numberOfViews = [self.textfieldNumViews.text intValue];
    UILabel *initial = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 300, 12)];
    initial.text = [NSString stringWithFormat:@"%d",numberOfViews];
    initial.backgroundColor = [UIColor redColor];
    [self.scrollviewViewContainer addSubview:initial];
    for (int i = 0; i < 0 ; i++){
        UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 300, 12)];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.backgroundColor = [UIColor redColor];
        [self.scrollviewViewContainer addSubview:label];
    }
    self.textfieldNumViews.resignFirstResponder;
}

// Reset test and remove all child views from scrollview-container
-(void) resetTest{
    [[self.scrollviewViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.textfieldNumViews.text = @"";
}

@end