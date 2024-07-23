//
//  NSObject.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import Foundation

extension NSObject {
    var className: String {
        String(describing: type(of: self))
    }

    class var className: String {
        String(describing: self)
    }
}

extension NSObject {
    func removeAllObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
