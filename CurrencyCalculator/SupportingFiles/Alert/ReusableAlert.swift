//
//  ReusableAlert.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit
import Foundation

class AlertView: NSObject {
    
    class func showAlert(view: UIViewController , title: String , message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
}
