//
//  AppDelegate+FlowController.swift
//  CarrSF
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation
import UIKit
import Infra

public class AppDelegateFlowController: UIViewController {
    public var navigation: UINavigationController?
    
    public override func viewDidLoad() {
        start()
    }
    
    public func start() {
        CarrSFFactory.makeRegisterServices()
        super.viewDidLoad()
        if self.navigation == nil {
            let viewModel = HomeViewModel(usersList: CarrSFFactory.makeUsers())
            let homeViewController = HomeViewController(viewModel: viewModel)
            homeViewController.delegate = self
            let uiNavigationController = UINavigationController(rootViewController: homeViewController)
            uiNavigationController.setNavigationBarHidden(false, animated: true)
            self.navigation = uiNavigationController
        }
    }
    
    public func goUserView(userName: String) {
        let viewModel = UserViewModel(useCase: CarrSFFactory.makeUserUseCase(), userName: userName)
        let userView = UserViewController(viewModel: viewModel)
                
        navigation?.pushViewController(userView, animated: true)
    }
}

extension AppDelegateFlowController: HomeViewControllerDelegate {
    func didSelectUser(user: User) {
        let path = "/" + user.login
        goUserView(userName: path)
    }
}
