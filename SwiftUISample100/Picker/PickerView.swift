//
//  SwiftUIView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/14.
//

import SwiftUI

struct PickerView: View {
    // 選択肢となる職業のリスト
    let professions = ["エンジニア", "医者", "教師", "アーティスト", "学生"]
    // 選択された職業を保持するState変数
    @State private var selectedProfession = "エンジニア"
    // Pickerの表示・非表示を管理するState変数
    @State private var isPickerPresented = false
    // Pickerで一時的に選択された職業を保持するState変数
    @State private var tempSelectedProfession = "エンジニア"

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer() // 上部の余白
                VStack(alignment: .leading) {
                    // 選択された職業を表示するテキスト
                    Text("職業: \(selectedProfession)")
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    // Pickerを表示するボタン
                    Button(action: {
                        // 現在選択されている職業を一時的に保存
                        tempSelectedProfession = selectedProfession
                        // Pickerを表示
                        isPickerPresented = true
                    }) {
                        Text("選択")
                            .font(.title2)
                            .frame(width: geometry.size.width - 90) // 画面の幅から90を引く（左右の余白30pxずつを考慮）
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 5)
                }

                // Pickerが表示されているときだけ表示する
                if isPickerPresented {
                    VStack {
                        HStack {
                            // キャンセルボタン
                            Button(action: {
                                // Pickerを閉じる
                                isPickerPresented = false
                            }) {
                                Text("キャンセル")
                            }
                            
                            Spacer()
                            
                            // Doneボタン
                            Button(action: {
                                // 一時的に保存した選択を確定する
                                selectedProfession = tempSelectedProfession
                                // Pickerを閉じる
                                isPickerPresented = false
                            }) {
                                Text("決定")
                            }
                        }
                        .padding()

                        // 職業を選択するPicker
                        Picker("あなたの職業を選択してください", selection: $tempSelectedProfession) {
                            // 選択肢を表示
                            ForEach(professions, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        .labelsHidden()
                        .padding()
                    }
                }
                Spacer() // 下部の余白
            }
            .padding([.leading, .trailing], 30) // 左右の余白を30に設定
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
