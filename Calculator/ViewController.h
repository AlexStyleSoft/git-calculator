//
//  ViewController.h
//  Calculator
//
//  Created by Хорошо on 07.12.16.
//  Copyright © 2016 GoodDay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    double firstOperand;
    double secondOperand;
    BOOL stillTyping;
    NSString * operationSign;
    BOOL dotIsPlased;
}
@property (weak, nonatomic) IBOutlet UILabel *displayResultLabel;
@property (assign,nonatomic) double currentInput;

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)clearPressed:(UIButton *)sender;
- (IBAction)twoOperandsPressed:(UIButton *)sender;
- (IBAction)equalityPressed:(UIButton *)sender;
- (IBAction)plusminusButtonPressed:(UIButton *)sender;
- (IBAction)percentageButtonPressed:(UIButton *)sender;
- (IBAction)squareRootButtonPressed:(UIButton *)sender;
- (IBAction)dotButtonPressed:(UIButton *)sender;


@end

