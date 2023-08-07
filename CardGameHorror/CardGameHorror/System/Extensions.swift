//
//  Extensions.swift
//  CardGameHorror
//
//  Created by Eduardo on 14/07/23.
//

import Foundation
import SpriteKit

extension SKNode{
    // func to auto scale assets without distorting them
    func autoScale <T: SKSpriteNode>(_ node: T, widthProportion: Double, screenSize: CGSize) -> CGSize  {
            let proportion = node.size.width / node.size.height
            let width = screenSize.width
            let scale = CGSize(width: width * widthProportion, height: (width * widthProportion) / proportion )
            return scale
    }
}
