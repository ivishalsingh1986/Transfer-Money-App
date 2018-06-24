//
//  InputAmountRouter.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol InputAmountRouterInput {
    
    func routeToStatusScreen(transactionDetails:MoneyTransferResponse )
}

final class InputAmountRouter: InputAmountRouterInput {
    
    weak var viewController: InputAmountViewController!
    
    func routeToStatusScreen(transactionDetails:MoneyTransferResponse ) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "TransactionStatusViewController") as! TransactionStatusViewController
         destinationVC.transactionResponse = transactionDetails
        viewController.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
