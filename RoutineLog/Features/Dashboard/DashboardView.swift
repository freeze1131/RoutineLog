//
//  DashboardView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    
    // Queries and SwiftData releated vars
    @Environment(\.modelContext) private var modelContext
    @Query private var trackers: [TrackerModel]
    @Query private var entries: [TrackerEntryModel]
    
    // Sheets and Alert control vars
    @State private var showAlert = false
    @State private var isShowingAddTracker = false
    @State private var isShowingAddValue: Bool = false

    // Tracker Values
    @State private var label = ""
    @State private var unit = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: AppSpacing.medium) {
                if trackers.isEmpty {
                    EmptyStateView {
                        isShowingAddTracker = true
                    }
                } else {
                    TrackerGridView(trackers: trackers, entries: entries)
                }
            }
            .sheet(isPresented: $isShowingAddTracker) {
                AddTrackerSheetView(label: $label, unit: $unit) {
                    modelContext.insert(TrackerModel(label: label, unit: unit))
                    label = ""
                    unit = ""
                    isShowingAddTracker = false
                }
            }
            .padding()
            .navigationTitle("Today")
        }
        .padding()
        Spacer()
        if !(trackers.isEmpty) {
            Button("Add a routine") {
                isShowingAddTracker = true
            }
        }
    }
}


#Preview {
    DashboardView()
}
