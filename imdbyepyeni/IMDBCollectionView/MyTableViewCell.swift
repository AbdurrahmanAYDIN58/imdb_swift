//
//  MyTableViewCell.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 24.01.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "MyTableViewCell"
    static func nib() -> UINib{
        
        return UINib(nibName: identifier, bundle: nil)
        
    }
    
}
