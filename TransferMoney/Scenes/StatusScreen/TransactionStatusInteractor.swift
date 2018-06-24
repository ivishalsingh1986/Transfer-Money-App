//
//  TransactionStatusInteractor.swift
//  TransferMoney
//
//  Created by Vishal Singh on 23/6/2018.
//  Copyright (c) 2018 Vishal Singh. All rights reserved.
//

import UIKit

protocol TransactionStatusInteractorOutput {
}

final class TransactionStatusInteractor: TransactionStatusViewControllerOutput {
    var presenter: TransactionStatusInteractorOutput!
    var worker: TransactionStatusWorkerProtocol! = TransactionStatusWorker()

    // MARK: - Business logic

}
