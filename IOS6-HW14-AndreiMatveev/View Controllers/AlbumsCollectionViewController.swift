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
         Item(text: "Папка №4", image: UIImage(named: "1-1"), number: 444)],
        
        [Item(text: "Видео",
              image: UIImage(systemName: "video")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 1111),
         Item(text: "Селфи",
              image: UIImage(systemName: "person.crop.square")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 2111),
         Item(text: "Фото Live Photos",
              image: UIImage(systemName: "livephoto")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 1211),
         Item(text: "Портреты",
              image: UIImage(systemName: "cube")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 1121),
         Item(text: "Панорамы",
              image: UIImage(systemName: "pano")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 1112),
         Item(text: "Серии",
              image: UIImage(systemName: "square.stack.3d.down.right")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 1111),
         Item(text: "Снимки экрана",
              image: UIImage(systemName: "camera.viewfinder")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 2111)],
        
        [Item(text: "Импортированные",
              image: UIImage(systemName: "square.and.arrow.down")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 10),
         Item(text: "Скрытые",
              image: UIImage(systemName: "eye.slash")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 11),
         Item(text: "Недавно удаленные",
              image: UIImage(systemName: "trash")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 12)]
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
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.reuseID)
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
    
    // MARK: - First section
    
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
    
    // MARK: - Second section
    
    private func setupSecondLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 8,
                                                     bottom: 0,
                                                     trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475),
                                               heightDimension: .fractionalWidth(0.475))
        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize,
                                                      subitem: item,
                                                      count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 12,
                                                        bottom: 56,
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
    
    // MARK: - Third section
    
    private func setupThirdLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/8))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 18,
            leading: 0,
            bottom: 10,
            trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  itemSize,
            subitem: item,
            count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 12,
            bottom: 30,
            trailing: 12)
        section.contentInsets.leading = 12
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: itemSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Four section
    
    private func setupFourLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/8))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 18,
            leading: 0,
            bottom: 0,
            trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  itemSize,
            subitem: item,
            count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 12
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: itemSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Setup Layout
    
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
                return self.setupThirdLayout()
            case .four:
                return self.setupFourLayout()
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
            return arrayModels[2].count
        case 3:
            return arrayModels[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = arrayModels[indexPath.section][indexPath.row]
        switch (indexPath as NSIndexPath).section {
            
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.reuseID, for: indexPath) as! TableCell
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
            cell.lineSeparators.isHidden = indexPath.row == 7 ? true : false
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.reuseID, for: indexPath) as! TableCell
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
            cell.lineSeparators.isHidden = indexPath.row == 2 ? true : false
            return cell
        default:
            break
        }
        return UICollectionViewCell()
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
        case 2:
            headerView.label.text = "Типы медиафайлов"
            headerView.button.text = nil
        case 3:
            headerView.label.text = "Другое"
            headerView.button.text = nil
        default:
            break
        }
        return headerView
    }
}



