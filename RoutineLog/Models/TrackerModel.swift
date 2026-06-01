//
//  TrackerModel.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import Foundation
import SwiftData

@Model
final class TrackerModel {
    var id: UUID
    var label: String
    var unit: String
    var isVisibleInChart: Bool
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        label: String,
        unit: String,
        isVisibleInChart: Bool = true,
        createdAt: Date = .now
    ) {
        self.id = id
        self.label = label
        self.unit = unit
        self.isVisibleInChart = isVisibleInChart
        self.createdAt = createdAt
    }
}
