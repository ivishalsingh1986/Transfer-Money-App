//
//  UIUtils.swift
//
//  Created by Vishal Singh on 23/6/18.
//

import Foundation
import UIKit
import PKHUD

public class UIUtils {
    

    static func disableUI(){
        HUD.show(.progress)
    }
    
    static func enableUI(){
        
        HUD.dimsBackground = true
        HUD.allowsInteraction = false
        HUD.hide() {success in}
    }
    
//    static func checkInputIsNumeric(enteredInput:String) -> String {
//        
//        let numericSet = NSCharacterSet(charactersIn:"0123456789").inverted
//        let componentsSeperatedByCharInSet = enteredInput.components(separatedBy: numericSet)
//        let filteredString = componentsSeperatedByCharInSet.joined(separator: "")
//        return filteredString
//    }
}
