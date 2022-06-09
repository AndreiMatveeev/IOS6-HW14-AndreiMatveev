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
 }
class AlbumsCollectionViewController: UICollectionViewController {
   
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
     // MARK: - Settings
     
     private func setupCollectionView() {
         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
         view.addSubview(collectionView)
         collectionView.backgroundColor = .systemBackground
         collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
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
     
     private func createFirstLayout() -> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                heightDimension: .fractionalHeight(0.2))
         let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)

         let section = NSCollectionLayoutSection(group: group)
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
         section.orthogonalScrollingBehavior = .paging

         return section
     }

     // MARK: - UICollectionViewDataSource, UICollectionViewDeligate

     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 16
     }

     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
         cell.backgroundColor = .green
         cell.layer.borderWidth = 1
         return cell
     }
 }
    // MARK: - Extension
private extension AlbumsCollectionViewController {
     private func createLayout() -> UICollectionViewLayout {
         let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
              guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
              switch sectionLayout {
              case .first:
                  return self.createFirstLayout()
              case .second:
                  return nil
              case .third:
                  return nil
              }
          }
          let config = UICollectionViewCompositionalLayoutConfiguration()
          config.interSectionSpacing = 50
          layout.configuration = config

          return layout
      }
  }



