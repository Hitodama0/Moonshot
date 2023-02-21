//
//  ContentView.swift
//  Moonshot
//
//  Created by Biagio Ricci on 06/02/23.
//

import SwiftUI

struct ContentView: View {  
    @State private var showGrid = true
    var body: some View {
        NavigationView {
            Group{
                if showGrid {
                    GridLayout()
                        .transition(.slide)
                }
                else {
                    ListLayout()
                        .transition(.slide)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button {
                        showGrid.toggle()
                } label: {
                    if showGrid {
                        Image(systemName: "list.triangle")
                    }
                    else {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
