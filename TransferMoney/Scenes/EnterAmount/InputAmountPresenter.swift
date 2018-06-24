//
//  InputAmountPresenter.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol InputAmountPresenterOutput: class {
    
    func routeToStatusScreen(response: MoneyTransferResponse)
    func showError (message:String)
}

final class InputAmountPresenter: InputAmountInteractorOutput {
    weak var viewController: InputAmountPresenterOutput?
    
    func presentCreateCashoutResponse(response: MoneyTransferResponse){
        
        print("presentCreateCashoutResponse:Success")
        viewController?.routeToStatusScreen(response: response)
        UIUtils.enableUI()
    }
    
    //Handle Ledger/Account related API Errors
    func businessErrorHandler(error:NetworkErrorModel) {
        
        if error.networkErrors != nil {
            
        let businessError =  error.networkErrors![0] as NetworkErrors
        print("RefundDetails errorCode:\(String(describing: businessError.errorCode ?? ""))")
        print("RefundDetails errorDescription:\(String(describing: businessError.errorDiscription ?? ""))")
        if businessError.errorCode == "XXXXXXXX" {
            
            viewController?.showError(message: "Account blocked,Please contact to Customer Care")
            
        } else if businessError.errorCode == "YYYYYYY" {
            
            viewController?.showError(message: "Annual limit reached,Please contact to Customer Care")
        }
    }else {
     viewController?.showError(message: "Something went wrong, Please try again")
    }
    
        UIUtils.enableUI()
    }
    
    //Handle System/Server/Network related Error
    func otherErrorHandler(error:Error) {
        
        if error._code == NSURLErrorNotConnectedToInternet {
            
            viewController?.showError(message: "No Internet")
        }
        else if error._code == NSURLErrorTimedOut {
            
            viewController?.showError(message: "Session time out, Please try again")
            
        }else {
            
            viewController?.showError(message: "Something went wrong, Please try again")
        }
        DispatchQueue.main.async {
            UIUtils.enableUI()
        }
    }
}
