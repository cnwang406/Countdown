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
    "airplane","banana","bicycle","birthday","bookmark","camping","checklist","clock","coffee-beans",
    "coffee-maker","coffee","contacts","dribbble","edit","exam","food","hamper","home","hospital","idea",
    "key","money","mountain","music","outdoor-swimming","restaurant","running","speech-bubble",
    "street-food","tesla.red","tesla.white","toolbox","trash","school","bank","bar","cafe","car","celemony",
    "city-hall","dining","food-cart","fountain","gas-station","hotel-building","hotel-star","hotel",
    "merry-go-around","obelisk","pavilion","railway-station","roller-coaster","taxi","water-tower","wharf"
].sorted()
