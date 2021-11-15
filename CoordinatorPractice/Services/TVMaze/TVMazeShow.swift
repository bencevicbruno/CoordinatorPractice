//
//  TVMazeShow.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

struct TVMazeShow {
    let id: Int
    let name: String
    let genres: [String]
    let averageRating: Float
//    let image: UIImage
    
    init(from response: TVMazeShowResponse) {
        let show = response.show
        
        self.id = show.id
        self.name = show.name ?? "Untitled"
        self.genres = show.genres ?? ["none"]
        self.averageRating = show.rating?.average ?? 0.0
//        self.image = UIImage()
    }
}

struct TVMazeShowResponse: Codable {
    let show: Show
    
    struct Show: Codable {
        let id: Int
        let name: String?
        let genres: [String]?
        let rating: Rating?
//        let image: Image
        
        struct Rating: Codable {
            let average: Float?
        }
        
        struct Image: Codable {
            let medium: String
        }
    }
}
