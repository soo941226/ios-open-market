//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var container: UICollectionView!
    
    var goodsList = [GoodsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.hidesWhenStopped = true
        
        container.delegate = self
        container.dataSource = self
        
        navigationItem.title = "아아마켓"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        do {
            indicator.startAnimating()
            try NetworkManager.shared.getItems(pageIndex: 1) { [weak self] result in
                switch result {
                case .success(let list):
                    self?.goodsList.append(list)
                    DispatchQueue.main.async {
                        self?.container.reloadData()
                        self?.indicator.stopAnimating()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsList.reduce(0) { result, list in
            return result + list.items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = container.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GoodsListCell else {
            return UICollectionViewCell()
        }
        
        
        cell.configure(item: goodsList[indexPath.section].items[indexPath.item])
        
        return cell
    }
}
