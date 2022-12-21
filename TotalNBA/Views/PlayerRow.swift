//
//  PlayerRow.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import SwiftUI

struct PlayerRow: View {
    var playerStat: PlayerStat
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                PlayerImageView(player: playerStat)
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                Text(playerStat.full_name)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text(playerStat.team).bold()
            }
            
            HStack{
                Text("Points per game  ")
                Text("\(playerStat.points_per_game, specifier: "%.2f")")
            }
            
            HStack{
                Text("Rebounds:  ")
                Text("\(playerStat.rebounds_per_game, specifier: "%.2f")")
            }
            
            HStack{
                Text("Assists:  ")
                Text("\(playerStat.assists_per_game, specifier: "%.2f")")
            }
            
            HStack{
                Text("Steals: ")
                Text("\(playerStat.steals_per_game, specifier: "%.2f")")
            }
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerRow(playerStat: playerStats[0])
            PlayerRow(playerStat: playerStats[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
