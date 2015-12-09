//
//  ViewController.h
//  benchmarkingiOS
//
//  Created by computer on 2015-12-04.
//  Copyright (c) 2015 Chung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *buttonStart;
@property (strong, nonatomic) IBOutlet UIButton *buttonReset;
@property (strong, nonatomic) IBOutlet UILabel *labelTime;
@property (strong, nonatomic) IBOutlet UITextField *textfieldNumViews;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollviewViewContainer;


@end

