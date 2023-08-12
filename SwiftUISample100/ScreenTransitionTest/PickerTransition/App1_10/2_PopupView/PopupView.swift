//
//  PopupView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/23.
//

import SwiftUI

struct PopupView: View {
    @ObservedObject var viewModel: PopupViewModel
    
    init(viewModel: PopupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Button("Show Popup") {
                withAnimation {
                    viewModel.selectedPokemon = PopupModel(name: "test", description: "AAA", imageName: "Zangief")
                    viewModel.isShowingPopUp = true
                }
            }
            
            if viewModel.isShowingPopUp == true {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            viewModel.isShowingPopUp = false
                        }
                    }
                
                PopupViewLayout(viewModel: viewModel, isPresent: $viewModel.isShowingPopUp)
                    .transition(.move(edge: .bottom))
                    .animation(.linear(duration: 0.3))
            }
        }
    }
}



struct PopupViewLayout: View {
    @ObservedObject var viewModel: PopupViewModel
    @Binding var isPresent: Bool?

    var body: some View {
        VStack(spacing: 12) {
            if let pokemon = viewModel.selectedPokemon {
                Text(pokemon.name)
                    .font(Font.system(size: 18).bold())
                
                Image(pokemon.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text(pokemon.description)
                    .font(Font.system(size: 18))
                    .foregroundColor(.cyan)
            }
            
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .padding(.bottom, 0) // Adjust this to add more bottom padding to the popup
    }
}
