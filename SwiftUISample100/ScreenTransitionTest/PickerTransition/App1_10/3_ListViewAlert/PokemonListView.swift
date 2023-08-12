//
//  PokemonListView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/23.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel: PokemonListViewModel

    var body: some View {
        List(viewModel.pokemons) { pokemon in
            Button(action: {
                self.viewModel.selectedPokemon = pokemon
            }) {
                Text(pokemon.name)
            }
        }
        .alert(item: $viewModel.selectedPokemon) { pokemon in
            Alert(
                title: Text("ポケモン名"),
                message: Text(pokemon.name),
                dismissButton: .default(Text("閉じる")) {
                    self.viewModel.resetSelection()
                }
            )
        }
    }
}
