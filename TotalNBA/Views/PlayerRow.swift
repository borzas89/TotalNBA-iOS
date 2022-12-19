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
        VStack{
            HStack{
                Text(playerStat.full_name)
                Text(playerStat.team)
            }
            HStack{
                Text("Points/game  ")
                Text("\(String(format: "%.1f", playerStat.points_per_game))")
            }
            HStack{
                Text("Rebounds/game  ")
                Text("\(String(format: "%.1f", playerStat.rebounds_per_game))")
            }
            HStack{
                Text("Assists/game  ")
                Text("\(String(format: "%.1f", playerStat.assists_per_game))")
            }
            HStack{
                Text("Steals/game  ")
                Text("\(String(format: "%.2f", playerStat.steals_per_game))")
            }
            Divider()
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
