//
//  CustomDatePicker.swift
//  SlotPicker
//
//  Created by Sanguo Joseph Ledoux on 9/20/25.
//

import SwiftUI
struct CustomDatePicker : View{
    var label : String
    @Binding var selectedDate : Date
        
    
    var body: some View{
        HStack(alignment: .center, spacing: 12) {
            Text(label)
                .foregroundStyle(.gray)
            Text(selectedDate.formatted(.dateTime.hour().minute()))
                .font(.system(size: 13, weight: .semibold))
                .padding(8)
                .foregroundColor(.black.opacity(0.7))
                .frame(minWidth: 85,)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black.opacity(0.2))
                )
        }
        .fixedSize(horizontal: true, vertical: false)
        .overlay {
            DatePicker(selection: $selectedDate, displayedComponents: .hourAndMinute) {}
                .labelsHidden()
                .contentShape(Rectangle())
                .frame(width: 150)
                .offset(x:20)
                .opacity(0.062)
        }
    }
}


