//
//  ViewController.swift
//  AnimationCrediCard
//
//  Created by Vinicius Ricci on 23/07/2018.
//  Copyright © 2018 Vinicius Ricci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inverseCollectionViewCell : UICollectionView!
    var reusableCell = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
       
        inverseCollectionViewCell.dataSource = self
        inverseCollectionViewCell.delegate = self
        inverseCollectionViewCell.backgroundColor = UIColor.black
        //inverseCollectionViewCell.register(InverseCollectionViewCell.self, forCellWithReuseIdentifier: reusableCell)
    }

}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! InverseCollectionViewCell
        if cell.cardFrontView.isHidden == false {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: cell.cardFrontView, duration: 1.0, options: transitionOptions, animations: {
                cell.cardFrontView.isHidden = true
                cell.cardFrontImg.isHidden = true
            }, completion: nil)
            
            UIView.transition(with: cell.cardBackView, duration: 1.0, options: transitionOptions, animations: {
                cell.cardBackView.isHidden = false
                cell.cardBackImg.isHidden = false
            }, completion: nil)
        }
        else if cell.cardBackView.isHidden == false {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: cell.cardFrontView, duration: 1.0, options: transitionOptions, animations: {
                cell.cardBackView.isHidden = true
                cell.cardBackImg.isHidden = true
            }, completion: nil)
            
            UIView.transition(with: cell.cardBackView, duration: 1.0, options: transitionOptions, animations: {
                cell.cardFrontView.isHidden = false
                cell.cardFrontImg.isHidden = false
            }, completion: nil)
        }
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let inverseCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCell, for: indexPath) as? InverseCollectionViewCell {
            inverseCell.cardFrontView.isHidden = false
            inverseCell.cardFrontImg.isHidden = false
            inverseCell.cardBackView.isHidden = true
            inverseCell.cardBackImg.isHidden = true
            inverseCell.cardFrontImg.image = UIImage(named: "platinum")
            inverseCell.cardBackImg.image = UIImage(named: "reverse")
            
            return inverseCell
        }
        else {
            return UICollectionViewCell()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
}
