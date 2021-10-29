//
//  MockCatDataProvider.swift
//  Zadanie rekrutacyjneTests
//
//  Created by Piotr Kłobukowski on 28/10/2021.
//

import UIKit.UIImage

final class MockCatDataProvider: CatDataProviding {
    
    func getListOfCats(completion: @escaping ([CatData]) -> ()) {
        let bundle = Bundle(for: MockCatDataProvider.self)
        guard let filePath = bundle.path(forResource: "cats", ofType: "json"),
              let jsonString = try? String(contentsOfFile: filePath, encoding: .utf8),
              let jsonData = jsonString.data(using: .utf8),
              let cats = try? JSONDecoder().decode([CatData].self, from: jsonData) else {
                  completion([])
                  return
              }
        completion(cats)
    }
    
    func getPhotoOfCat(from string: String) -> UIImage? {
        return UIImage()
    }
}
