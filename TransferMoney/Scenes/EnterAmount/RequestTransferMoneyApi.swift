//
//  RequestCashoutApi.swift
//
//  Created by Vishal Singh. on 23/6/18.
//

import Foundation
import Alamofire
import ObjectMapper


class RequestTransferMoneyApi: NSObject,TransferMoneyBaseApi {
    
    var baseUrl: String = TransferMoneyConfig.baseUrl
    var path: String = "/ijot2"
    var method: HTTPMethod = .get
    var headers: [String: Any] = TransferMoneyConfig.generalHeaders
   
    var requestData: CreateCashoutRequestData?
    
    func parameters() -> [String : Any]? {
        
        if let paramModel = requestData {
            
            return ["amount" : paramModel.amount,
                    "payerId" : paramModel.payerId]
        }
        return nil
    }
}

class CreateCashoutRequestData {
    
    var amount: [String:String] = [:]
    var payerId:String = ""
    init(amount : [String:String]?,payerId:String?) {
        
        self.amount = amount!
        self.payerId = payerId!
    }
}
