//
//  GraphView.swift
//  graphz
//
//  Created by Rodney Dyer on 3/10/22.
//

import SwiftUI

struct GraphView: View {
    let scene: GraphScene
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                GraphViewRepresentable(scene: scene, proxy: proxy)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

