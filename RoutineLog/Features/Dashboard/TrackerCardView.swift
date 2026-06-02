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
    
    var addValue: () -> Void
    var deleteTracker: () -> Void
    
    var body: some View {
        VStack(alignment: .leading,spacing: AppSpacing.small){
            HStack () {
                if let trackerLabel {
                    Text("Value name: \(trackerLabel)")
                        .multilineTextAlignment(.leading)
                } else {
                    Text("ASHJDHASD")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                if let trackerUnit {
                    Text("Unit: \(trackerUnit)")
                        .multilineTextAlignment(.trailing)
                } else {
                    Text("asdasdsad")
                        .multilineTextAlignment(.trailing)
                }
            }
            
            HStack(alignment: .top){
                if let latestEntryValue {
                    Text("Last Value: \(latestEntryValue)")
                        .multilineTextAlignment(.leading)
                } else {
                    Text("No value for last value :(")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                if let lastUpdated {
                    Text("Last Updated: \(lastUpdated)")
                        .multilineTextAlignment(.trailing)
                } else {
                    Text("No value  for last updated:(")
                        .multilineTextAlignment(.trailing)
                }
            }
            
            HStack {
                Spacer()
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
            }
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12 ))
        }
        .frame(height: 100)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.brown.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
        .padding(.horizontal)
        
    }
}

#Preview {
    TrackerCardView {} deleteTracker: {}

}
