//
//  MixCalc.m
//  MixLang2
//
//  Created by 한현민 on 2023/07/13.
//

#import <Foundation/Foundation.h>
#import "MixCalc.h"

// private으로 쓸 메서드를 명시
@interface MixCalc()

- (int)plus:(int)number1 with: (int)number2;

- (int)subtract:(int)number1 with: (int)number2;

- (int)multiply:(int)number1 with: (int)number2;

- (int)divide:(int)number1 with: (int)number2;

@end

// public, private으로 쓸 메서드 모두 소스 파일에서 구현
@implementation MixCalc

- (int)plus:(int)number1 with:(int)number2 {
    return number1 + number2;
}

- (int)subtract:(int)number1 with:(int)number2 {
    return number1 - number2;
}

- (int)multiply:(int)number1 with:(int)number2 {
    return number1 * number2;
}

- (int)divide:(int)number1 with:(int)number2 {
    if (number2 != 0) {
        return number1 / number2;
    }
    return -1;
}

- (NSString *)getResultWithMessage:(NSString *)opcode with:(int)number1 with:(int)number2 {
    switch ([opcode characterAtIndex:0]) {
        case '+':
            return [NSString stringWithFormat:@"%d", [self plus:number1 with:number2]];
            break;
        case '-':
            return [NSString stringWithFormat:@"%d", [self subtract:number1 with:number2]];
            break;
        case '*':
            return [NSString stringWithFormat:@"%d", [self multiply:number1 with:number2]];
            break;
        case '/':
            if (number2 != 0) {
                return [NSString stringWithFormat:@"%d", [self divide:number1 with:number2]];
            }
        default:
            return @"Invalid operator or operand";
    }
}

@end


