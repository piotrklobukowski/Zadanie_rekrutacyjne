//
//  CatData.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 26/10/2021.
//

import Foundation

struct CatData: Decodable {
    let breeds: [Breed]
    let photoUrl: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case photoUrl = "url"
        case breeds, width, height
    }
}
