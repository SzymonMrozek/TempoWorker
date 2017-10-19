//
//  BPMCalculatorWrapper.m
//  TempoWorker
//
//  Created by Szymon Mrozek on 16.10.2017.
//  Copyright © 2017 Szymon Mrozek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPMCalculatorWrapper.h"
#import "BPMCalculator.h"

@interface BPMCalculatorWrapper()

@end

@implementation BPMCalculatorWrapper : NSObject

- (instancetype)init {
    self = [super init];
    return self;
}

-(int) calculate:(float *)samples withNumberOfSamples:(int) numberOfSamples withSamplingFrequency:(float)samplingFrequency {
    return calculateBPM(samples, numberOfSamples, samplingFrequency);
}

@end


