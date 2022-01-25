//
//  MyCollectionViewCell.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 22.01.2022.
//

import UIKit
import SDWebImage

protocol MyCollectionViewCellDelegate: AnyObject {
    func refreshCell()
    func didFavTapped(_ id: Int)
}

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var voteLabel: UILabel!
    
    //MARK - Variables
    var isCouponFav = UserDefaults.standard.object(forKey: "isCouponFav")
    var idArray = [Int]()
    var id = 0
    weak var delegate: MyCollectionViewCellDelegate?
    static let identifier = "MyCollectionViewCell"
    static func nib() -> UINib{
        
        return UINib(nibName: identifier, bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
// MARK - Metods
    public func configure(with model : Results)
    {
        idArray = UserDefaults.standard.object(forKey: "isCouponFav") as? [Int] ?? []
        self.voteLabel.text = String(model.vote_average)
        self.imdbLabel.text = model.name
        self.id = model.id
        self.ImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original" + model.poster_path))
       
        setFavs(itemId: model.id)
        
        
    }
    
    private func setFavs(itemId: Int) {
        if idArray.contains(where: {$0 == itemId}) {
            let image = UIImage.init(systemName: "heart.fill")
            favButton.setImage(image, for: .normal)
        } else {
            let image = UIImage.init(systemName: "heart")
            favButton.setImage(image, for: .normal)
        }
    }
    
    //MARK - ActionButtons
    @IBAction func favButtonTapped(sender: UIButton) {
        delegate?.didFavTapped(id)
    }
}
