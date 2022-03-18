//
//  ViewController.swift
//  DynamicCollectionView
//
//  Created by Chanon Latt on 3/17/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var data: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = generateDataStore(numberOfItem: 20)
        
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DynamicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DynamicCollectionViewCell")
        
        // MARK: - To make collection view item auto size:
        /*
         - option 1: set layout esteimate size in code
         - option 2. set estimate size to automatic in storyboard of collectionView at size inspector section
         */
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.minimumLineSpacing = 8.0
            layout.minimumInteritemSpacing = 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCollectionViewCell", for: indexPath) as! DynamicCollectionViewCell
        
        // MARK: - To make label multiline: set constraint <= collectionView width
        cell.contentWidthContraint.constant = collectionView.bounds.width
        cell.labelTitle.text = data[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public var getRandomString: String {
        return ["JubJub", "HikHik", "Vannda", "Chanon"].randomElement()!
    }
    
    public var randomNumberOfWords: Int {
        return [1, 2, 3, 4, 5, 6, 10, 20, 30, 40, 50].randomElement()!
    }
    
    public func generateDataStore(numberOfItem: Int) -> [String] {
        (0..<numberOfItem).map { _ in
            return (0..<randomNumberOfWords).reduce("") { partialResult, _ in
                return partialResult + " " + getRandomString
            }
            
        }
    }
}

