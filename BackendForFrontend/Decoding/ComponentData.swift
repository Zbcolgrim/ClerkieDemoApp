//
//  ComponentData.swift
//  BackendForFrontend
//
//  Created by Zachary Buffington on 5/10/22.

import Foundation

struct TextWithImageData: Decodable {
    let title: TextObject
    let subtitle: TextObject
    let image: ImageObject
    let height: Double?
    
    struct TextObject: Decodable {
        let text: String
        let fontSize: Double
        let fontWeight: String
        let color: String
    }
    
    struct ImageObject: Decodable {
        let src: URL
    }
}


struct TextData: Decodable {
    let text: String
}

struct ImageData: Decodable {
    let src: URL
}

struct SpacingData: Decodable {
    let height: Double
}
