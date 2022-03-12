//
//  Edge.swift
//  graphz
//
//  Created by Rodney Dyer on 3/10/22.
//

import Foundation
import SpriteKit

class Edge: SKShapeNode {
    
    let node1: Node
    let node2: Node
    let spring: SKPhysicsJointSpring
    
    
    
    override init() {
        node1 = Node()
        node2 = Node()
        spring = SKPhysicsJointSpring()
        super.init()
    }
    
    
    init( from: Node, to: Node, frequency: CGFloat = 50, damping: CGFloat = 20) {
        
        
        self.node1 = from
        self.node2 = to
        
        
        self.spring = SKPhysicsJointSpring.joint(withBodyA: node1.physicsBody!,
                                                 bodyB: node2.physicsBody!,
                                                 anchorA: node1.position,
                                                 anchorB: node2.position)
        self.spring.frequency = frequency / 100
        self.spring.damping = damping * 100
        
        
        super.init()
        
        strokeColor = .white
        lineWidth = 2
        zPosition = 0
        self.redrawLine()
        
        node1.edges.append(self)
        node2.edges.append(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func redrawLine() {
        let path = CGMutablePath()
        path.move(to: node1.position )
        path.addLine(to: node2.position)
        //self.path = path
    }
    
    
}
