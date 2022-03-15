//
//  ContentView.swift
//  Shared
//
//  Created by Rodney Dyer on 3/10/22.
//

import SwiftUI
import SpriteKit


struct ContentView: View {
    
    @Binding var graph: Graph

    var body: some View {
        GraphView(scene: GraphScene().DefaultScene() )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
