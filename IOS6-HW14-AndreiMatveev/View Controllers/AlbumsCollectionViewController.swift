//
//  AlbumsCollectionViewController.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 07.06.2022.
//

import UIKit

enum Sections: Int {
    case first = 0
    case second = 1
    case third = 2
    case four = 3
}

class AlbumsCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    let arrayModels: [[Item]] = [
        [Item(text: "Папка №1", image: UIImage(named: "1-1"), number: 111),
         Item(text: "Папка №2", image: UIImage(named: "2"), number: 222),
         Item(text: "Папка №3", image: UIImage(named: "3"), number: 333),
         Item(text: "Папка №4", image: UIImage(named: "4"), number: 444),
         Item(text: "Папка №5", image: UIImage(named: "5"), number: 555),
         Item(text: "Папка №6", image: UIImage(named: "6"), number: 666),
         Item(text: "Папка №7", image: UIImage(named: "7"), number: 777),
         Item(text: "Папка №8", image: UIImage(named: "15"), number: 888),],
        
        [Item(text: "Папка №1", image: UIImage(named: "13"), number: 111),
         Item(text: "Папка №2", image: UIImage(named: "14"), number: 222),
         Item(text: "Папка №3", image: UIImage(named: "15"), number: 333),
         Item(text: "Папка №4", image: UIImage(named: "1-1"), number: 444)]
    ]
    
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    // MARK: - Settings
    
    private func setupCollectionView() {
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: addButton)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Альбомы"
    }
    
    // MARK: - Setup Layout
    
    // Первая секция
    
    private func setupFirstLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12,
                                                     leading: 8,
                                                     bottom: 0,
                                                     trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475),
                                               heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize,
                                                      subitem: item,
                                                      count: 2)
        group.interItemSpacing = .fixed(98)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 12,
                                                        bottom: 95,
                                                        trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // Вторая секция
    
    private func setupSecondLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 8,
                                                     bottom: 0,
                                                     trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475),
                                               heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize,
                                                      subitem: item,
                                                      count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 12,
                                                        bottom: 0,
                                                        trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(65))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            switch sectionLayout {
            case .first:
                return self.setupFirstLayout()
            case .second:
                return self.setupSecondLayout()
            case .third:
                return nil
            case .four:
                return nil
            }
        }
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayModels[0].count
        case 1:
            return arrayModels[1].count
        case 2:
            return 0
        case 3:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
        let item = arrayModels[indexPath.section][indexPath.row]
        switch (indexPath as NSIndexPath).section {
            
        case 0, 1:
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView else {
            return HeaderView()
        }

                switch indexPath.section  {
                case 0:
                    headerView.label.text = "Мои альбомы"
                    headerView.button.text = "Все"
                case 1:
                    headerView.label.text = "Общие альбомы"
                    headerView.button.text = "Все"
                default:
                    break
                }
        return headerView
    }
}



