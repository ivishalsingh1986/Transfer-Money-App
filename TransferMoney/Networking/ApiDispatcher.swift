//
//
//  Created by Vishal Singh on 23/6/18.
//  Copyright © Vishal Singh All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiDispatcher {
    
    public static let sharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()

    static func execute<T: Mappable, E:Mappable>(apiInstance:AnyObject,
                                                 shouldPromptStatusBarAlert: Bool = true,
                                                 encoding: ParameterEncoding = JSONEncoding.default,
                                                 completionHandler: @escaping (_ result:T?) -> (),
                                                 businessErrorHandler: @escaping (_ result:E?) -> (), 
                                                 errorHandler: @escaping (_ result:NSError) -> ()){
        
        guard Connectivity.isConnectedToInternet else {
            
            let error = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue, userInfo: nil)
            errorHandler(error)
            return
        }
        
            let obj = apiInstance
            let api: TransferMoneyBaseApi = obj as! TransferMoneyBaseApi
            let m = api.method
            let params = api.parameters()
            let url : String = NSString.localizedStringWithFormat("%@%@",api.baseUrl,api.path) as String
            let headers = api.headers as! Dictionary<String, String>
        
            print("Url===========================\(url)")
            print("Params===========================\(String(describing: params))")
            print("Headers===========================\(headers)")
        
            ApiDispatcher.sharedManager.request(url, method: m, parameters: params, encoding: encoding, headers: headers)
                
                .validate(contentType: ["application/json", "text/html"])
                .responseJSON(completionHandler: {(response) -> Void in
                    
                    let defaultError = NSError(domain: "UnexpectedErrorRecieved", code: 1024, userInfo: nil)
                    response.result.ifSuccess {
                        let successStatusCodes = [200,201,204]
                        if (successStatusCodes.contains((response.response?.statusCode)!)) {
                            if let response = Mapper<T>().map(JSONObject: response.result.value) {
                                completionHandler(response)
                            } else {
                                completionHandler(nil)
                            }
                        } else {
                            if let errorResponse  = Mapper<E>().map(JSONObject: response.result.value) {
                                
                                businessErrorHandler(errorResponse)
                            } else {
                                errorHandler(defaultError)
                            }
                        }
                    }
                    response.result.ifFailure {
                        
                        let errorResponse = response.result.error! as NSError
                        print("\(errorResponse.code)")
                        print("\(errorResponse.localizedDescription)")
                        errorHandler(errorResponse)
                    }
                })
    }
    
}




