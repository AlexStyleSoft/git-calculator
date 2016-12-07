//
//  ViewController.m
//  Calculator
//
//  Created by Хорошо on 07.12.16.
//  Copyright © 2016 GoodDay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) setCurrentInput:(double)cI{
   
    self.displayResultLabel.text = [[NSNumber numberWithDouble:cI] stringValue];
    stillTyping = NO;
}

-(double)currentInput{
    return [self.displayResultLabel.text doubleValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    stillTyping = NO;
    operationSign = @"";
    dotIsPlased = NO;
}

- (IBAction)numberPressed:(UIButton *)sender {
    
    NSInteger number = [self.displayResultLabel.text integerValue];
    
    if(stillTyping && number!=0)
    {
        if (self.displayResultLabel.text.length < 20)
            self.displayResultLabel.text =[NSString stringWithFormat:@"%@%@", self.displayResultLabel.text,sender.titleLabel.text];
    }
    else {
        self.displayResultLabel.text = sender.titleLabel.text;
        stillTyping = YES;
    }
}

- (IBAction)twoOperandsPressed:(UIButton *)sender {
    
    firstOperand = self.currentInput;
    stillTyping = NO;
    operationSign = sender.titleLabel.text;
    dotIsPlased = NO;
}

- (IBAction)equalityPressed:(UIButton *)sender {
    
    NSArray *items = @[@"+", @"-", @"✕",@"÷"];
    NSUInteger item = [items indexOfObject:operationSign];
    
    if (stillTyping)
        secondOperand = self.currentInput;
    
    dotIsPlased = NO;
    
    switch (item) {
        case 0:
            self.currentInput = firstOperand + secondOperand;
            break;
        case 1:
            self.currentInput = firstOperand - secondOperand;
            break;
        case 2:
            self.currentInput = firstOperand *secondOperand;
            break;
        case 3:
            self.currentInput = firstOperand / secondOperand;
            break;
            
        default:
            break;
    }
    stillTyping = NO;
}

- (IBAction)clearPressed:(UIButton *)sender {
    
    firstOperand = 0;
    secondOperand = 0;
    self.currentInput = 0;
    operationSign = @"";
    self.displayResultLabel.text =@"0";
    stillTyping = NO;
    dotIsPlased = NO;
}

- (IBAction)plusminusButtonPressed:(UIButton *)sender {
    self.currentInput = -self.currentInput;
}

- (IBAction)percentageButtonPressed:(UIButton *)sender {
    
    if (firstOperand == 0)
        self.currentInput = self.currentInput/100;
    else
        secondOperand = firstOperand * self.currentInput/100;
}

- (IBAction)squareRootButtonPressed:(UIButton *)sender {
    self.currentInput = sqrt(self.currentInput);
}

- (IBAction)dotButtonPressed:(UIButton *)sender {
    
    if (stillTyping && !dotIsPlased)
    {
        self.displayResultLabel.text = [NSString stringWithFormat:@"%@.",self.displayResultLabel.text];
        dotIsPlased = YES;
    }
    else
    {
        if (!stillTyping && !dotIsPlased)
            self.displayResultLabel.text = @"0.";
    }
    
    
}

@end
