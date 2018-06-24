//
//  TransactionStatusViewController.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.

import UIKit

protocol TransactionStatusViewControllerOutput {
}

final class TransactionStatusViewController: UIViewController, TransactionStatusPresenterOutput {
    
    var interactor: TransactionStatusViewControllerOutput!
    var router: TransactionStatusRouterInput!
    var transactionResponse :MoneyTransferResponse!
    
    @IBOutlet weak var transactionStatusLabel: UILabel!
    @IBOutlet weak var toNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var transactionView: UIView!
    
    // MARK: - Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let router = TransactionStatusRouter()
        router.viewController = self
        
        let presenter = TransactionStatusPresenter()
        presenter.viewController = self
        
        let interactor = TransactionStatusInteractor()
        interactor.presenter = presenter
        
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showTransactionData()
    }
    
    func showTransactionData() {
        
        guard let transactionResponse = transactionResponse else {
            return
        }
        
        if (transactionResponse.transactionDetails?.transactionStatus!)! {
            
            transactionStatusLabel.text = "Transaction Successful"
            amountLabel.text = "HKD \(String(transactionResponse.transactionDetails!.amount!))"
            toNameLabel.text = "To: \(String(transactionResponse.transactionDetails!.name ?? ""))"
            emailLabel.text = "Email: \(transactionResponse.transactionDetails!.email ?? "")"
            addressLabel.text = "Account Number: \(transactionResponse.transactionDetails!.accountNumber ?? "")"
            
        }else {
            transactionStatusLabel.text = "Transaction Unsuccessful"
            transactionView.isHidden = true
            
        }
        
    }
}
