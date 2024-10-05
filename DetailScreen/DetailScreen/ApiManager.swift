//
//  ApiManager.swift
//  DetailScreen
//
//  Created by admin on 04/10/24.
//

import Foundation
import Alamofire

class ApiManager {
    
    let url="https://official-joke-api.appspot.com/jokes/random/50"

    func RiddhiApiCall(riddhiData: @escaping(Result< [JokeModel], Error > ) -> Void ){
        
        AF.request(url).responseDecodable(of: [JokeModel].self) { res in
            switch res.result {
            case .success(let data):
                riddhiData(.success(data))
            case .failure(let err):
                riddhiData(.failure(err))

            }
        }
    }
}



struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}

//"type":"general","":"Why does it take longer to get from 1st to 2nd base, than it does to get from 2nd to 3rd base?","punchline":"Because there’s a Shortstop in between!","id":358}
