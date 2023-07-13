//
//  MixCalc.h
//  MixLang2
//
//  Created by 한현민 on 2023/07/13.
//

#import <Foundation/Foundation.h>

@interface MixCalc : NSObject
    
// public으로 쓸 것만 써두고
- (NSString *)getResultWithMessage:(NSString *)opcode with:(int)number1 with:(int)number2;

@end
