//
//  PlayerSearchView.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 14..
//

import SwiftUI

struct PlayerSearchView: View {
    @EnvironmentObject private var vm: PredictionViewModel
    @State var playerStat: [PlayerStat] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
             HStack(alignment: .center, spacing: 5.0) {
                 SearchBarView(searchText: $vm.searchText)
             }
             Spacer()
            List(){
                ForEach(vm.playerStats) { prediction in
                        PlayerRow(playerStat: prediction)
                            .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct PlayerSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSearchView()
    }
}
