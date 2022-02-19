//
//  Utility.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

class Utility{
    static func setGradientBackground(uiView: UIView, colorTop: UIColor = .clear, colorBottom: UIColor = .black, startPoint: CGPoint = CGPoint(x: 1.0, y: 0.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = startPoint       //CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = endPoint           //CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: uiView.frame.size.width, height: uiView.frame.size.height)

        uiView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    static func designActBtn(uiButton: UIButton, borderColor: UIColor) -> UIButton{
        let uiButton = uiButton
        uiButton.layer.cornerRadius = 10
        uiButton.layer.borderColor = borderColor.cgColor
        uiButton.layer.borderWidth = 1
        return uiButton
    }
}
