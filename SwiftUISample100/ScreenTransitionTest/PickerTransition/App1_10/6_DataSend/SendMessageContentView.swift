//
//  SendMessageContentView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/15.
//

import SwiftUI

// エントリーポイント
struct SendMessageContentView: View {
    var viewModel = SendMessageViewModel()

    var body: some View {
        SendMessageFirstView(viewModel: viewModel)
    }
}

struct SendMessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageContentView()
    }
}
