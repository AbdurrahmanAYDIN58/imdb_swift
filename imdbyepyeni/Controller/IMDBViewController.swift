//
//  IMDBViewController.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 21.01.2022.
//

import UIKit
import SDWebImage
class IMDBViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var resultsListViewModel : ResultsListViewModel!
    
    
    var pageNumber = 1
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
       
        
        view.backgroundColor = .systemBackground
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 300)
        collectionView.collectionViewLayout = layout
        
        
        
       
        }
    
    override func viewWillAppear(_ animated: Bool) {
        getdata(page: 1)
    }
    
    func appenddata(){
       
        getdata(page: self.pageNumber)
        
        
    }
    
    func getdata(page : Int){
        let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=e112ed72df8da5c3b38e4e6579896bc6&page="+String(page))
        Service().downloadIMBD(url: url!) { (response) in
            if let results = response{
            
                self.resultsListViewModel = ResultsListViewModel(results: results.results)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                }
               
            }
            
       
        }
   /* func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
    

    }*/
    }

 
extension IMDBViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resultsViewModel = self.resultsListViewModel.resultsAtIndex(indexPath.row)
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
extension IMDBViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let models = self.resultsListViewModel.results
        cell.configure(with: models[indexPath.row])
        cell.delegate = self
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultsListViewModel == nil ? 0 : self.resultsListViewModel.numberOfRowsInSection()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


extension IMDBViewController:UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}
extension IMDBViewController: MyCollectionViewCellDelegate {
    func refreshCell() {
        
    }
    
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
        
    }
    
    

    
}


