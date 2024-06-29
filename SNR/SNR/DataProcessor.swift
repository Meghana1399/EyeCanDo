//
//  DataProcessor.swift
//  SNR
//
//  Created by Meghana on 11/29/23.
//

import Foundation

class DataProcessor {
    private static let csvFilePath = "/Users/meghana/Downloads/trainData.csv"

    static func importCSVData() -> [[Double]]? {
        var eegData: [[Double]] = []  // Use a 2D array to store the CSV data

        // Read the content of the CSV file
        if let content = try? String(contentsOfFile: csvFilePath, encoding: .utf8) {
            // Split the content into lines
            let lines = content.components(separatedBy: "\n")
            
            // Process each line to extract values
            for (index, line) in lines.enumerated() {
                // Skip the first line (headers)
                if index == 0 {
                    continue
                }
                
                // Skip empty lines
                if line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    continue
                }
                
                // Split the line into values
                let values = line.components(separatedBy: ",").compactMap { Double($0) }
                
                // Append the values to the eegData array
                eegData.append(values)
            }
            
            // Check the loaded data (print the first 5 rows)
            print("\nSuccessfully loaded CSV data (first 5 rows):")
            print(eegData.prefix(5))
            
            return eegData
        } else {
            print("Failed to load CSV data.")
            return nil
        }
    }

    static func calculateSNR2(data: [Double]? = nil) -> Double? {
        if let data = data {
            let bandPassFilter = BandPassFilter()
            let filteredData = bandPassFilter.calculate(data, fps: 500)

            let snrCalculator = SNRCalculator()
            let snr = snrCalculator.calculateSNR(eegData: filteredData)
            print("SNR: \(snr)")

            return snr
        } else {
            // Handle the case when data is not provided
            print("No data provided to calculate SNR.")
            return nil
        }
    }

}
