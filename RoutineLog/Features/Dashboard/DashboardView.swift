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
                    ForEach(trackers, id: \.id) { tracker in
                        let latestEntry = latestEntry(for: tracker)

                        TrackerCardView(
                            trackerLabel: tracker.label,
                            trackerUnit: tracker.unit,
                            latestEntryValue: latestEntry?.value,
                            lastUpdated: latestEntry?.createdAt,
                            addValue: {
                                addValue(to: tracker)
                            },
                            deleteTracker: {
                                deleteTracker(tracker)
                            }
                        )
                    }
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
    
    private func latestEntry(for tracker: TrackerModel) -> TrackerEntryModel? {
        entries
            .filter { $0.trackerId == tracker.id }
            .sorted { $0.createdAt > $1.createdAt }
            .first
    }

    private func addValue(to tracker: TrackerModel) {
        
        
    }
    
    private func deleteTracker(_ tracker: TrackerModel) {
        
    }
    
}


#Preview {
    DashboardView()
}
