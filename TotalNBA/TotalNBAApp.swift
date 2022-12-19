//
//  TotalNBAApp.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI

@main
struct TotalNBAApp: App {
    @StateObject private var vm = PredictionViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .environmentObject(vm)
            }
        }
    }
}
