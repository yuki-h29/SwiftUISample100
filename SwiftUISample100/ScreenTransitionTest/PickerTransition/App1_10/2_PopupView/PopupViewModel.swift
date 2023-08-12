//
//  PopupViewModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/23.
//

import Combine

class PopupViewModel: ObservableObject {
    @Published var isShowingPopUp: Bool? = false
    @Published var selectedPokemon: PopupModel? = nil
}
