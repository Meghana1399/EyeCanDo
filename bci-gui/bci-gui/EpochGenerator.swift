//
//  EpochGenerator.swift
//  bci-gui
//
//  Created by Meghana on 10/15/23.
//

import Foundation

class EpochGenerator {
    
    fileprivate var interval: Double
    fileprivate var duration: Int
    fileprivate var _startTimes: [Double] = []
    
    init(epochDuration: Double, sensorID: Int) {
        self.interval = epochDuration / 2.0  // Half of the epoch duration
        self.duration = Int(epochDuration * SpellerConstants.SAMPLING_RATE)
        
        for _ in 0..<SpellerConstants.EEG_SENSOR_TOTAL {
            _startTimes.append(0.0)
        }
    }
    
    public func getEpoch(filteredData: [Double], sensorID: Int) -> Epoch? {
        if filteredData.count != duration {
            print("EpochGenerator: Error: Invalid filtered data size.")
            return nil
        }
        
        if (Date().timeIntervalSince1970 - interval >= _startTimes[sensorID]) {
            _startTimes[sensorID] = Date().timeIntervalSince1970
            
            return Epoch(sensor: sensorID, samples: filteredData)
        }
        
        print("EpochGenerator: Incoming epoch is still building.")
        return nil
    }
    func extractEpochs(from dataStream: DataStream, epochGenerator: EpochGenerator) -> [Epoch] {
        var epochs: [Epoch] = []
        var currentIndex = 0
        
        while currentIndex + epochGenerator.duration <= dataStream.samples.count {
            let epochSamples = Array(dataStream.samples[currentIndex..<currentIndex + epochGenerator.duration])
            if let epoch = epochGenerator.getEpoch(filteredData: epochSamples, sensorID: dataStream.sensor) {
                epochs.append(epoch)
            }
            currentIndex += epochGenerator.duration
        }
        
        return epochs
    }
    
    
    func calculateAverageAmplitude(epoch: Epoch) -> Double {
        return epoch.samples.reduce(0.0, +) / Double(epoch.samples.count)
    }
    
 
    func computeERP(epochs: [Epoch]) -> Epoch {
        var averagedSamples = Array(repeating: 0.0, count: epochs[0].samples.count)
        
        for epoch in epochs {
            for i in 0..<epoch.samples.count {
                averagedSamples[i] += epoch.samples[i]
            }
        }
        
        let numEpochs = Double(epochs.count)
        averagedSamples = averagedSamples.map { $0 / numEpochs }
        
        let erpEpoch = Epoch(sensor: epochs[0].sensor, samples: averagedSamples)
        
        return erpEpoch
    }
    
    

    
}
