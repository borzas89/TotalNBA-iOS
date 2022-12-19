//
//  PlayerSearchViewModel.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 14..
//

import Foundation
import Combine

class PlayerSearchViewModel : ObservableObject {
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var playerStats: [PlayerStat] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let playerStatService = PlayerService()
    
    init() {
        addSubscribers()
    }
    
    
    func addSubscribers() {
        playerStatService.$playerStats
            .sink { [weak self] (returnedStats) in
                self?.playerStats = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
}
