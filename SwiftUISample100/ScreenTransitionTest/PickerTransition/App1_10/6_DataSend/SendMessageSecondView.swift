//
//  SendMessageSecondView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/15.
//

import SwiftUI

struct SendMessageSecondView: View {
    @ObservedObject var viewModel: SendMessageViewModel

    var body: some View {
        Text(viewModel.message.text)
    }
}
