//
//  TableViewCell.swift
//  RequestApiEarthQuake
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeStringLabel: UILabel!
    @IBOutlet weak var dateStringLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
@IBDesignable
class CustomLabel: UILabel {
    @IBInspectable
    private var cornerRadius: CGFloat = 0.0 {
        didSet {
            setLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    func setLayout() {
        if cornerRadius == -1 {
            layer.cornerRadius = frame.height*0.5
        } else {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
