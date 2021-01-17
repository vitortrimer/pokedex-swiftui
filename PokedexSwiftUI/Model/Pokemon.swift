//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Vitor Trimer on 17/01/21.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbassaur", imageUrl: "bulba", type: "grass"),
    .init(id: 1, name: "Ivysaur", imageUrl: "bulba", type: "poison"),
    .init(id: 2, name: "Venosaur", imageUrl: "bulba", type: "poison"),
    .init(id: 3, name: "Charmander", imageUrl: "bulba", type: "grass"),
    .init(id: 4, name: "Charmeleon", imageUrl: "bulba", type: "fire"),
    .init(id: 5, name: "Charizard", imageUrl: "bulba", type: "fire")
]
