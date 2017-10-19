//
//  BPMCalculatorWrapper.h
//  TempoWorker
//
//  Created by Szymon Mrozek on 16.10.2017.
//  Copyright © 2017 Szymon Mrozek. All rights reserved.
//

#ifndef BPMCalculatorWrapper_h
#define BPMCalculatorWrapper_h

@interface BPMCalculatorWrapper : NSObject

-(instancetype)init;

-(int) calculate:(float *)samples withNumberOfSamples:(int)numberOfSamples withSamplingFrequency:(float) samplingFrequency;

@end

#endif /* BPMCalculatorWrapper_h */
