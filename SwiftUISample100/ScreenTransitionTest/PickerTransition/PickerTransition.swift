//
//  PickerTransition.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/20.
//
import SwiftUI

struct PickerTransition: View {
    @State private var selectedDestination: Destination = ._1_ListView
    @StateObject private var popupViewModel = PopupViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationView {
            VStack {
                Picker("Destination", selection: $selectedDestination) {
                    Text("_1_ListView").tag(Destination._1_ListView)
                    Text("PokemonListView").tag(Destination.PokemonListView)
                    Text("PopupView").tag(Destination.PopupView)
                    Text("GithubAPIView").tag(Destination.GithubAPIContentView)
                    Text("CoreDataView").tag(Destination.CoreDataView)
                    
                }
                .pickerStyle(WheelPickerStyle())
                .padding()

                switch selectedDestination {
                case ._1_ListView:
                    NavigationLink("Go to SampleListView", destination: SampleListView())
                case .PokemonListView:
                    NavigationLink("Go to PokemonListView", destination: PokemonListView(viewModel: PokemonListViewModel()))
                case .PopupView:
                    NavigationLink("Go to PopupView", destination: PopupView(viewModel: popupViewModel))
                    
                    Button("Show Popup") {
                        popupViewModel.selectedPokemon = PopupModel(name: "test", description: "AAA", imageName: "Zangief")
                        popupViewModel.isShowingPopUp = true
                    }
                case .GithubAPIContentView:
                    NavigationLink("Go to GithubAPI", destination: GithubAPIContentView())
                case .CoreDataView:
                    
                    NavigationLink("Go to CoreData", destination: MemberListView(viewModel: MemberListViewModel(context: CoreDataStack.shared.context)))
                    
                }
                
            }
        }
    }
}
