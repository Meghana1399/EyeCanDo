//
//  MainViewController.swift
//  SNR
//
//  Created by Meghana on 11/22/23.
//

import UIKit
import DropDown
import DGCharts

class MainViewController: UIViewController {
    let bandPassFilter=BandPassFilter()
    let dropDown = DropDown() //2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.cornerRadius = 8
        dropDown.textColor = .black
        dropDown.backgroundColor = .white
        dropDown.selectionBackgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        dropDown.cellHeight = 40
        dropDown.shadowColor = .gray
        dropDown.shadowOpacity = 0.8
        dropDown.shadowRadius = 6
        dropDown.animationduration = 0.25
        dropDown.width=200
    }
    
    @IBAction func menuBar(_ sender: UIButton) {
        dropDown.dataSource = ["Pie Chart", "FFT Plot", "Head Plot", "Display SNE"]//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.width=200//6
        dropDown.animationduration = 0.25
        dropDown.animationEntranceOptions = .transitionCrossDissolve
        sender.layer.cornerRadius = 8
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.lightGray.cgColor
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            self.dropDown.hide()
            switch item {
                        case "Pie Chart":
                self.clearChart()
                if let eegData = DataProcessor.importCSVData() {
                    let flattenedData = eegData.flatMap { $0 }
                    if let snr = DataProcessor.calculateSNR2(data: flattenedData) {
                        self.showPieChart(snr: snr)
                    } else {
                        print("Failed to calculate SNR.")
                    }
                } else {
                    print("Failed to load EEG data.")
                }
                
            case "FFT Plot":
                self.clearChart()
                self.showFFTPlot()
                
            case "Display SNE":
                self.clearChart()
                
            case "Head Plot":
                self.clearChart()
            default:
                break
            }

        }
    }
    func clearChart() {
         // Find and remove the existing chart view
         if let existingChartView = view.subviews.first(where: { $0 is PieChartView || $0 is LineChartView }) {
             existingChartView.removeFromSuperview()
         }
     }
   
}
