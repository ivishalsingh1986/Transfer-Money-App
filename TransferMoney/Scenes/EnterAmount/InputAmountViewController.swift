//
//  InputAmountViewController.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.

import UIKit

protocol InputAmountViewControllerOutput {
    
    func requestCreateCashout(amount:String, currency:String,payerId:String)
}

final class InputAmountViewController: UIViewController, InputAmountPresenterOutput,UITextFieldDelegate {
    
    var interactor: InputAmountViewControllerOutput!
    var router: InputAmountRouterInput!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var inlineErrorLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let router = InputAmountRouter()
        router.viewController = self
        
        let presenter = InputAmountPresenter()
        presenter.viewController = self
        
        let interactor = InputAmountInteractor()
        interactor.presenter = presenter
        
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUI()
    }
    
    func formatUI() {
        amountTextField.becomeFirstResponder()
        hideInlineError()
    }
    
    @IBAction func submitButtonActoin(_ sender: Any) {
        
        if validateInputAmout() {
            interactor?.requestCreateCashout(amount:"", currency:"HKD",payerId: "1234")
            UIUtils.disableUI()
        }
    }
    
    func routeToStatusScreen(response: MoneyTransferResponse) {
        
        response.transactionDetails?.amount = Double(amountTextField.text!)//Commit to show API static amount value
        router.routeToStatusScreen(transactionDetails: response)
    }
    
    func validateInputAmout()->Bool {
        
        let count = (amountTextField.text?.countInstances(of: kDecimalSeparator))
        if(count! > 1){
            showInlineError()
            return false
        }
        else if amountTextField.text?.count == 0 {
            showInlineError()
            return false
        }
        else if Double(amountTextField.text!) == 0 {
            showInlineError()
            return false
        }
        else{
            hideInlineError()
            return true
        }
        /*
         Add more amount restriction as per to requirment
         */
    }
    
    func showInlineError() {
        inlineErrorLabel.isHidden = false
    }
    
    func hideInlineError() {
        inlineErrorLabel.isHidden = true
        
    }
    
    // MARK: - UITextFieldDelegate Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let count = (amountTextField.text?.countInstances(of: kDecimalSeparator))
        //delete will always work
        if string == "" {
            return true
        }
            //Only 1 decimal(.) is allowed
        else if(count! == 1 && string == kDecimalSeparator) {
            showInlineError()
            return false
        }else {
            hideInlineError()
            return true
        }
        /*
         Add more amount restriction as per to requirment
         */
    }
    
    func showError (message:String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
