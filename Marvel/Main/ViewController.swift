//
//  ViewController.swift
//  Marvel
//
//  Created by Apple on 9/23/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    var displayedCharacters = [Result]()
    
    var totalNumberOfCharacters: Int = 0
    var currentNumberOfCharacters: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reuseCharacterCollection")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCharacters()
        // Do any additional setup after loading the view.
    }

    

}

//MARK: API Call
extension ViewController{
    
    func getCharacters(){
        APIClient.shared.getCharacters().observe(on: MainScheduler.instance).subscribe { [weak self] mainModel in
            guard let `self` = self else {return}
            self.totalNumberOfCharacters = mainModel.data?.total ?? 0
            self.currentNumberOfCharacters = mainModel.data?.count ?? 0
            self.displayedCharacters = mainModel.data?.results ?? []
            self.collectionView.reloadData()
        } onFailure: { [weak self] error in
            guard let `self` = self else {return}
            print("DEBUG :: \(error.localizedDescription)")
            self.displayedCharacters = []
        }.disposed(by: self.disposeBag)
    }
    
    func getMoreCharacters(){
        APIClient.shared.getCharacters(params: ["offset":self.currentNumberOfCharacters]).observe(on: MainScheduler.instance).subscribe { [weak self] model in
            guard let `self` = self else {return}
            self.displayedCharacters.append(contentsOf: model.data?.results ?? [])
            self.currentNumberOfCharacters = self.displayedCharacters.count
            self.collectionView.reloadData()
        } onFailure: { [weak self] error in
            guard let `self` = self else {return}
            print("DEBUG :: \(error.localizedDescription)")
            self.displayedCharacters = []
        }.disposed(by: self.disposeBag)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCharacterCollection", for: indexPath) as! CharacterCollectionViewCell
        cell.setup(model: displayedCharacters[indexPath.item])
        cell.alpha = 0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width/2) - 8
        let height = 355.0
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let animationDuration: Double = 0.5
        let delayBase: Double = 0.2
        let delay = sqrt(Double(indexPath.row)) * delayBase
        UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseOut, animations: {
            cell.alpha = 1
        })
        if currentNumberOfCharacters < totalNumberOfCharacters{
            if indexPath.item == self.currentNumberOfCharacters - 1{
                self.getMoreCharacters()
            }
        }
    }
}
