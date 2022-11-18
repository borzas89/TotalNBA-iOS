//
//  Prediction.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import Foundation
import SwiftUI
import CoreLocation

struct Prediction: Hashable, Codable, Identifiable {
    var id: Int
    var commonMatchId: String
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamAlias: String
    var awayTeamAlias: String
    var predictedAwayScore: Double
    var predictedHomeScore: Double
    var predictedTotal: Double
    var spread: Double
    var matchDate: String
    var matchString: String
}
