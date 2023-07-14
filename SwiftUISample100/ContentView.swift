//
//  ContentView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Text("Selected date: \(date)")
            DatePickerView()
                .frame(height: 200)
        }
    }
}
