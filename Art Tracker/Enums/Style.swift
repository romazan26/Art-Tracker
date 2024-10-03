//
//  Style.swift
//  Art Tracker
//
//  Created by Роман on 03.10.2024.
//

enum Style: String, CaseIterable, Identifiable{
    case impressionism = "Impressionism"
    case cubism = "Cubism"
    case realism = "Realism"
    case surrealism = "Surrealism"
    case expressionism = "Expressionism"
    case fauvism = "Fauvism"
    case baroque = "Baroque"
    case rococo = "Rococo"
    case artNouveau = "Art Nouveau"
    case constructivism = "Constructivism"
    case minimalism = "Minimalism"
    case popArt = "Pop art"
    case symbolism = "Symbolism"
    case postImpressionism = "Post-Impressionism"
    case neoclassicism = "Neoclassicism"
    case futurism = "Futurism"
    case landscapePainting = "Landscape painting"
    case gothic = "Gothic"
    case avantGarde = "Avant-garde"
    
    var id: Self { self }
}

