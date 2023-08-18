//
//  SendMessageFirstView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/15.
//

import SwiftUI

struct SendMessageFirstView: View {
    @ObservedObject var viewModel: SendMessageViewModel

    var body: some View {
        VStack {
            TextField("", text: $viewModel.message.text)
                .padding()
                .border(Color.gray, width: 0.5)
            
            Spacer().frame(height: 20)
            
            Text(viewModel.message.text)
            Spacer().frame(height: 20)
            
            NavigationLink("Go to SecondView",
                           destination: SendMessageSecondView(viewModel: SendMessageViewModel()))
        }
        .padding()  // この行を追加して、ビュー全体にパディングを適用
    }
}
