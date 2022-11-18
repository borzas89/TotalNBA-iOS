//
//  PredictionList.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI

struct PredictionList: View {
    var body: some View {
        NavigationView {
            List(predictions) { prediction in
                PredictionRow(prediction: prediction)
            }
            .navigationTitle("Predictions")
        }
    }
}

struct PredictionList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            PredictionList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
