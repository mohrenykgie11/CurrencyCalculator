//
//  PickerView.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit

protocol PickerDelegate {
    func currencySelected(selectedCurrency: String, pageName: String)
}

class PickerView: UIViewController {

    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var currencyList = [Currency]()
    var pickerDelegate : PickerDelegate?
    var selectedCurrency : String?
    var pageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.reloadAllComponents()
    }
    
    @IBAction func onCancelButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func onOkButton(_ sender: UIButton) {
        guard selectedCurrency != nil else {
            print("Kindly select a currency")
            return
        }
        
        pickerDelegate?.currencySelected(selectedCurrency: selectedCurrency ?? "", pageName: pageName)
        self.dismiss(animated: false, completion: nil)
    }
    
}

extension PickerView : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currencyList.count > 0 {
            selectedCurrency = currencyList[row].symbol
            let flag = selectedCurrency?.dropLast()
            optionLabel.text = getFlag(from: "\(flag ?? "")") + "  " + currencyList[row].symbol
        }
    }
}

extension PickerView : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let flag = currencyList[row].symbol.dropLast()
        return getFlag(from: "\(flag)") + "  " + currencyList[row].symbol
    }
    
}
