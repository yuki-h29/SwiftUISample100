//
//  SendMessageViewModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/15.
//

import SwiftUI

class SendMessageViewModel: ObservableObject {
    @Published var message = SendMessageModel(text: "ここに入力した値を次の画面に送るよ")
}
