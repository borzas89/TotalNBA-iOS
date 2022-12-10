//
//  PredictionList.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI
import FSCalendar

struct PredictionList: View {
    @State var predictions: [Prediction] = []
    @State var dateStr: String
    var body: some View {
            List(predictions) { prediction in
                PredictionRow(prediction: prediction)
                    .listRowSeparator(.hidden)
            }.onAppear{
                getPredictionData(url:
                                    "https://totalnba.herokuapp.com/api/prediction/day/\(self.dateStr)/") { predictions in
                    self.predictions = predictions
                }
            }
    }
}

struct PredictionList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            PredictionList(dateStr: "date")
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

func getPredictionData(url: String, completion: @escaping ([Prediction]) -> ()) {
    let session = URLSession(configuration: .default)
    session.dataTask(with: URL(string: url)!) { data, _, err in
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        // decoding JSON
        do {
            let predictions = try JSONDecoder().decode([Prediction].self, from: data!)
            
            // returning predictions
            completion(predictions)
        } catch {
            print(error)
        }
    }
    .resume()
}
