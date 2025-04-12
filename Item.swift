//
//  Item.swift
//  UrbanCareAI
//
//  Created by Sai spandana Boppudi on 3/30/25.
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
