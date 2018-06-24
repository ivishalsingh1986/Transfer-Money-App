//
//  TransferMoneyBaseApi.swift
//
//  Created by Vishal Singh. on 23/6/18.
//  Copyright © 2018 Vishal Singh. All rights reserved.
//

import Foundation
import Alamofire

protocol TransferMoneyBaseApi {
    var baseUrl: String {get set}
    var path: String {get set}
    var headers: [String: Any] {get set}
    var method: HTTPMethod {get set}
    
    func parameters() -> [String : Any]?
    
    
}


