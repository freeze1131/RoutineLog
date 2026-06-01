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
    
    // Entry Values
    @State private var entryValue: Double = 0
    @State private var entryNote: String = ""
    @State private var entryDate: Date = Date.now
    
    // Tracker Values
    @State private var label = ""
    @State private var unit = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            if trackers.isEmpty {
                Text("No routines yet")
                    .font(.headline)
                
                Text("Your routines for today will appear here.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Button("Add a routine") {
                isShowingAddTracker = true
            }
            .sheet(isPresented: $isShowingAddTracker) {
                NavigationStack {
                    Form {
                        Section() {
                            TextField("Label", text: $label)
                                .autocorrectionDisabled()
                            TextField("Unit", text: $unit)
                                .autocorrectionDisabled()
                        }
                        Section {
                            Button("Save") {
                                let tracker = TrackerModel(
                                    label: label,
                                    unit: unit
                                )
                                print(tracker.id)
                                modelContext.insert(tracker)
                                
                                label = ""
                                unit = ""
                                isShowingAddTracker = false
                            }
                        }
                    }
                    .navigationTitle("Add Tracker")
                }
            }
            
            ForEach(trackers) { tracker in
                HStack {
                    Text("\(tracker.label) - \(tracker.unit)")
                    
                    Button {
                        isShowingAddValue = true
                        print(tracker.id)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.green)
                    }
                    .sheet(isPresented: $isShowingAddValue) {
                        NavigationStack {
                            Form {
                                Section() {
                                    TextField("Value", value: $entryValue, format: .number)
                                        .autocorrectionDisabled()
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(.roundedBorder)
                                        .padding()
                                    TextField("Note", text:$entryNote)
                                        .autocorrectionDisabled()
                                }
                                Section() {
                                    Button("Save") {
                                        let trackerValue = TrackerEntryModel(id: tracker.id, trackerId: tracker.id, value: entryValue, createdAt: entryDate, note: entryNote)
                                        modelContext.insert(trackerValue)
                                        
                                        entryValue = 0
                                        entryNote = ""
                                        entryDate = Date()
                                        
                                        isShowingAddValue = false
                                    }
                                }
                            }
                        }
                    }
                    
                    Button {
                        showAlert = true
                        print(tracker.id)
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.red)
                    }
                    .alert("Delete Routine?", isPresented: $showAlert){
                        Button("Delete", role: .destructive) {
                            let relatedEntries = entries.filter { $0.trackerId == tracker.id }
                            
                            for entry in relatedEntries {
                                modelContext.delete(entry)
                            }
                            modelContext.delete(tracker)
                        }
                        Button("Close", role: .cancel) {}
                    } message: {
                        Text("This action cannot be undone.")
                    }
                }
            }
        }
        .padding()
        .background(.secondary.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
        .navigationTitle("Today")
    }
}


#Preview {
    DashboardView()
}
