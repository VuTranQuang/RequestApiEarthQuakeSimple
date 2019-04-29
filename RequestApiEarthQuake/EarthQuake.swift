//
//  EarthQuake.swift
//  RequestApiEarthQuake
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation


class EarthQuake  {
    var features: [Features] = []
    init(dict: JSON) {
        let featuresData = dict["features"] as? [JSON] ?? []
        for itemp in featuresData {
            features.append(Features(dict: itemp))
        }
    }
}
struct Features {
    var mag: Double?
    var place: String?
    var timeInterval: TimeInterval
    var timeString: String?
    var dateString: String?
    init(dict: JSON ) {
        let properties = dict["properties"] as? JSON ?? [:]
        mag = properties["mag"] as? Double
        place = properties["place"] as? String
        timeInterval = properties["time"] as! TimeInterval
        
        let dataForMatter = DateFormatter()
        dataForMatter.timeStyle = .short
        self.timeString = dataForMatter.string(from: Date(timeIntervalSince1970: timeInterval/1000 ))
        dataForMatter.timeStyle = .none
        dataForMatter.dateStyle = .long
        self.dateString = dataForMatter.string(from: Date(timeIntervalSince1970: timeInterval/1000))
    }
    
}
