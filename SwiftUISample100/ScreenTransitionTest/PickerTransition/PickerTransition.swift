//
//  PickerTransition.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/20.
//

import SwiftUI

struct PickerTransition: View {
    @State private var selectedDestination: Destination = .firstView

    var body: some View {
        NavigationView {
            VStack {
                Picker("Destination", selection: $selectedDestination) {
                    Text("First View").tag(Destination.firstView)
                    Text("Second View").tag(Destination.secondView)
                    Text("Third View").tag(Destination.thirdView)
                }
                .pickerStyle(WheelPickerStyle())
                .padding()

                switch selectedDestination {
                case .firstView:
                    NavigationLink("Go to selected view", destination: FirstView())
                case .secondView:
                    NavigationLink("Go to selected view", destination: SecondView())
                case .thirdView:
                    NavigationLink("Go to selected view", destination: SecondView())
                }
            }
        }
    }
}
