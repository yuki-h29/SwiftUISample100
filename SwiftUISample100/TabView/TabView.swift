//
//  TabView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                FirstView()
            }
            .tabItem {
                Label("Text", systemImage: "1.square.fill")
            }
            
            NavigationView {
                PickerView()
            }
            .tabItem {
                Label("Picker", systemImage: "2.square.fill")
            }
            
            NavigationView {
                DatePickerView()
            }
            .tabItem {
                Label("Date", systemImage: "3.square.fill")
            }
        }
    }
}


struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
