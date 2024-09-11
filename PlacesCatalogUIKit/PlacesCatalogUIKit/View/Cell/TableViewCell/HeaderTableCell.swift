//
//  HeaderTableCell.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit

protocol HeaderTableCellDelegate: AnyObject {
    func categoryDidChanged(category: CitiesListData)
}

class HeaderTableCell: UITableViewCell {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    static let identifier = "HeaderTableCell"
    private var Cities = [CitiesListData]()
    weak var delegate: HeaderTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        carouselCollectionView.register(UINib(nibName: CityCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CityCollectionCell.identifier)
        provideLayoutToCollectionView()
    }
    
    //MARK: Setup collection view flow layout
    private func provideLayoutToCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 10
        let height = UIScreen.main.bounds.width * 0.70 - 20
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        carouselCollectionView.collectionViewLayout = layout
    }
    
    func setupData(Cities: [CitiesListData]) {
        self.Cities = Cities
        pageControl.numberOfPages = Cities.count
    }
    
    private func setupPageControl() {
        pageControl.pageIndicatorTintColor = .gray
        pageControl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        pageControl.currentPageIndicatorTintColor = .systemBlue
    }
}

extension HeaderTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionCell.identifier, for: indexPath) as? CityCollectionCell
        cell?.setData(headerImgStr: Cities[indexPath.item].cityName)
        return cell ?? UICollectionViewCell()
    }
}

extension HeaderTableCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UICollectionView {
            let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            self.pageControl.currentPage = page
            guard let delegate = delegate else { return }
            delegate.categoryDidChanged(category: Cities[page])
        }
    }
}
