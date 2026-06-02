//
//  TrackerGridView.swift
//  RoutineLog
//
//  Created by Acoman on 2.06.2026.
//

import SwiftUI

struct TrackerGridView: View {
    let trackers: [TrackerModel]
    let entries: [TrackerEntryModel]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(trackers) { tracker in
                    let latestEntry = latestEntry(for: tracker)

                    TrackerCardView(
                        trackerLabel: tracker.label,
                        trackerUnit: tracker.unit,
                        latestEntryValue: latestEntry?.value,
                        lastUpdated: latestEntry?.createdAt
                    )
                }
            }
        }
    }

    private func latestEntry(for tracker: TrackerModel) -> TrackerEntryModel? {
        entries
            .filter { $0.trackerId == tracker.id }
            .sorted { $0.createdAt > $1.createdAt }
            .first
    }
}

