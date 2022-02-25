//
//  Extension.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit
import Foundation
import Charts

extension UIViewController {
    //gradient color for views
    func gradientColor(layerView : UIView, color1: UIColor, color2: UIColor) {
        let backgroungView = layerView
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        backgroungView.layer.insertSublayer(gradient, at: 0)
    }
    
    //change navigation bar background color
    func navBackgroundColor() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        
        //change sign up button label to menu color
        navigationController?.navigationBar.tintColor = UIColor.menuColor
    }
    
    //remove navbar border line
    func removeNavBorderLine() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //underline a label
    func underlineLabel (label: UILabel, string: String) {
        label.attributedText = NSAttributedString(string: string, attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    //padding/radius at the top of view
    func addPaddingToView(paddingView: UIView) {
        paddingView.clipsToBounds = true
        paddingView.layer.cornerRadius = 30
        if #available(iOS 11.0, *) {
            paddingView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    //get country flag from country code
    func getFlag(from countryCode: String) -> String {
        return countryCode
            .unicodeScalars
            .map({ 127397 + $0.value })
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
    
    //Line chart settings
    func customizeChart(lineChart: LineChartView, dataPoints: [String], values: [Double]) {

        var dataEntries: [ChartDataEntry] =  []
        let formater = XAxisNameFormater()
        let xaxis:XAxis = XAxis()
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "")
        let chartData = LineChartData(dataSet: chartDataSet)
        
        chartDataSet.colors = [UIColor.black]
        chartDataSet.fillColor = UIColor.chartFillColor1
        chartDataSet.setColor(UIColor.clear)
        let gradColors = [UIColor.chartFillColor1.cgColor, UIColor.white.cgColor]
        let colorLocations:[CGFloat] = [0.0, 0.50]
        if let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradColors as CFArray, locations: colorLocations) {
            chartDataSet.fill = Fill(linearGradient: gradient, angle: 90.0)
        }
        chartDataSet.fillAlpha = 0.3
        chartDataSet.drawFilledEnabled = true
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.drawValuesEnabled = false
        chartDataSet.mode = .cubicBezier
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        chartDataSet.highlightColor = .systemRed
        
        lineChart.xAxis.labelPosition = .bottomInside
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        xaxis.valueFormatter = formater
        lineChart.data = chartData
        lineChart.xAxis.granularity = 1
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.legend.enabled = false
        lineChart.leftAxis.drawTopYLabelEntryEnabled = false
        lineChart.drawGridBackgroundEnabled = false
        lineChart.xAxis.drawLabelsEnabled = true
        lineChart.pinchZoomEnabled = true
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = .white
        lineChart.leftAxis.labelTextColor = .white
        lineChart.xAxis.axisLineColor = UIColor.clear
        lineChart.leftAxis.axisLineColor = UIColor.clear
        lineChart.xAxis.centerAxisLabelsEnabled = false
        lineChart.leftAxis.drawLabelsEnabled = false
        lineChart.leftAxis.drawGridLinesEnabled = false
        lineChart.rightAxis.drawGridLinesEnabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.drawLabelsEnabled = false
        lineChart.xAxis.axisMinimum = 0
        lineChart.leftAxis.axisMinimum = 0
        lineChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
    }
    
}

extension UIColor {
    static let menuColor = UIColor(red: 0.00, green: 0.85, blue: 0.59, alpha: 1.00)
    static let headerColor = UIColor(red: 0.00, green: 0.44, blue: 1.00, alpha: 1.00)
    static let chartViewColor1 = UIColor(red: 0.00, green: 0.38, blue: 0.87, alpha: 1.00)
    static let chartViewColor2 = UIColor(red: 0.00, green: 0.44, blue: 1.00, alpha: 1.00)
    static let chartFillColor1 = UIColor(red: 0.28, green: 0.62, blue: 1.00, alpha: 1.00)
    static let chartFillColor12 = UIColor(red: 0.00, green: 0.47, blue: 1.00, alpha: 1.00)
    static let borderColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1.00).cgColor
}

extension Double {
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }()
    var formattedNumber: String {
        return Double.numberFormatter.string(for: self) ?? ""
    }
}

//show actual date string value
@objc(XAxisNameFormater)
final class XAxisNameFormater: NSObject, IAxisValueFormatter {
    var dateList = ["01 Jun", "07 Jun", "15 Jun", "23 Jun", "30 Jun"]
    func stringForValue( _ value: Double, axis _: AxisBase?) -> String {
        return String(describing: dateList[Int(value)])
    }

}
