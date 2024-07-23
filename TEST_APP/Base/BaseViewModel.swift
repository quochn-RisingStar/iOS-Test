//
//  BaseViewModel.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import Foundation

class BaseViewModel: NSObject {
    deinit {
        log(type: .info, className)
    }
}
