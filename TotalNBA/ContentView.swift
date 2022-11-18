//
//  ContentView.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 11. 18..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Text("San Antonio Spurs @ Sacramento Kings")
                .font(.title)
                .foregroundColor(.green)
                .padding()
        }
        HStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.green)
                Text("123")
                    .font(.title)
                    .foregroundColor(.green)
            }
            
            VStack {
                Text("251")
                    .font(.title)
                    .foregroundColor(.red)
                Text("9")
                    .font(.title)
                    .foregroundColor(.red)
            }
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                Text("133")
                    .font(.title)
                    .foregroundColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
