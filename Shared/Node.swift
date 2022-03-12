//
//  Node.swift
//  graphz
//
//  Created by Rodney Dyer on 3/10/22.
//

import Foundation
import SpriteKit



class Node: SKShapeNode {
    
    var mouseIsDown = false
    var edges: [Edge] = []
    
    override var position: CGPoint {
        didSet {
            edges.forEach { edge in
                edge.redrawLine()
            }
        }
    }
    
    override init() {
        super.init()
    }
    
    convenience init(radius: CGFloat, location: CGPoint, color: NSColor, name: String) {
        self.init()
        self.init(circleOfRadius: radius)
        self.fillColor = color
        self.name = name
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius )
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        /*
        self.physicsBody?.linearDamping = 1.0
        self.physicsBody?.angularDamping = 1.0
         */
         
        self.zPosition = 1
        self.isUserInteractionEnabled = true
        self.position = location
        
        /*
        let repulsion = SKFieldNode.radialGravityField()
        repulsion.strength = -5/10000
        repulsion.region = SKRegion(radius: 2 * Float(radius))
        repulsion.falloff = 1
        self.addChild( repulsion )
         */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension Node {
    
    public override func mouseDown(with event: NSEvent) {
        mouseIsDown = true
        print("\(self.position) and \(event.location(in: self.parent!))")
        self.position = event.location(in: self.parent!)
    }
    
    public override func mouseDragged(with event: NSEvent) {
        if mouseIsDown {
            print("moved and down")
            print("\(self.position) and \(event.location(in: self.parent!))")
            self.position = event.location(in: self.parent! )
        }
    }
    
    
    public override func mouseUp(with event: NSEvent) {
        if mouseIsDown {
            mouseIsDown = false
            self.position = event.location(in: self.parent! )
        }
    }
}


extension Node {
    
    override var description: String {
        return String("\(self.name): \(self.position)")
    }
    
}
