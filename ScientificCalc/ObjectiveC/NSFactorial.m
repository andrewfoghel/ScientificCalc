//
//  NSFactorial.m
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

#import "NSFactorial.h"

@implementation NSNumber (FactorialExpression)

- (NSNumber *) factorial {
    double baseValue = [self doubleValue];
    double result = tgamma(baseValue+1);
    return [NSNumber numberWithDouble:result];
}

- (NSNumber *) sin {
    double baseValue = [self doubleValue];
    double result = sin(baseValue);
    return [NSNumber numberWithDouble:result];
}

- (NSNumber *) cos {
    double baseValue = [self doubleValue];
    double result = cos(baseValue);
    return [NSNumber numberWithDouble:result];
}

- (NSNumber *) tan {
    double baseValue = [self doubleValue];
    double result = tan(baseValue);
    return [NSNumber numberWithDouble:result];
}

- (NSNumber *) sec {
    double baseValue = [self doubleValue];
    double result = 1/cos(baseValue);
    return [NSNumber numberWithDouble:result];
}

@end
