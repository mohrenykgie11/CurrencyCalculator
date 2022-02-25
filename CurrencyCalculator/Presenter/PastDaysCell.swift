//
//  PastDaysCell.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit

class PastDaysCell: UICollectionViewCell {
    
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var selectedDot: UIView!
    
    let colorGreen = UIColor(red: 0.00, green: 0.85, blue: 0.60, alpha: 1.00)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //Change cell's selected color and toggle selected dot
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                selectedDot.isHidden = false
                selectedDot.backgroundColor = colorGreen
                daysLabel.textColor = UIColor.white
            } else {
                selectedDot.isHidden = true
                daysLabel.textColor = UIColor(red: 0.16, green: 0.48, blue: 0.86, alpha: 1.00)
            }
        }
    }
}
