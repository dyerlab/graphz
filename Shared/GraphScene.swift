//
//  GraphScene.swift
//  graphz
//
//  Created by Rodney Dyer on 3/10/22.
//

import Foundation
import SpriteKit
import SwiftUI


class GraphScene: SKScene, SKPhysicsContactDelegate {
    
    var graph: Graph?
    
    init(graph: Graph ) {
        
        super.init()
        
        addGraph(graph: graph)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented yet")
    }

    var edges: [Edge] {
        get {
            return graph?.edges ?? [Edge]()
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .darkGray
        self.size = view.frame.size
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
        self.physicsBody?.friction = 0.9
        self.isUserInteractionEnabled = true
    }
    
    func addEdge(edge: Edge) {
        self.physicsWorld.add( edge.spring )
        self.addChild( edge )
    }
    
    func addGraph( graph: Graph ) {
        self.graph = graph
        self.addChild( graph.root )
    }
    
    
}



extension GraphScene {
    
    private func updateEdges() {
        edges.forEach{ edge in
            edge.redrawLine()
        }
    }

    override func didFinishUpdate() {
        //let edges = self.edges
        //print("didFinishUpdate (\(edges.count))")
        
    }
    


}



extension GraphScene {
    
    func DefaultScene() -> GraphScene {
        let scene = GraphScene(graph: Graph.DefaultGraph() )
        return scene
    }
    
}
