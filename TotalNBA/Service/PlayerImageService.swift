//
//  PlayerImageService.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import Foundation
import SwiftUI
import Combine

class PlayerImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let player: PlayerStat
    private let fileManager = LocalFileManager.instance
    private let folderName = "player_images"
    private let imageName: String
    
    init(player: PlayerStat) {
        self.player = player
        self.imageName = player.pics_id
        getPlayerImage()
    }
    
    private func getPlayerImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage(){
        print("Download image")
        guard let url =
                URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/\(player.pics_id).png") else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
    
}
