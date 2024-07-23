//
//  AltFunction.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 23/7/24.
//


import UIKit

func getResponsiveWidth(designWidth: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let widthRatio = screenWidth / designWidth
    let responsiveWidth = designWidth * widthRatio
    return responsiveWidth
}

func getResponsiveHeight(designHeight: CGFloat) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let heightRatio = screenHeight / designHeight
    let responsiveHeight = designHeight * heightRatio
    return responsiveHeight
}

