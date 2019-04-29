//
//  ViewController.swift
//  RequestApiEarthQuake
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dataQuake: [Features] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.shared.requestApiEarthQuake(compledHander: { (quake) in
            self.dataQuake = quake.features
            self.tableView.reloadData()
            self.tableView.rowHeight = 120
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataQuake.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.magLabel.text = "\(dataQuake[indexPath.row].mag ?? 0)"
        cell.placeLabel.text = dataQuake[indexPath.row].place
        cell.timeStringLabel.text = dataQuake[indexPath.row].timeString
        cell.dateStringLabel.text = dataQuake[indexPath.row].dateString
        
        return cell
    }

}

