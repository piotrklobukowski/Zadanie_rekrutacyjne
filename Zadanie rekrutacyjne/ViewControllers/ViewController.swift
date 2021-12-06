//
//  ViewController.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 26/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let catsViewModel = CatDataViewModel(catDataProvider: CatAPIService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CatDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CatDetailsTableViewCell")
        catsViewModel.didLoadHandler = { [weak self] in
            self?.tableView.reloadData()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViewOnRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func reloadTableViewOnRotated() {
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatDetailsTableViewCell", for: indexPath) as! CatDetailsTableViewCell
        let cellViewModel = catsViewModel.cellViewModels[indexPath.row]
        let imageHeight = view.safeAreaLayoutGuide.layoutFrame.width * cellViewModel.imageRatio
        cell.configureCell(withText: cellViewModel.cellText, andImage: cellViewModel.cellImage, imageHeight: imageHeight)        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catsViewModel.cellViewModels.count
    }
}

