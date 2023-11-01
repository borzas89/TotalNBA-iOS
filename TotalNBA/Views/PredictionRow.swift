//
//  PredictionRow.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI

struct PredictionRow: View {
    var prediction: Prediction
    
    var body: some View {
        VStack {
            HStack{
                Text(prediction.awayTeamName + " @ " + prediction.homeTeamName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            HStack{
                VStack {
                    Image(prediction.awayTeamAlias.lowercased() )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("\(prediction.predictedAwayScore, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                }
                Spacer()
                VStack {
                    Text("\(prediction.predictedTotal, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text("\(prediction.spread, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Image( prediction.homeTeamAlias.lowercased())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("\(prediction.predictedHomeScore, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            Divider()
        }
    }
}

struct PredictionkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PredictionRow(prediction: predictions[0])
            PredictionRow(prediction: predictions[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
