//
//  PredictionList.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI
import FSCalendar

struct PredictionList: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var predictions: [Prediction] = []
    @Binding var selectedDate: Date
    var selectedDateStr: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: selectedDate)
    }
    

    var body: some View {
        Text(selectedDateStr)
        TextField(selectedDateStr, text: $networkManager.dateString)
        List(networkManager.predictions) { prediction in
                PredictionRow(prediction: prediction)
                    .listRowSeparator(.hidden)
            }.onAppear{
                self.networkManager.fetchData()
                
            }
    }
}

struct PredictionList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            PredictionList(selectedDate: .constant(Date()))
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
