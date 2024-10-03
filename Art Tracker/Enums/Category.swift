//
//  Category.swift
//  Art Tracker
//
//  Created by Роман on 03.10.2024.
//
enum Category: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case painting = "Painting"
    case sculpture = "Sculpture"
    case photo = "Photo"
    case graphics = "Graphics"
    case design = "Design"
    case lithography = "Lithography"
    case watercolour = "Watercolour"
    case collage = "Collage"
    case installation = "Installation"
    case performanceArt = "Performance art"
    case creativeWriting = "Creative writing"
    case animation = "Animation"
    case videoArt = "Video Art"
    case architecture = "Architecture"
    case ceramics = "Ceramics"
    case textileArt = "Textile art"
    case drawing = "Drawing"
    case streetArt = "Street art (graffiti)"
    case digitalMediaArt = "The Art of Digital Media"
}


