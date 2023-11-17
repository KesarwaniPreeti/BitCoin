//
//  NetWork.swift
//  bitcoin
//
//  Created by Preeti Kesarwani on 11/16/23.
//

import Foundation

enum ErrorHandle : Error {
    case ServiceError
    case passingError
}


class NetWork {
    
    func GetData(completion :@escaping(Result<[BitCoinModel], ErrorHandle>)-> Void ){
        
        guard let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error =  error {
                completion(.failure(.ServiceError))
            }
            
            if let data = data {
                do {
                    let cryptoListResult = try? JSONDecoder().decode([BitCoinModel].self, from: data)
                    if let crytpResult = cryptoListResult {
                        completion(.success(cryptoListResult!))
                    }
                } catch {
                    completion(.failure(.passingError))
                }
            }
            
        }.resume()
        
        
        
        
        
    }
}
