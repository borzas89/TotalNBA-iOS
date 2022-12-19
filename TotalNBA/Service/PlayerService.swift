//
//  PlayerService.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import Foundation
import Combine

class PlayerService {
    @Published var playerStats: [PlayerStat] = []
    
    var playerstatSubscription: AnyCancellable?
    
    init() {
        getPlayerStats()
    }
    
    func getPlayerStats() {
        guard let url = URL(string: "https://totalnba.herokuapp.com/api/v2/player-stat/all-player-stat/") else { return }

        playerstatSubscription = NetworkingManager.download(url: url)
            .decode(type: [PlayerStat].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedStats) in
                self?.playerStats = returnedStats
                self?.playerstatSubscription?.cancel()
            })
    }
    
}
