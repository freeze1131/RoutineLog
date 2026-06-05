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
    @State private var showDeleteTrackerAlert = false
    @State private var isShowingAddTracker = false
    @State private var isShowingAddValue: Bool = false
    @State private var selectedTracker: TrackerModel?
    
    // Tracker Values
    @State private var label = ""
    @State private var unit = ""
    
    // Entry Values
    @State private var value: Double = 0
    @State private var note: String = ""
    
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
                            note: latestEntry?.note,
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
            .sheet(isPresented: $isShowingAddValue) {
                AddValueSheetView(value: $value, note: $note) {
                    if let selectedTracker {
                        modelContext.insert(
                            TrackerEntryModel(id: UUID(),
                                              trackerId: selectedTracker.id,
                                              value: value,
                                              createdAt: Date.now,
                                              note: note))
                        value = 0
                        note = ""
                        isShowingAddValue = false
                    }
                    
                }
            }
            .alert("Delete Tracker", isPresented: $showDeleteTrackerAlert) {
                Button("Delete", role: .destructive){
                    if let selectedTracker {
                        modelContext.delete(selectedTracker)
                    }
                }
                Button("Cancel", role: .cancel){}
            } message: {
                Text("This tracker is going to be destroyed and cannot be restrored. Are you sure?")
            }
            
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
        selectedTracker = tracker
        isShowingAddValue = true
    }
    
    private func deleteTracker(_ tracker: TrackerModel) {
        selectedTracker = tracker
        showDeleteTrackerAlert = true
    }
    
}


#Preview {
    DashboardView()
}
