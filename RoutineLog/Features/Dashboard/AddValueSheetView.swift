//
//  AddValueSheetView.swift
//  RoutineLog
//
//  Created by Acoman on 5.06.2026.
//

import SwiftUI


struct AddValueSheetView: View {
    @Binding var value: Double
    @Binding var note: String
    
    let onSave: () -> Void
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Add value to routine")) {
                    TextField("Value", value: $value, format: .number)
                        .autocorrectionDisabled()
                    TextField("Note", text: $note)
                        .autocorrectionDisabled()
                }
                
                Button("Save and close", action: onSave)
            }
            .navigationTitle("Add a routine")
        }
    }
}

#Preview {
    AddValueSheetView(
        value: .constant(31),
        note: .constant("hours"),
        onSave: {}
    )
}
