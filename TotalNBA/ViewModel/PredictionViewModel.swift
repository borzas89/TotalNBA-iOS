//
//  PredictionViewModel.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 13..
//

import Foundation
import Combine

class PredictionViewModel : ObservableObject{
    @Published var predictions: [Prediction] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let predictionService = PredictionService()
    
    init() {
        addSubscribers()
    }
    
    func setDate(searchText: String){
        self.searchText = searchText
        self.predictionService.getPredictions(dateString: searchText)
    }
    
    func addSubscribers() {
        predictionService.$predictions
            .sink { [weak self] (returnedPredictions) in
                self?.predictions = returnedPredictions
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
}
