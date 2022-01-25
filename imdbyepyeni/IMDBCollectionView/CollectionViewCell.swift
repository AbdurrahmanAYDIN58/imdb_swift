//
//  CollectionViewCell.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 22.01.2022.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imdbLabel: UILabel!
    @IBOutlet  var voteLabel: UILabel!
    static let identifier = "cell"
 public func   configure(with models: [Models])
    
}
