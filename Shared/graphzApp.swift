//
//  graphzApp.swift
//  Shared
//
//  Created by Rodney Dyer on 3/10/22.
//

import SwiftUI

@main
struct graphzApp: App {
    
    var graph: Graph = Graph.DefaultGraph()
    
    var body: some Scene {
        WindowGroup {
            ContentView(graph: graph )
        }
    }
}
