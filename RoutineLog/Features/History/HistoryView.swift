//
//  HistoryView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query private var entries: [TrackerEntryModel]
    
    
    var body: some View {
        
        if entries.isEmpty {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text("No history yet")
                    .font(.headline)

                Text("Your history will appear here.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.secondary.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
            .navigationTitle("History")
        }
        
        ForEach (entries) { value in
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(value.note)
                Text("\(value.value)")
                Text("\(value.createdAt)")
            }
            .navigationTitle("History")
        }
        

    }
}

#Preview {
    HistoryView()
}
