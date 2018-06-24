//
//  NetworkErrorModel.swift
//
//  Created by Vishal Singh on 23/6/18.
//

import UIKit
import Alamofire
import Foundation
import ObjectMapper

class NetworkErrorModel: Mappable {

    var networkErrors : [NetworkErrors]?
    var message: String?
    required init?(map: Map){}
    
    func mapping(map: Map) {
        networkErrors <- map["errors"]
        message <- map["message"]
    }
}

class NetworkErrors : Mappable {
    
    var errorDiscription : String?
    var errorCode : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        
        errorDiscription <- map["errorDescription"]
        errorCode <- map["errorCode"]
    }
}
