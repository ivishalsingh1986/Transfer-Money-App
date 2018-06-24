//
//  InputAmountWorker.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol InputAmountWorkerProtocol {

}

final class InputAmountWorker: InputAmountWorkerProtocol {
    // MARK: - Business Logic
    
    func requestForCashout(request: RequestAmountTransfer.Request, completion: @escaping (_ result: MoneyTransferResponse) -> (), completeWithError:@escaping (_ error: NetworkErrorModel) -> (), falid:@escaping (_ error: Error) -> ()) -> () {
        
        let apiInstance = RequestTransferMoneyApi()
        apiInstance.requestData = request.createCashoutRequest
        
        ApiDispatcher.execute(apiInstance: apiInstance, completionHandler: {(response:MoneyTransferResponse?) in
            //success handling
            print("\(String(describing: response))")
            completion(response!)
        }, businessErrorHandler: { (errorResponse:NetworkErrorModel!) in
           // print((errorResponse.networkErrors?.first!.errorCode)!)
           // print((errorResponse.networkErrors?.first!.errorDiscription)!)
            //business error handling
            completeWithError(errorResponse)
        }) { (error) in
            print("\(error)")
            falid(error)
            //other error handling
        }
    }
}
