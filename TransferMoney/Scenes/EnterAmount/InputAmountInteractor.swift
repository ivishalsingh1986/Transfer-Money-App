//
//  InputAmountInteractor.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol InputAmountInteractorOutput {
    
    func presentCreateCashoutResponse(response: MoneyTransferResponse)
    func businessErrorHandler(error:NetworkErrorModel)
    func otherErrorHandler(error:Error)
}

final class InputAmountInteractor: InputAmountViewControllerOutput {
    
    var presenter: InputAmountInteractorOutput!
    var worker: InputAmountWorker!
    
    func requestCreateCashout(amount:String, currency:String,payerId:String) {
        
        let  requestValues = CreateCashoutRequestData(amount: ["amount":amount,"currencyCode":currency], payerId: payerId)
        
        let request = RequestAmountTransfer.Request.init(createCashoutRequest: requestValues)
        worker = InputAmountWorker()
        
        //send request
        
        self.worker?.requestForCashout(request: request, completion: { (response) in
            print("Created Cashout successfully")
            
            self.presenter?.presentCreateCashoutResponse(response: response)
            
        }, completeWithError: { (error) in
            
            print("Cashout-------------->\(error)")
            self.presenter?.businessErrorHandler(error: error)
            
        }, falid: { (error) in
            
            print("Cashout-------------->\(error)")
            self.presenter?.otherErrorHandler(error: error)
            
        })
    }
}
