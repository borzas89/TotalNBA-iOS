//
//  NetworkManager.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 10..
//

import Foundation

class NetworkManager: ObservableObject{
    @Published var dateString: String = "" {
         didSet {
             fetchData()
         }
     }
     @Published var predictions = [Prediction]()
    
    func fetchData() {
            let urlString = "https://totalnba.herokuapp.com/api/prediction/day/\(dateString)"
            if let url = URL(string: urlString){
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error == nil{
                    do{
                        let predictions = try JSONDecoder().decode([Prediction].self, from: data!)
                                DispatchQueue.main.async {
                                    self.predictions = predictions
                                    print(self.predictions)
                                }
                            } catch{
                                print(error)
                            }
                        
                    }
                }
                task.resume()
            }
        }
}
