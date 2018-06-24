//
//  Connectivity.swift
//
//  Created by Vishal Singh on 23/6/18.
//  Copyright © 2018 Vishal Singh. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
