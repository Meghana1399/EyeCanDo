//
//  EEGDta.swift
//  bci-gui
//
//  Created by Meghana on 10/24/23.
//
import Foundation

let processEEGData: () -> Void = {
    // Replace with the path to your EEG data file
    let filePath = "/Users/meghana/Documents/EEGDATA.txt"

    // Read the contents of the file
    if let eegDataString = try? String(contentsOfFile: filePath, encoding: .utf8) {
        // Split the data into lines
        let lines = eegDataString.components(separatedBy: "\n")

        // Initialize a 2D array for EEG data
        var eegData: [[Double]] = []

        // Iterate through each line and split it into values
        for line in lines {
            let values = line.components(separatedBy: "\t")
            let doubleValues = values.compactMap { Double($0) }
            eegData.append(doubleValues)
        }

        // Now, 'eegData' contains your EEG data as a 2D double array
        // Print the EEG data to the console
        for row in eegData {
            print(row)
        }
    } else {
        print("Failed to read the EEG data file.")
    }
}

// Execute the processEEGData closure
processEEGData()

