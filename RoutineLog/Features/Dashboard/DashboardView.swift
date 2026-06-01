//
//  DashboardView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.medium) {
            Text("No routines yet")
                .font(.headline)

            Text("Your routines for today will appear here.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.secondary.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: AppConstants.medium))
        .navigationTitle("Today")
    }
}


#Preview {
    DashboardView()
}
