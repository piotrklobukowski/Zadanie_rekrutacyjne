//
//  CatsViewModel.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 27/10/2021.
//

import Foundation
import UIKit.UIImage

class CatDataViewModel: NSObject {
    
    private let catDataProvider: CatDataProviding
    private var timer = Timer()
    private let updateTimeInterval = TimeInterval(20)
    private var cats: [CatData] = []
    var cellViewModels: [CellViewModel] = [] {
        didSet {
            didLoadHandler?()
        }
    }
    var didLoadHandler: (() -> Void)?
    
    init(catDataProvider: CatDataProviding) {
        self.catDataProvider = catDataProvider
        super.init()
        timer = Timer.scheduledTimer(withTimeInterval: updateTimeInterval, repeats: true, block: { [weak self] _ in
            self?.fetchListOfCatData()
        })
        RunLoop.main.add(timer, forMode: .common)
        timer.fire()
    }
    
    func fetchListOfCatData() {
        catDataProvider.getListOfCats { [weak self] cats in
            var viewModels = [CellViewModel]()
            
            cats.forEach { catData in
                let names = catData.breeds.compactMap { $0.name }.joined(separator: ", ")
                if let image = self?.catDataProvider.getPhotoOfCat(from: catData.photoUrl) {
                    let viewModel = CellViewModel(cellText: names, cellImage: image, imageRatio: CGFloat(catData.height)/CGFloat(catData.width))
                    viewModels.append(viewModel)
                }
            }
            DispatchQueue.main.async {
                self?.cellViewModels = viewModels
            }
        }
    }

}
