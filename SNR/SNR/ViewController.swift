//
//  ViewController.swift
//  SNR
//
//  Created by Meghana on 11/1/23.
//

import Foundation
import UIKit
import DropDown
class ViewController: UIViewController {
    var eegData: [[Double]] = []  // Use a 2D array to store the CSV data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    
    @IBOutlet weak var StreamData: UIButton!
    
    @IBAction func startStreamButtonTapped(_ sender: UIButton) {
        // Assuming csvFilePath is the path to your CSV file
        let csvFilePath = "/Users/meghana/Downloads/trainData.csv"
        
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
            //            print(eegData.prefix(5))
            
        } else {
            print("Failed to load CSV data.")
        }
        
        let flattenedEEGData = eegData.flatMap { $0 }


        let bandPassFilter = BandPassFilter()

        // Ensure that the calculate method returns an array of [Double]
        // If it returns Void (()), you'll get the mentioned error
        let filteredEEGData2 = bandPassFilter.calculate( flattenedEEGData, fps: 500)

        let snrCalculator = SNRCalculator()
        let snr = snrCalculator.calculateSNR(eegData: filteredEEGData2)
        print("SNR: \(snr)")

    }
}
