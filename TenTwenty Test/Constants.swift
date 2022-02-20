//
//  Constants.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

struct Constants {
    
    struct UIScreen{
        static let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    }
    
    struct ServerConfig {
        
    }
    
    struct UI {
        
        struct Color {
            
            //Hex Color code: #61C3F2
            static let LIGHT_BLUE_COLOR = UIColor(red: (97/255.0), green: (195/255.0), blue: (242/255.0), alpha: 1.0)
            
            //Genres BG Colors
            
            //Hex Color code: #15D2BC
            static let LIGHT_GREEN_COLOR = UIColor(red: (21/255.0), green: (210/255.0), blue: (188/255.0), alpha: 1.0)
            //Hex Color code: #E26CA5
            static let LIGHT_PINK_COLOR = UIColor(red: (226/255.0), green: (108/255.0), blue: (165/255.0), alpha: 1.0)
            //Hex Color code: #564CA3
            static let LIGHT_PURPLE_COLOR = UIColor(red: (86/255.0), green: (76/255.0), blue: (163/255.0), alpha: 1.0)
            //Hex Color code: #15D2BC
            static let DARK_YELLOW_COLOR = UIColor(red: (205/255.0), green: (157/255.0), blue: (15/255.0), alpha: 1.0)
        }
    }
    
}
