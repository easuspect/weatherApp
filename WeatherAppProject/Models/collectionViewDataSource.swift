//
//  collectionViewModel.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/7/22.
//

import UIKit

protocol CollectionViewDataSourceDelegate: AnyObject {
    func didClickItem(at index: Int)
}

class CollectionViewDataSource: NSObject {

    weak var collectionView: UICollectionView?
    var items: [TimeZoneViewModel] = []
    var otherItems: [OtherDaysInfoModel] = []
    
    weak var delegate: CollectionViewDataSourceDelegate?
    
    let otherDays = OtherDaysTableViewCell()
    
    private let timeZoneWeatherCellIdentifier = "TimeZoneWeatherCell"
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
 
        registerCell()
        
        
        self.collectionView?.contentInset = .init(top: 0, left: 32, bottom: 0, right: 32)
    }
}

extension CollectionViewDataSource {
    
    func setItems(_ items: [TimeZoneViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func scrollTo(index: Int) {
        collectionView?.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .centeredHorizontally, animated: false)
    }
}

extension CollectionViewDataSource {
    
    func registerCell() {
        collectionView?.register(.init(nibName: "TimeZoneCell", bundle: nil), forCellWithReuseIdentifier: timeZoneWeatherCellIdentifier)
    }
}

extension CollectionViewDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didClickItem(at: indexPath.row)
    }
}

extension CollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeZoneWeatherCellIdentifier, for: indexPath) as! TimeZoneCell
        let item = items[indexPath.row]
        cell.upLabel.text = item.hour
        cell.downLabel.text = item.degree
        
        
        if  item.isFocused == true {
            cell.adjustUIForTopState()
        } else {
            cell.adjustUIForBottomState()
        }
        return cell
    }
}

extension CollectionViewDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: collectionView.frame.height)
    }
}

private extension TimeZoneCell {
    
    func adjustUIForTopState() {
        midImageLabel.tintColor = .colorDarkBlue
        downLabel.textColor = .colorDarkBlue
        upLabel.textColor = .colorDarkBlue
        containerView.backgroundColor = .white
        containerViewTopConstraint.constant = 0
        containeViewBottomConstraint.constant = 32
    }
    
    func adjustUIForBottomState() {
        midImageLabel.tintColor = .white
        downLabel.textColor = .white
        upLabel.textColor = .white
        containerView.backgroundColor = .colorDarkBlue
        containerViewTopConstraint.constant = 16
        containeViewBottomConstraint.constant = 16
    }
}


