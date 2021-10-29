//
//  CatDataProviding.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 28/10/2021.
//

import UIKit.UIImage

protocol CatDataProviding {
    func getListOfCats(completion: @escaping ([CatData]) -> ())
    func getPhotoOfCat(from string: String) -> UIImage?
}
