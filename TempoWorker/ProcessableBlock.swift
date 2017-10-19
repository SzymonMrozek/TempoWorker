//
//  ProcessableBlock.swift
//  TempoWorker
//
//  Created by Szymon Mrozek on 28.09.2017.
//  Copyright © 2017 Szymon Mrozek. All rights reserved.
//

public struct ProcessableBlock {

    let samplingFrequency: Float // 44100Hz
    var samplesToProcess: [Float]
    let duration: Int // miliseconds

    public static var defaultBlockDuration = 45000 // 45 seconds

    public init(channelsBuffers: [[Float]], duration: Int, samplingFrequency: Float) {

        self.samplingFrequency = samplingFrequency
        var samplesBuffer: [Float] = []
        
        for channel in 0 ..< channelsBuffers.count {
            samplesBuffer += channelsBuffers[channel]
        }
        
        self.duration = duration

        guard duration >= ProcessableBlock.defaultBlockDuration else {
            self.samplesToProcess = samplesBuffer
            return
        }
        
        var samplesNeededInBlock = Int(Float(ProcessableBlock.defaultBlockDuration) * samplingFrequency / 1000.0)
        samplesNeededInBlock = Int(pow(2.0,floor(log2(Double(samplesNeededInBlock)))))
        self.samplesToProcess = Array(samplesBuffer[0 ..< samplesNeededInBlock])
        
        
    }


    public var bpm : Int {
        
        let samplesPointer = UnsafeMutablePointer<Float>.allocate(capacity: samplesToProcess.count)
        for i in 0 ..< samplesToProcess.count {
            samplesPointer[i] = samplesToProcess[i]
        }

        return Int(BPMCalculatorWrapper().calculate(samplesPointer, withNumberOfSamples: Int32(samplesToProcess.count), withSamplingFrequency: self.samplingFrequency))

    }
}
