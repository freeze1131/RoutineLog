//
//  TrackerCardView.swift
//  RoutineLog
//
//  Created by Acoman on 2.06.2026.
//

import SwiftUI

struct TrackerCardView: View {
    
    
    var trackerLabel: String? = nil
    var trackerUnit: String? = nil
    
    var latestEntryValue: Double? = nil
    var lastUpdated: Date? = nil
    var note: String? = nil
    
    var addValue: () -> Void
    var deleteTracker: () -> Void
    
    var body: some View {
        VStack(alignment: .leading,spacing: AppSpacing.small){
            VStack (alignment: .leading) {
                if let trackerLabel {
                    Text("Value name: \(trackerLabel)")
                        .multilineTextAlignment(.leading)
                } else {
                    Text("No label")
                }
                if let trackerUnit {
                    Text("Unit: \(trackerUnit)")
                        .multilineTextAlignment(.trailing)
                } else {
                    Text("No entry value")
                }
                if let latestEntryValue {
                    Text("Last Value: \(latestEntryValue.oneDecimal)")
                }
                if let lastUpdated {
                    Text("Last Updated: \(lastUpdated.toSlashFormat)")
                }
                if let note {
                    Text("Note: \(note)")
                }
                
                HStack {
                    Button {
                        deleteTracker()
                    } label: {
                        Text("Delete")
                            .frame(width: 40)
                            .padding(EdgeInsets(top: AppInsets.medium, leading: AppInsets.large, bottom: AppInsets.medium, trailing: AppInsets.large))
                            .foregroundStyle(.black)
                            .font(.system(size: 12,weight: .semibold))
                            .background(Color.red.opacity(0.8))
                            .clipShape(.buttonBorder)
                    }
                    Button {
                        addValue()
                    } label: {
                        Text("Add")
                            .frame(width: 40)
                            .padding(EdgeInsets(top: AppInsets.medium, leading: AppInsets.large, bottom: AppInsets.medium, trailing: AppInsets.large))
                            .foregroundStyle(.black)
                            .font(.system(size: 12,weight: .semibold))
                            .background(Color.green)
                            .clipShape(.buttonBorder)
                    }
                    Spacer()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 12 ))
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.brown.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
        .padding(.horizontal)
        
    }
}

#Preview {
    TrackerCardView {} deleteTracker: {}
    
}
