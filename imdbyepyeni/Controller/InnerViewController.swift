


import UIKit
import SDWebImage

enum Gender: Int {
    case male = 2
    case female = 1
}

class InnerViewController: UIViewController {
    var detailsModel : DetailsModel!
    
    var id : Int = 85552
    var name : String = ""
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet var createdImageView: UIImageView!
    @IBOutlet weak var createdOverView: UILabel!
    @IBOutlet var createdGenderOverView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        getDetails(id: String(id))
        
        
       
       
       
       
        
    }
    
    func getDetails(id:String){
    let url2 = URL(string:"https://api.themoviedb.org/3/tv/\(id)?api_key=e112ed72df8da5c3b38e4e6579896bc6&language=en")
    Service().detailsIMBD(url: url2!) { (response) in
        if let details = response{
        
            self.detailsModel = DetailsModel(details: details)
            DispatchQueue.main.async {
                self.overView.text = self.detailsModel.details.overview ?? ""
                if self.detailsModel.adult == false
                {
                    self.view.backgroundColor = .white
                    
                }
                else{
                    self.view.backgroundColor = .red
                }
                let gen = self.detailsModel.details.created_by?.first?.gender
                let genType = Gender(rawValue: gen ?? 2)
                
                switch genType {
                case .male:
                    self.createdGenderOverView.text = "Male"
                case .female:
                    self.createdGenderOverView.text = "Female"
                default:
                    self.createdGenderOverView.text = "Male"
                }
                self.createdOverView.text = self.detailsModel.details.created_by?.first?.name
                
                }
            let kar = "https://image.tmdb.org/t/p/original\(String(self.detailsModel.created_by?.first?.profile_path ?? ""))"
            if kar != "" { print(kar)
            self.createdImageView.sd_setImage(with: URL(string: kar ))
            }
                
                
                
            
            self.ImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original" + self.detailsModel.backdrop_path ?? ""))
           
        }
        
    }
        
       
    }
    
}




