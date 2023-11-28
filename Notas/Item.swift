//
//  Item.swift
//  Notas
//
//  Created by Armando Rodríguez on 27/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
