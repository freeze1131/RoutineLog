//
//  StatisticsView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("No statistics yet")
                .font(.headline)

            Text("Your statistics  will appear here.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.secondary.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
        .navigationTitle("Statistics")
    }
}

#Preview {
    StatisticsView()
}
