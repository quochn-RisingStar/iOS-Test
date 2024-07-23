//
//  DetailProductViewModel.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import Foundation

extension DetailProductVC {
    final class DetailProductViewModel: BaseViewModel {
        var lisProductData: [Product] = [Product(name: "Fantastic Device",
                                                 images: [.imageTest, .imageEmpty, .imageTest, .imageMock3],
                                                 price: "$199.99",
                                                 desc: "A fantastic device that exceeds expectations.",
                                                 offers: ["15% off for the first 100 customers", "Extended warranty included"]),
                                         Product(name: "Amazing Widget",
                                                 images: [.imageMock, .imageEmpty, .imageMock, .imageMock, .imageMock4],
                                                 price: "$49.99",
                                                 desc: "An amazing widget for all your needs.",
                                                 offers: ["20% off", "Free shipping on orders over $50"]),
                                         Product( name: "Super Cool Gadget",
                                                  images: [.imageMock2, .imageEmpty, .imageTest, .imageMock3, .imageEmpty],
                                                  price: "$99.99",
                                                  desc: "This is a super cool gadget that you will love!",
                                                  offers: ["10% off for a limited time", "Buy one, get one free"])]
    }
}
