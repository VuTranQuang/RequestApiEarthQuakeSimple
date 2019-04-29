//
//  DataService.swift
//  RequestApiEarthQuake
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation
typealias JSON = Dictionary<AnyHashable, Any>

class DataService {
    static let shared: DataService = DataService()
    var quakeInfo: [EarthQuake] = []
    func requestApiEarthQuake(compledHander: @escaping(EarthQuake) -> Void) {
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson") else { return}
         let urlResquest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlResquest) { (data, reponse, err) in
            guard err == nil else {
                print(err?.localizedDescription, "Error")
                return
            }
            guard let aData = data else{ return}
            do {
                if let jsonQuake =  try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? JSON {
                    DispatchQueue.main.async {
                        compledHander(EarthQuake(dict: jsonQuake))
                    }
                }
                
            } catch {
                print(err?.localizedDescription, "Error")
            }
        }
        dataTask.resume()
        
    }
}
