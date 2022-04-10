//
//  CollectionViewController.swift
//  test_task
//
//  Created by Denis Kholod on 09.04.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
  
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setNavigationBar()

      
    }

    private func setNavigationBar() {
        navigationItem.title = "Photos"
        let user = createCustomButton(selector: #selector(userInfo))
        let back = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = user
        navigationItem.leftBarButtonItem = back
        
        
    }
    
    
    @objc private func userInfo() {
        let userViewController = UserInfoViewController()
        navigationController?.pushViewController(userViewController, animated: true)

    }
    @objc private func backTapped() {
        let userViewController = AuthViewController()
       // navigationController?.pushViewController(userViewController, animated: true)
        
        let navVC = UINavigationController(rootViewController: userViewController)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)

    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
     
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }

}

