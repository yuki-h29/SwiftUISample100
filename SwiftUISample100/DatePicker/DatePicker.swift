//
//  DatePicker.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack(alignment: .leading) { // VStackの配置を左寄せに変更
            Text("Date Pickerのサンプル")
                .font(.title) // フォントサイズを設定
                .foregroundColor(.red) // テキストの色を設定
                .padding([.trailing], 20) // パディングを左側に追加
        }
        
        VStack(alignment: .leading) {
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                .environment(\.locale, .init(identifier: "ja_JP"))
                .labelsHidden() // DatePickerのラベルを非表示にする
                .padding([.leading], 20) // パディングを左側に追加
        }
            .padding(.top, 50) // VStackの上側にパディングを追加
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

