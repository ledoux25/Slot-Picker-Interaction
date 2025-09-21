//
//  ToogleBox.swift
//  SlotPicker
//
//  Created by Sanguo Joseph Ledoux on 9/20/25.
//

import SwiftUI

struct ToggleBox: View {
    var label: String
    @State private var toogle = false
    @State private var selectedDate = Date.now
    @State private var elementCount = 1
    @State private var elements = [1]
    var body: some View {
        HStack {
            VStack {
                withAnimation {
                    Toggle(
                        label,
                        isOn: $toogle.animation(
                            .bouncy(duration: 0.35, extraBounce: 0.14)
                        )
                    )
                    .font(.headline.bold())
                    .foregroundStyle(.black.opacity(0.8))
                    .toggleStyle(
                        SwitchToggleStyle(tint: .blackText)
                    )
                }

                if toogle {

                    ForEach(elements, id: \.self) { id in
                        DateRow(
                            toogle: $toogle,
                            elements: $elements,
                            id: id
                        )
                        .transition(.offset(y: 40).combined(with: .opacity))
                    }
                    Button {
                        withAnimation(
                            .bouncy(duration: 0.45, extraBounce: 0.28)
                        ) {
                            elementCount = elements.count
                            elementCount += 1
                            elements.append(elementCount)
                        }
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add More")
                        }
                        .foregroundStyle(.blackText)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(.backGroundGrey)

                    }
                    .onAppear {
                        if elements.count == 0 {
                            elements.append(1)
                        }
                    }
                    .transition(.opacity.combined(with: .offset(y: 30)))
                    .clipShape(.rect(cornerRadius:  16))
                }

            }
            .padding(.vertical, 10)
            .padding(.horizontal)

        }
        .background(!toogle ? .backGroundGrey : .white)
        .clipShape(.rect(cornerRadius: toogle ? 1 : 16))
        .overlay(
            Group {
                if toogle {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.contentBorder)
                }
            }
        )
        
    }
}


