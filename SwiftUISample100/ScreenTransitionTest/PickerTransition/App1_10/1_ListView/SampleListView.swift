//
//  _1.ListView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/21.
//

import SwiftUI

// 'User' データを表示する 'SampleListView'
struct SampleListView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State private var newName = "" // 新たなユーザーの名前を入力するためのテキスト

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.users, id: \.id) { user in
                        Text(user.name)
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarItems(trailing: EditButton())

                HStack {
                        TextField("Enter new user name", text: $newName)
                        Button(action: {
                            if !newName.isEmpty {
                                viewModel.add(user: newName)
                                newName = "" // テキストフィールドを空にする
                            }
                        }) {
                            Text("Add")
                        }
                        .disabled(newName.isEmpty) // 新たなユーザーの名前が空の場合、ボタンを無効にする
                    }
                    .padding()
            }
        }
    }

    func delete(at offsets: IndexSet) {
        // 選択されたインデックスに対応する 'User' オブジェクトを削除する
        offsets.map { viewModel.users[$0] }.forEach(viewModel.delete)
    }
}
