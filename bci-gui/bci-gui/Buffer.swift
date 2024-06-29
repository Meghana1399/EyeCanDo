


import Foundation



public class DataPacket {
    
    public var packetIndex:UInt16 = 0
    public var sensor:Int = 0 // 0 to 7: tp10 af8 tp9 af7 aux
    public var timestamp:Double = 0 // milliseconds since packet creation
    public var samples:[Double] = [] // 12 samples of EEG sensor data for Muse and 16 samples of EEG sensir data for Crown
    
    public init(packetIndex:UInt16, sensor:Int, timestamp:Double, samples:[Double]){
        self.packetIndex = packetIndex
        self.sensor = sensor
        self.timestamp = timestamp
        self.samples = samples
    }
}

public struct DataStream {
    public var sensor:Int // same as data packet
    public var samples:[Double] = [] // streaming samples of EEG sensor data
    public var timestamps:[Double] = [] //series of recent timestamps
}


public struct Epoch {
    public var sensor:Int // same as data stream
    public var samples:[Double] = [] // X amount of EEG samples in a specific window of time
}

class Buffer {
    
    fileprivate var _dataStream:DataStream // object which holds the samples and timestamps arrays
    fileprivate var _samplesMax:Int //max size of the samples array
    fileprivate var _timestampsMax:Int //max size of timestampls array
    
    init(sensor:Int) {
        
        //set the max for the samples and timestamps arrays
        self._samplesMax = SpellerConstants.EEG_FFT_BINS
        
        //number of timestamps is the length of the sample buffer (ex: 256)
        //divided by 12 samples per incoming packet (12)
        //and rounded down (floor())
        //for Muse
        _timestampsMax = Int(floor( Double(_samplesMax / 12) ))
        
        //put sensor ID into the data stream (only needs to be set once during initialization)
        _dataStream = DataStream(sensor: sensor)
        
    }
    
    //fileprivate var _buffer:DataBuffer = DataBuffer()
    public func add(packet:DataPacket) -> DataStream? {
        
        //MARK: Samples
        //copy the packet's samples into the sample stream
        _dataStream.samples += packet.samples
        
        //if this pushes the stream's sample array over the max
        if (_dataStream.samples.count > _samplesMax) {
            
            //remove the excess from the beginning of the array
            _dataStream.samples.removeFirst(_dataStream.samples.count-_samplesMax)
        }
        
        //MARK: Timestamps
        //add the time stamp of the first sensor in the packet to the data stream's timestamp array
        _dataStream.timestamps.append(packet.timestamp)
        
        //if the number of timestamps exceeds the max
        if (_dataStream.timestamps.count > _timestampsMax) {
            
            //remove the excess from the beginning of the array
            _dataStream.timestamps.removeFirst(_dataStream.timestamps.count-_timestampsMax)
        }
        
        //MARK: Delivery
        //if the stream is filled with _samplesMax packets (ex: 256 samples), then make it available
        if (_dataStream.samples.count == _samplesMax) {
            
            return _dataStream
        } else {
            
            print("EEG: Building buffer", _dataStream.samples.count, "/", _samplesMax)
            return nil //otherwise if it is still building, return nothing
        }
    }
}

