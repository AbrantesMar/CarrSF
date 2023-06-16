//
//  RepositoryController.swift
//  CarrSF
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation
import UIKit

public class RepositoryController: UIViewController {
    let viewModel: UserViewController?
    
    public init(viewModel: UserViewController?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryController: ViewManager {
    
}
