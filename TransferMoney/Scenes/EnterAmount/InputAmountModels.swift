//
//  InputAmountModels.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import ObjectMapper


enum RequestAmountTransfer {
    
    struct Request {
        
        var createCashoutRequest: CreateCashoutRequestData
    }
    struct Response {
        
        var cashoutResponse: MoneyTransferResponse
    }
    struct ViewModel {
    }
}

class MoneyTransferResponse: Mappable {
    
    var transactionDetails: MoneyTransferResponseItem?
    var error: CashoutError?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        
        transactionDetails <- map["transactionDetails"]
        error <- map["error"]
    }
}

class  MoneyTransferResponseItem: Mappable {
    
    var amount: Double?
    var transactionStatus : Bool?
    var id : String?
    var name : String?
    var email : String?
    var accountNumber : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        
        amount <- map["amount"]
        transactionStatus <- map["transactionStatus"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        accountNumber <- map["accountNumber"]
    }
}

class CashoutError : Mappable {
    
    var errorCode: String?
    var errorDescription: String?
    required init?(map: Map){}
    
    func mapping(map: Map) {
        errorCode <- map["errorCode"]
        errorDescription <- map["errorDescription"]
    }
}
