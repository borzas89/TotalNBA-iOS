//
//  PlayerImageViewModel.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import Foundation
import SwiftUI
import Combine

class PlayerImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let player: PlayerStat
    private let dataService: PlayerImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(player: PlayerStat){
        self.isLoading = true
        self.player = player
        self.dataService = PlayerImageService(player: player)
        
        dataService.$image
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
    
}
