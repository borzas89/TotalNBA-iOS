//
//  PlayerStat.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 10..
//

import Foundation

struct PlayerStat: Hashable, Codable, Identifiable {
    var id: Int
    var full_name: String
    var team: String
    var position: String
    var game_played: Int
    var points_per_game: Double
    var rebounds_per_game: Double
    var assists_per_game: Double
    var steals_per_game: Double
    var pics_id: String
}
