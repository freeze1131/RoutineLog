//
//  AddTrackerSheetView.swift
//  RoutineLog
//
//  Created by Acoman on 2.06.2026.
//

import SwiftUI

struct AddTrackerSheetView: View {
    @Binding var label: String
    @Binding var unit: String
    
    let onSave: () -> Void
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Add a tracker")) {
                    TextField("Label", text: $label)
                        .autocorrectionDisabled()
                    TextField("Unit", text: $unit)
                        .autocorrectionDisabled()
                }
                
                Button("Save and close", action: onSave)
            }
            .navigationTitle("Add a routine")
        }
    }
}

#Preview {
    AddTrackerSheetView(
        label: .constant("Sleep"),
        unit: .constant("hours"),
        onSave: {}
    )
}
