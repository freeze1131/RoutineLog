//
//  HistoryView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
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
}

#Preview {
    HistoryView()
}
