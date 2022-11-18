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
        HStack{
            Text(prediction.awayTeamName + " @ " + prediction.homeTeamName)
                       .font(.title)
                       .foregroundColor(.black)
                       .padding()
               }
               HStack{
                   VStack {
                       Text("\(prediction.predictedAwayScore, specifier: "%.2f")")
                           .font(.title)
                           .foregroundColor(.black)
                   }
                   
                   VStack {
                       Text("\(prediction.predictedTotal, specifier: "%.2f")")
                           .font(.subheadline)
                           .foregroundColor(.black)
                       Text("\(prediction.spread, specifier: "%.2f")")
                           .font(.subheadline)
                           .foregroundColor(.black)
                   }
                   VStack {
                       Image("AppIcon")
                           .imageScale(.small)
                           .foregroundColor(.black)
                       Text("\(prediction.predictedHomeScore, specifier: "%.2f")")
                           .font(.title)
                           .foregroundColor(.black)
                   }
               } .padding()

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
