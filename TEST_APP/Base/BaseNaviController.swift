//
//  BaseNaviController.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class BaseNaviController: UINavigationController {
    deinit {
        removeAllObserver()
        log(type: .info, className)
    }
}
