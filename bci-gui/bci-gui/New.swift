//
//  New.swift
//  bci-gui
//
//  Created by Meghana on 10/17/23.
//

let eegDataString = """
1.234 2.345 3.456 ...  // Replace with your actual EEG data
4.567 5.678 6.789 ...
"""

var data: [[Double]] = []

let lines = eegDataString.components(separatedBy: "\n")
for line in lines {
    let values = line.components(separatedBy: " ")
    let doubleValues = values.compactMap { Double($0) }
    data.append(doubleValues)
}
