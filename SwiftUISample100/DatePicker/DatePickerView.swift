//
//  DatePicker.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date() // 選択された日付を保持するState変数

    var body: some View {
        VStack { // 複数のViewを一つにまとめるVStack
            VStack(alignment: .leading) { // タイトル表示用のVStack
                Text("Date Pickerのサンプル") // タイトルテキスト
                    .font(.title) // フォントのサイズをタイトルサイズに
                    .foregroundColor(.red) // テキストの色を赤色に
                    .padding([.trailing], 20) // 右側に20ポイントのパディングを追加
            }
            
            VStack(alignment: .leading) { // DatePicker表示用のVStack
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date]) // DatePicker
                    .environment(\.locale, .init(identifier: "ja_JP")) // DatePickerのロケールを日本に設定
                    .labelsHidden() // DatePickerのラベルを非表示に
                    .padding([.leading], 20) // 左側に20ポイントのパディングを追加
            }
            .padding(.top, 0) // 上側にパディングは不要なので0に
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

