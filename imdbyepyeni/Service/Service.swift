import Foundation
class Service {
    func downloadIMBD(url : URL, completion : @escaping(IMDB?)->()) {
        URLSession.shared.dataTask(with: url){(data, response,error) in
            if let error = error {
                print(error.localizedDescription)
               
                completion(nil)
                
            }
            else if let data = data {
                if data != nil {
                    let imdb = try? JSONDecoder().decode(IMDB.self, from: data)
                   // print(data)
                    
                   // let abi = imdb?.results
                  // print(abi)
                    completion(imdb)
                    
                }
                else{
                    print("hahaha")
                }
    
            }
    
}.resume()//başlatmaya yarıyor
    }
func detailsIMBD(url : URL, completion : @escaping(Details?)->()) {
        URLSession.shared.dataTask(with: url){(data, response,error) in
            if let error = error {
                print(error.localizedDescription)
               
                completion(nil)
                
            }
            else if let data = data {
                if data != nil {
                    let detail = try? JSONDecoder().decode(Details.self, from: data)
                   // print(data)
                    
                    //let abi = detail
                   //print(abi)
                    completion(detail)
                    
                }
                else{
                    print("hahaha")
                }
            }
            
            
        }.resume()//başlatmaya yarıyor
        
        
        
    }
    }

