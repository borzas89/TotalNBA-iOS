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
    @State private var showLaunchView: Bool = true

    var body: some Scene {
        WindowGroup {
            ZStack{
                NavigationView{
                    ContentView()
                }
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
