//
//  ContentView.swift
//  SlotPicker
//
//  Created by Sanguo Joseph Ledoux on 9/20/25.
//

import SwiftUI



struct ContentView: View {
    let weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    var body: some View {
        
        NavigationStack{
            VStack {
                ForEach(weekDays, id: \.self) {
                    ToggleBox(label: $0)
                }

            }
            .navigationTitle("Slot Picker")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 28)
        }

    }
}

#Preview {
    ContentView()
}
