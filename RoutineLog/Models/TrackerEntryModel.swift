//
//  TrackerEntryModel.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import Foundation
import SwiftData

@Model
final class TrackerEntryModel {
    var id: UUID
    var trackerId: UUID
    var value: Double
    var note: String
    var createdAt: Date
    
    init(id: UUID, trackerId: UUID, value: Double, createdAt: Date, note: String) {
        self.id = id
        self.trackerId = trackerId
        self.value = value
        self.createdAt = createdAt
        self.note = note
    }
}
