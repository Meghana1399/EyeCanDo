//
//  PieChartDisplay.swift
//  SNR
//
//  Created by Meghana on 11/29/23.
//

import DGCharts
import UIKit

extension MainViewController {
    func showPieChart(snr: Double) {
        // Create a pie chart view
        let pieChartView = PieChartView()

        // Enlarge the size of the pie chart
        let enlargedSize = CGSize(width: 450, height: 450)
        pieChartView.frame = CGRect(origin: .zero, size: enlargedSize)

        // Center the pie chart within the view
        pieChartView.center = view.center

        // Create data entries for the pie chart
        let entries = [
            PieChartDataEntry(value: snr, label: "Signal"),
            PieChartDataEntry(value: 1 - snr, label: "Noise")
        ]

        let dataSet = PieChartDataSet(entries: entries, label: "")
        let data = PieChartData(dataSet: dataSet)

        // Customize the appearance of the pie chart
        dataSet.colors = [UIColor.purple, UIColor.systemOrange] // Adjusted colors for signal and noise
        dataSet.valueTextColor = UIColor.white // Adjusted color for legend text

        // Adjust the legend settings
        let legend = pieChartView.legend
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.xEntrySpace = 25 // Increase the space between legend entries
        legend.yEntrySpace = 5
        legend.yOffset = 10 // Increase the vertical offset of the legend
        legend.textColor = UIColor.black // Adjusted legend text color
        legend.font = UIFont.systemFont(ofSize: 21) // Set the font size for the legend

        // Assign the data to the chart view
        pieChartView.data = data

        // Add the chart view to your main view
        view.addSubview(pieChartView)
    }
}
