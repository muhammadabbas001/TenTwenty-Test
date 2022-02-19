//
//  Constants.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

struct Constants {
    
    struct ServerConfig {
        
    }
    
    struct Validation {
        
        static let COUNTDOWN_PASSCODE_SECONDS = 300
        struct Login {
            static let PASSWORD_MIN = 8
            static let PASSWORD_MAX = 15
        }
        struct TextField {
            static let AMOUNT_MIN = 10
            static let AMOUNT_MAX = 9999999
            static let MIN_CONSUMER_LEN = 1
            static let MAX_CONSUMER_LEN = 30
            static let MeezanBANK_MIN_LENGHT = 6
            static let MeezanBANK_MAX_LENGHT = 24
        }
    }
    
    struct AppConfig {
        
    }
    
    struct ErrorCode {
        
        
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
    
        struct Button {
            
        }
        
        struct TextField {
            
        }
    }
    
    //QR Code
    struct QRCode_ID {
        
    }
    
    //Benificiery Type
    struct BENE_TYPE{
        
    }
    
    //Command IDs
    struct CommandId {
        
        
    }
    
    //Flow IDsx
    struct FID {
        
        
    }

    struct Message {
    
        
    }
    
    struct HTTPStatusCode {
        static let SUCCESS = 200
        static let NOT_FOUND = 404
        static let SERVICE_UNAVAILABLE = 503
        static let GATEWAY_TIMEOUT = 504
    }
    
    struct DEVICEFAMILY {
        
        static let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
        static let IS_IPHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
        
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 812.0
        static let IS_IPHONE_XSMAX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
    }
    
    struct BankInfo
    {
        static let bankNameArr: [String] = ["Al Baraka Bank", "Allied Bank", "APNA Microfinance", "Askari Bank", "Bank Al-Habib", "Bank Alfalah", "Bank of khyber", "Bank of Punjab", "Bankislami", "Burj Bank", "CitiBank", "Dubai Islamic", "Faysal Bank", "FINCA SimSim Wallet", "First Women Bank", "Habib Metro", "HBL KONNECT", "ICBC Pakistan", "JS Bank", "MCB", "MCB Islamic", "NBP", "Samba Bank", "Silk Bank", "Sindh Bank", "Soneri Bank", "Standard Chartered", "Summit Bank", "UBL", "Meezan"]
        static let bankIMDArr: [String] = ["627688", "589430", "581862", "603011", "627197", "627100", "627618", "623977", "639357", "604786", "508117", "428273", "601373", "502841", "628138", "627408", "221166", "621464", "603733", "589388", "507642", "958600", "606101", "627544", "505439", "786110", "627271", "604781", "588974", "627873"]
        static let bankCodeArr: [String] = ["AIIN", "ABPA", "APNA", "ASCM", "BAHL", "ALFH", "KHYB", "BPUN", "BKIP", "BURJ", "CITI", "DUIB", "FAYS", "FINC", "FWOM", "MPBL", "HABB", "ICBK", "JSBL", "MUCB", "MCIB", "NBPA", "SAMB", "SAUD", "SIND", "SONE", "SCBL", "SUMB", "UNIL", "MEZN"]
    }
    
}
