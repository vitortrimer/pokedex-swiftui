//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Vitor Trimer on 17/01/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "water": return .systemBlue
        case "poison": return .systemGreen
        case "grass": return .systemGreen
        case "bug": return .systemGreen
        case "normal": return .systemOrange
        case "ground": return .systemGray2
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        case "psychic": return .systemPurple
        case "electric": return .systemYellow
        default:
            return .systemIndigo
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsSting = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsSting?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
