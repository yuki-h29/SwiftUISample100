//
//  ContentView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

struct FirstView: View {
    @State private var date = Date()

    var body: some View {
        NavigationView {
            VStack {
                
                VStack(alignment: .leading) { // タイトル表示用のVStack
                    Text("Tabberを含んだ画面遷移のサンプル") // タイトルテキスト
                        .font(.title) // フォントのサイズをタイトルサイズに
                        .foregroundColor(.blue) // テキストの色を赤色に
                        .padding([.trailing], 20) // 右側に20ポイントのパディングを追加
                }
                
                NavigationLink(destination: SecondView()) {
                    Text("Go to Detail View")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

