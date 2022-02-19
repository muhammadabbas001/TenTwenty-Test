//
//  GenresCollectionViewCell.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.cornerRadius = 12
        layer.borderColor = UIColor.white.cgColor
//        backgroundColor = UIColor(red: 0.95, green: 0.69, blue: 0.17, alpha: 1.00)
        label.textColor = .white
    }
    
}
