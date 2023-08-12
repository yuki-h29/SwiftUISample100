//
//  PokemonListViewModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/23.
//

import Combine

/// PokemonListViewModel
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = [
        Pokemon(name: "カビゴン"),
        Pokemon(name: "ピカチュー"),
        Pokemon(name: "コダック"),
        Pokemon(name: "カメックス"),
        Pokemon(name: "ヤドン")
    ]
    @Published var selectedPokemon: Pokemon? = nil
    
    func resetSelection() {
        self.selectedPokemon = nil
    }
}
