//
//  ViewController.swift
//  bitcoin
//
//  Created by Preeti Kesarwani on 11/14/23.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UIScrollViewDelegate , UITableViewDelegate {
    
    
    
    var bitCoinViewModel = BitCoinViewModel()
    
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    var bitCoinModel = [BitCoinModel]()
    let disposeBag = DisposeBag()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // tableView.delegate = self
    
        setUpBinding()
        
        bitCoinViewModel.FetchData()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func setUpBinding(){
        
        // loading part
        bitCoinViewModel
            .loading
            .bind(to: indicator.rx.isAnimating)
            .disposed(by: disposeBag)
        // error part
        bitCoinViewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                
                
                print(errorString)
                
            }
            .disposed(by: disposeBag)
        /*
         // get bit coin part
         bitCoinViewModel
         .crytos
         .observe(on: MainScheduler.asyncInstance)
         .subscribe { bitCoin in
         self.bitCoinModel = bitCoin
         self.tableView.reloadData()
         }.disposed(by: disposeBag)
         */
        
        bitCoinViewModel
            .crytos
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: tableView.rx.items(cellIdentifier: "BitCoinTableViewCell",cellType: BitCoinTableViewCell.self)){row,item,cell in
                
                cell.item = item
                
            }
            .disposed(by: disposeBag)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    
}

 
 
 
 
 

