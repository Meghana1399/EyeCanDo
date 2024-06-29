//
//  ganglionDevice.swift
//  bci-gui
//
//  Created by Meghana on 10/16/23.
//

import Foundation

import Foundation

import EventSource


class ganglionDevice: StreamEEG{
    
    var eventSource: EventSource?
    var macAddr: String
    var localURL: String
    var Data : [[Double]]
    init(macAddr: String, localURL: String){
        self.macAddr = macAddr
        self.localURL = localURL
        self.eventSource = nil
        self.Data = [[0], [0], [0], [0]]
    }
    
    func startStream(){
        if (self.eventSource==nil){
            self.eventSource = EventSource(url: URL(string:
                                                        "\(K.webURL)/api/stream")!)
            self.eventSource?.onMessage({ [self] (event) in
                if let message = event?.data {
                    if let jsonDict = message.toDictionary(), let messageData = jsonDict["message"] as? [Double] {
                        
                        
                        for i in 0..<4 {
                            self.Data[i].append(messageData[i])
                            
                        }
                        print(messageData)
                        print(self.Data)
                        
                        // Update the chart with the new data
                        DispatchQueue.main.async {
                            //                                self.dataLabel.text = messageData.description
                            //                                self.updateChart()
                        }
                    }
                }
            })
        }
        
        let url = URL(string: "\(K.webURL)/api/startstream")!

        
        // Create a URL session configuration with default settings

        let config = URLSessionConfiguration.default

        
        // Create a URL session with the configuration
        let session = URLSession(configuration: config)
        
        // Create a data task with the API URL
        let task = session.dataTask(with: url) { data, response, error in
        // Check for errors
        guard error == nil else {
            print("Error calling API: \(error!)")
            return
        }

        // Check the response status code
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            print("API call succeeded with status code 200")
                        } else {
                            print("API call failed with status code \(httpResponse.statusCode)")
                        }
                    }
                }

                // Start the data task
                task.resume()
        
        
        
        
    }
    
    func stopStream(){
        let url = URL(string: "\(self.localURL)/api/stopstream")!

        // Create a URL session configuration with default settings
        let config = URLSessionConfiguration.default

        // Create a URL session with the configuration
        let session = URLSession(configuration: config)

        // Create a data task with the API URL
        let task = session.dataTask(with: url) { data, response, error in
            // Check for errors
            guard error == nil else {
                print("Error calling API: \(error!)")
                return
            }

            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("API call succeeded with status code 200")
                } else {
                    print("API call failed with status code \(httpResponse.statusCode)")
                }
            }
        }

        // Start the data task
        task.resume()
        
        
        
        
    }
}
