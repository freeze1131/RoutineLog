//
//  DashboardView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("No routines yet")
                .font(.headline)

            Text("Your routines for today will appear here.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
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
