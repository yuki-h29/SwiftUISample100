//
//  MemberListView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/11.
//

import SwiftUI

// 会員リストを表示するViewクラス
struct MemberListView: View {
    @ObservedObject var viewModel: MemberListViewModel
    @State private var newName = ""
    @State private var newAddress = ""

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.members, id: \.self) { member in
                    VStack(alignment: .leading) {
                        Text(member.name ?? "Unknown Name")
                        Text(member.address ?? "Unknown Address")
                    }
                }
            }
            HStack {
                TextField("Name", text: $newName)
                TextField("Address", text: $newAddress)
            }
            .padding()
            .navigationBarItems(trailing: Button("Add") {
                viewModel.addMember(id: UUID(), name: newName, address: newAddress)
            })
            .navigationBarTitle("Members", displayMode: .inline)
        }
    }
}
