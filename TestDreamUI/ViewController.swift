//
//  ViewController.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit


//ToDo: 바꾸기
let keywordCount: Int = 10
let showingKeywordCount: Double = 5.5

class ViewController: BaseViewController {
    
    // ===== UI =====
    private var keywordMenuTabBarView = KeywordMenuTabBarView()
    private var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                              collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // ===== Properties =====
    private let keywordPageCellId = "keywordPageCellId"
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
    }
    
    
    //MARK: -  Setup Views

    override func setupViews() {
        setupTabBar()
        setupCollectionView()
    }
    
    private func setupTabBar(){
        view.addSubview(keywordMenuTabBarView)
        keywordMenuTabBarView.delegate = self
        keywordMenuTabBarView.translatesAutoresizingMaskIntoConstraints = false
        keywordMenuTabBarView.indicatorViewWidthConstraint.constant = self.view.frame.width / showingKeywordCount
        keywordMenuTabBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        keywordMenuTabBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        keywordMenuTabBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        keywordMenuTabBarView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupCollectionView(){
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.backgroundColor = .gray
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(KeywordPageCell.self, forCellWithReuseIdentifier: keywordPageCellId)
        
        view.addSubview(pageCollectionView)
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.keywordMenuTabBarView.bottomAnchor).isActive = true
        
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keywordPageCellId, for: indexPath) as! KeywordPageCell
        cell.label.text = "\(indexPath.row + 1)번째 뷰"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordCount
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        keywordMenuTabBarView.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / showingKeywordCount
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        keywordMenuTabBarView.menuCollectionView.selectItem(at: indexPath,
                                                        animated: true,
                                                        scrollPosition: [])
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width,
                      height: pageCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


//MARK: - MenuBarScrollable

extension ViewController: MenuBarScrollable {
    
    func getMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath,
                                             at: .centeredHorizontally,
                                             animated: true)
    }
    
}
