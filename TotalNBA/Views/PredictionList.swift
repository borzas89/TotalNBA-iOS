//
//  PredictionList.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI
import FSCalendar

struct PredictionList: View {
    @EnvironmentObject private var vm: PredictionViewModel
    @State var predictions: [Prediction] = []
    
    var body: some View {
        List(){
            ForEach(vm.predictions) { prediction in
                PredictionRow(prediction: prediction)
            }
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
