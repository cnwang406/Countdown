//
//  DataModel.swift
//  Countdown
//
//  Created by cnwang on 2021/5/7.
//

import Foundation

struct IconData: Identifiable, Codable {
    var id = UUID()
    var name: String
}

var icons: [IconData] {
    var iconstmp = [IconData]()
    iconsname.forEach { name in
        let icon = IconData(name: name)
        iconstmp.append(icon)
    }
    return iconstmp
}


var iconsname: [String] = [
    "tesla.white", "tesla.red", "exam",
    "bookmark","clock"
    ,"contacts","edit","dribbble","edit","home","idea","key","music","speech-bubble"
]
