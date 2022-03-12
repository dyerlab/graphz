//
//  GraphView.swift
//  graphz
//
//  Created by Rodney Dyer on 3/10/22.
//

import Foundation
import SpriteKit
import SwiftUI


struct GraphViewRepresentable: NSViewRepresentable {

    typealias NSViewType = SKView
    
    let scene: GraphScene
    
    let proxy: GeometryProxy
    
    func makeCoordinator() -> Coordinator {
        let coord = Coordinator()
        coord.scene = self.scene
        
        return coord
    }
    
    func makeNSView(context: Context) -> SKView {
        scene.size = proxy.size
        context.coordinator.scene = scene
        
        scene.physicsBody?.friction = 0.8
        
        let view = SKView()
    
        
        //let tracker = NSTrackingArea(rect: view.frame, options: [.mouseMoved, .activeAlways], owner: view, userInfo: nil)
        //view.addTrackingArea( tracker )
        
        view.presentScene( scene )
        view.showsFPS = true
        view.showsPhysics = true
        return view
    }
    
    func updateNSView(_ nsView: SKView, context: Context) {
        context.coordinator.resizeScene(proxy: proxy )
    }
    
    class Coordinator: NSObject {
        weak var scene: GraphScene?
        
        func resizeScene(proxy: GeometryProxy ) {
            scene?.size = proxy.size
        }
    }
    
}

