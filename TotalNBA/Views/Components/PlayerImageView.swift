//
//  PlayerImageView.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import SwiftUI

struct PlayerImageView: View {
    @StateObject var vm: PlayerImageViewModel
    
    init(player: PlayerStat) {
        _vm = StateObject(wrappedValue: PlayerImageViewModel(player: player))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerImageView(player: playerStats[0])
    }
}
