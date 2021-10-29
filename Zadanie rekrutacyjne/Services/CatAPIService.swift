//
//  CatAPIService.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 26/10/2021.
//

import Foundation
import UIKit.UIImage

class CatAPIService: CatDataProviding {
    private let urlSource = URL(string: "https://api.thecatapi.com/v1/images/search?limit=5")!
    
    func getListOfCats(completion: @escaping ([CatData]) -> ()) {
        URLSession.shared.dataTask(with: urlSource) { data, response, error in
            DispatchQueue.global(qos: .utility).async {
            
                if let error = error {
                    print("Failed to get list of cats from thecatapi: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                let decodedData = try! jsonDecoder.decode([CatData].self, from: data)
                completion(decodedData)
            }
        }.resume()
    }
    
    func getPhotoOfCat(from string: String) -> UIImage? {
        guard let url = URL(string: string), let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
}
