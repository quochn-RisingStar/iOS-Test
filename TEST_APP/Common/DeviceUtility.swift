//
//  DeviceUtility.swift
//  TEST_APP
//
//  Created by Nitrotech Asia on 23/7/24.
//

import Foundation

import UIKit

class DeviceUtility {
    
    static func isIpad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static func isIphone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
