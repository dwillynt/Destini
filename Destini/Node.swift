//
//  Node.swift
//  Destini
//
//  Created by dwilliams on 10/24/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Node{
    var value: String
    var key: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(key: String, value: String){
        self.value = value
        self.key = key
    }
    
    func add(child: Node){
        children.append(child)
        child.parent = self
    }
    
    func copy(with zone: NSZone? = nil) -> Any{
        let copy = Node(key: key, value: value)
        return copy
    }
}

extension Node: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        var text = "\(key):\(value)"
        
        // 4
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}
