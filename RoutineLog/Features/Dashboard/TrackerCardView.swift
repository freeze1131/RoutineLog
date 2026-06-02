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
    
    var body: some View {
        VStack(alignment: .leading,spacing: AppSpacing.small){
            HStack () {
                if let trackerLabel {
                    Text("Value name: \(trackerLabel)")
                        .multilineTextAlignment(.leading)
                } else {
                    Text("No value for label :(")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                if let trackerUnit {
                    Text("Unit: \(trackerUnit)")
                        .multilineTextAlignment(.trailing)
                } else {
                    Text("No value for unit :(")
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
            
            if let latestEntryValue {
                HStack {
                    Button {
                        // add tracker value to the card
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color(.green))
                    }
                    Button {
                        // delete tracker info
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(Color(.red))
                    }
                    Spacer()
                }
            } else {
                HStack {
                    Button {
                        // add tracker value to the card
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color(.green))
                    }
                    Button {
                        // delete tracker info
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(Color(.red))
                    }
                    Spacer()
                }
            }
            
        }
        .frame(width: 120, height: 100)
        .padding()
        .background(Color.brown.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: AppCornerRadius.medium))
        .padding(.horizontal)
        
    }
}

#Preview {
    TrackerCardView()
}
