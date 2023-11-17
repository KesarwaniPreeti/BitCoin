//
//  BitCoinViewModel.swift
//  bitcoin
//
//  Created by Preeti Kesarwani on 11/16/23.
//

import Foundation
import RxSwift
import RxCocoa

class BitCoinViewModel{
    
    let crytos : PublishSubject <[BitCoinModel]> = PublishSubject()
    let error : PublishSubject<String> =  PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func FetchData() {
        self.loading.onNext(true)
        
        NetWork().GetData { result in
            self.loading.onNext(false)
            switch result {
            case .success(let bitcoin):
                self.crytos.onNext(bitcoin)
               
            case .failure(let error):
                switch error {
                case .passingError:
                    self.error.onNext("Passing Error")
                case .ServiceError :
                    self.error.onNext("Service Error")
                }
            }
        }
        
    }
}
