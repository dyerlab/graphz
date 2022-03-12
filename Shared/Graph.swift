//
//  Graph.swift
//  graphz
//
//  Created by Rodney Dyer on 3/11/22.
//

import Foundation
import SpriteKit

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    var root: SKNode
    
    
    init() {
        self.nodes = [Node]()
        self.edges = [Edge]()
        self.root = SKNode()
        self.root.position = CGPoint.zero
    }
    
    
    func addNode( node: Node) {
        self.root.addChild( node )
        self.nodes.append( node )
    }
    
    func addEdge( edge: Edge) {
        self.root.addChild( edge )
        self.edges.append( edge )
    }
    
}



extension Graph {
    
    static func DefaultGraph() -> Graph {
        let g = Graph()
        
        for i in 1 ... 7 {
            let node = Node(radius: 1,
                            location: CGPoint(x: CGFloat.random(in: 0 ... 500),
                                                         y: CGFloat.random(in: 0 ... 500) ),
                            color: .red,
                            name: String("Node - \(i)"))
            
            print("Node: \(node)")
            g.nodes.append(node)
        }
        
        g.edges.append( Edge(from: g.nodes[1], to: g.nodes[5] ) )
        g.edges.append( Edge(from: g.nodes[1], to: g.nodes[6] ) )
        g.edges.append( Edge(from: g.nodes[1], to: g.nodes[2] ) )
        g.edges.append( Edge(from: g.nodes[1], to: g.nodes[3] ) )
        g.edges.append( Edge(from: g.nodes[3], to: g.nodes[4] ) )
        g.edges.append( Edge(from: g.nodes[1], to: g.nodes[4] ) )
        g.edges.append( Edge(from: g.nodes[0], to: g.nodes[4] ) )
        
        
        return g
    }
}
