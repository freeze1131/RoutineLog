//
//  EmptyStateView.swift
//  RoutineLog
//
//  Created by Acoman on 2.06.2026.
//

import SwiftUI

struct EmptyStateView: View {
    let onAddRoutine: () -> Void

    var body: some View {
        VStack(spacing: AppSpacing.small) {
            Text("No routines yet")
                .font(.headline)

            Text("Your routines for today will appear here.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button("Add a routine", action: onAddRoutine)
        }
    }
}

#Preview {
    EmptyStateView {}
}
