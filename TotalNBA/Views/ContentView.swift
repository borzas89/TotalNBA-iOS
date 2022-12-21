//
//  ContentView.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI
import UIKit
import FSCalendar

struct ContentView: View {
    @State var selectedDate: Date = Date()
    @EnvironmentObject private var vm: PredictionViewModel
    @State var predictions: [Prediction] = []
    
    var body: some View {
            VStack{
                CalendarRepresentable(selectedDate: $selectedDate)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 6,
                                    x:0.0, y:0.0)
                    ).frame(maxHeight: 150)
                NavigationLink(destination: PlayerSearchView()
                    .environmentObject(vm)){
                 Text("Search")
                }
                List(){
                    ForEach(vm.predictions) { prediction in
                            PredictionRow(prediction: prediction)
                                .listRowSeparator(.hidden)
                        }
                }
                
            }
        
        
    }
}

struct CalendarRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    @Binding var selectedDate: Date
    var calendar = FSCalendar()
    @EnvironmentObject private var vm: PredictionViewModel
    var selectedDateStr: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: selectedDate)
    }
    
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.scope = .week
        return calendar
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource{
        var parent: CalendarRepresentable
        
        init(_ parent: CalendarRepresentable) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            return 1
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
            parent.vm.setDate(searchText: parent.selectedDateStr)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
