//
//  ViewController.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 21.01.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let favStoryBoard = UIStoryboard(name: "FavoriteStoryboard", bundle: nil)
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "IMDBViewController") as! IMDBViewController
        let vc2 = favStoryBoard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        vc1.title = "IMDB Film"
        vc2.title = "My Favorites"
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2], animated: false)
    }


}

