//
//  HomeViewController.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit
import CollectionViewPagingLayout

class HomeViewController: UIViewController, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    private func setupCollectionView() {
        let layout = CollectionViewPagingLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
}
