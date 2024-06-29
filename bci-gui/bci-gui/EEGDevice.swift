//
//  StreamEEG.swift
//  bci-gui
//
//  Created by Meghana on 10/16/23.
//

import Foundation
import EventSource


class EEGDevice{
    
    var device : StreamEEG?

    
    
    init (device: String){
        switch device{
        case "Ganglion":
            self.device = ganglionDevice(macAddr: K.ganglionMACAddress,  localURL : K.webURL)
        case "Cyton":
            self.device = ganglionDevice(macAddr: K.ganglionMACAddress,  localURL : K.webURL)
        case "Crown":
            self.device = ganglionDevice(macAddr: K.ganglionMACAddress,  localURL : K.webURL)
        case "Muse2":
            self.device = ganglionDevice(macAddr: K.ganglionMACAddress,  localURL : K.webURL)
        case "MuseS":
            self.device = ganglionDevice(macAddr: K.ganglionMACAddress,  localURL : K.webURL)
        default:
            print("Please provide a valid device")
            self.device = nil
        }
    
        
    }
    
    func startStream(){
        
        self.device?.startStream()

    }
    
    func stopStream(){
        self.device?.stopStream()
    }
    

    

        
}

protocol StreamEEG {

  // blueprint of a property
//  var name: String { get }


  func startStream()
    
  func stopStream()
}
