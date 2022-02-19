//
//  MovieCollectionViewCell.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 18/02/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    @IBOutlet weak var gradView: UIView!
    @IBOutlet weak var bgImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Utility.setGradientBackground(uiView: gradView)
    }

    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

}
