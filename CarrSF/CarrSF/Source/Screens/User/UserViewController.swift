//
//  UserViewController.swift
//  CarrSF
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

public class UserViewController: UIViewController {
    public let viewModel: UserViewModel
    private let disposeBag = DisposeBag()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View Profile", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Usuário"
        view.backgroundColor = .white
        viewModel.fetchUser()
        setup()
        
    }
    
    @objc private func viewProfileButtonTapped() {
        viewModel.profileURL
            .subscribe(onNext: { [weak self] url in
                if let profileURL = url {
                    UIApplication.shared.open(profileURL)
                }
        })
        .disposed(by: disposeBag)
    }
}

extension UserViewController: ViewManager {
    public func bindViewModel() {
        viewModel.name
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.login
            .bind(to: loginLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.avatarURL
            .subscribe(onNext: { [weak self] url in
            DispatchQueue.global().async {
                guard let url = url else {
                    return
                }
                if let imageData = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self?.avatarImageView.image = UIImage(data: imageData)
                    }
                }
            }
        })
        .disposed(by: disposeBag)
    }
    
    public func viewHierarchy() {
        view.addSubview(nameLabel)
        view.addSubview(loginLabel)
        view.addSubview(avatarImageView)
        view.addSubview(profileButton)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            loginLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 16),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            avatarImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200),
            
            profileButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        profileButton.addTarget(self, action: #selector(viewProfileButtonTapped), for: .touchUpInside)
    }
}
