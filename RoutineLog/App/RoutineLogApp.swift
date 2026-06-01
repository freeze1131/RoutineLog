//
//  RoutineLogApp.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI
import SwiftData

@main
struct RoutineLogApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        } .modelContainer(for: [
            TrackerModel.self,
            TrackerEntryModel.self
        ])
        
    }
}
