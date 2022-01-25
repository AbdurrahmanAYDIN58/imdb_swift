//
//  FavoriteViewController.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 21.01.2022.
//

import UIKit

class FavoriteViewController: UIViewController {
    var isCouponFav = UserDefaults.standard.object(forKey: "isCouponFav")
    var idArray = [Int]()
    var resultsListViewModel: ResultsListViewModel!
    var page = 1
    var favArray = [Results]()
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata(page: page)
        view.backgroundColor = .systemBackground
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
       
        
        view.backgroundColor = .systemBackground
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 300)
        collectionView.collectionViewLayout = layout
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        getdata(page: page)
    }
    
    
    func idArrayRefresh()
    {
        
            self.idArray = UserDefaults.standard.object(forKey: "isCouponFav") as? [Int] ?? []

        
        print(idArray)
        
    }
    func favData(){
        favArray.removeAll()
        resultsListViewModel.results.forEach { result in
            if (UserDefaults.standard.object(forKey: "isCouponFav") as? [Int] ?? []).contains(where: {$0 == result.id}) {
                favArray.append(result)
                
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.collectionView.reloadData()
        }
        
    }
    func getdata(page : Int){
        let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=e112ed72df8da5c3b38e4e6579896bc6&page="+String(page))
        Service().downloadIMBD(url: url!) { [self] (response) in
            if let results = response{
            
                self.resultsListViewModel = ResultsListViewModel(results: results.results)
                self.favData()
                
                }
            }
        }
}
extension FavoriteViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let models = favArray
        let resultsViewModel = models[indexPath.row]
        let storyBoard = UIStoryboard(name: "InnerStoryboard", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "InnerViewController") as! InnerViewController
       vc.modalPresentationStyle = .custom
  
        vc.id = resultsViewModel.id
        vc.name = resultsViewModel.name
        vc.title = resultsViewModel.name
     
        vc.navigationItem.largeTitleDisplayMode = .always
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension FavoriteViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
            cell.configure(with: favArray[indexPath.row])
            cell.delegate = self
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


extension FavoriteViewController:UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}

extension FavoriteViewController: MyCollectionViewCellDelegate {
    func didFavTapped(_ id: Int) {
        let idArray = UserDefaults.standard.object(forKey: "isCouponFav") as? [Int] ?? []
        var tempArray = idArray
        if tempArray.contains(where: {$0 == id}) {
            if let index = tempArray.firstIndex(of: id) {
                tempArray.remove(at: index)
            }
    
        } else {
            
            tempArray.append(id)
        }
    
        UserDefaults.standard.set(tempArray, forKey: "isCouponFav")
        UserDefaults.standard.synchronize()
        collectionView.reloadData()
        favData()
    }
    
    func refreshCell() {
       favData()
        
    }
}
