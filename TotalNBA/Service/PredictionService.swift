//
//  PredictionService.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 13..
//

import Foundation
import Combine

class PredictionService {
    @Published var predictions: [Prediction] = []
    @Published var dateString: String = ""
    
    var predictionSubscription: AnyCancellable?
    
    var selectedDateStr: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Date())
    }
    
    init() {
        self.dateString = selectedDateStr
        getPredictions(dateString: selectedDateStr)
    }
    
    func getPredictions(dateString: String) {
        print("predDates: " + dateString)
        guard let url = URL(string: "https://totalnba.herokuapp.com/api/prediction/day/\(dateString)/") else { return }

        predictionSubscription = NetworkingManager.download(url: url)
            .decode(type: [Prediction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedPredictions) in
                self?.predictions = returnedPredictions
                self?.predictionSubscription?.cancel()
            })
    }
    
}
