//
//  DateRow.swift
//  SlotPicker
//
//  Created by Sanguo Joseph Ledoux on 9/20/25.
//

import SwiftUI

struct DateRow: View {
    @Binding var toogle: Bool
    @Binding var elements: [Int]
    let id: Int
    @State var from = Date()
    @State var to = Date()

    private func deleteElement(_ id: Int) {
        withAnimation(.bouncy(duration: 0.45, extraBounce: 0.25)) {
            if let index = elements.firstIndex(of: id) {
                elements.remove(at: index)
            }

            if elements.count <= 0 {
                toogle.toggle()
            }
        }
    }

    var body: some View {
        HStack {
            CustomDatePicker(label: "From", selectedDate: $from, )
            Spacer()
            CustomDatePicker(label: "To", selectedDate: $to, )
            Spacer()
            Spacer()
            Button {
                deleteElement(id)
            } label: {
                Image(systemName: "xmark")
                    .padding(8)
                    .foregroundStyle(.black.opacity(0.7))
                    .fontWeight(.semibold)
                    .background(.backGroundGrey)
                    .clipShape(.buttonBorder)
            }

        }
        .id(id)
        .background(.white)
        .transition(.opacity.combined(with: .offset(y: 30)))
        .padding(.vertical, 8)
        .onAppear {
            from = Date().addingTimeInterval(
                3600 * TimeInterval(elements.count * 2)
            )
            to = Date().addingTimeInterval(
                7200 * TimeInterval(elements.count * 2)
            )
        }
    }
}

