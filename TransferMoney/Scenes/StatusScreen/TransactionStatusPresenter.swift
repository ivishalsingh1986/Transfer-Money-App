//
//  TransactionStatusPresenter.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol TransactionStatusPresenterOutput: class {
}

final class TransactionStatusPresenter: TransactionStatusInteractorOutput {
    weak var viewController: TransactionStatusPresenterOutput?
    
    // MARK: - Presentation logic
    
}
