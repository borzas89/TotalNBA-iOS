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
    @Published var playerStats: [PlayerStat] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let predictionService = PredictionService()
    private let playerStatService = PlayerService()
    
    init() {
        addSubscribers()
    }
    
    func setDate(searchText: String){
        self.predictionService.getPredictions(dateString: searchText)
    }
    
    func addSubscribers() {
        predictionService.$predictions
            .sink { [weak self] (returnedPredictions) in
                self?.predictions = returnedPredictions
                self?.isLoading = false
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(playerStatService.$playerStats)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterPlayerStats)
            .sink { [weak self] returnedStats in
                self?.playerStats = returnedStats
            }.store(in: &cancellables)
    }
    
    private func filterPlayerStats(text: String, stats: [PlayerStat] ) -> [PlayerStat] {
            guard !text.isEmpty else {
                return stats
            }
            
            let lowercasedText = text.lowercased()
            return stats.filter { (stat) -> Bool in
                return stat.full_name.lowercased().contains(lowercasedText) ||
                stat.team.lowercased().contains(lowercasedText)
            }
    }
}
