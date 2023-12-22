//
//  ArtworkModel.swift
//  InteractiveArtGallery
//
//  Created by Keto Nioradze on 22.12.23.
//

import Foundation
import SwiftUI


struct ArtworkModel {
    var name: String
}

 var artWorks = [
    ArtworkModel(name: "The Kiss"),
    ArtworkModel(name: "Death And Life"),
    ArtworkModel(name: "Golden Tears"),
    ArtworkModel(name: "Family"),
    ArtworkModel(name: "The Tree Of Life"),
    ArtworkModel(name: "Danae")
]

extension Color {
    static let golden = Color(red:252.0/255.0, green:194.0/255.0, blue:0)
}

