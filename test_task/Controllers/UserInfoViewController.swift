//
//  UserInfoViewController.swift
//  test_task
//
//  Created by Denis Kholod on 05.04.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    
    private let logo: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        let email = UserDefaults.standard.string(forKey: "Email")
        label.text = "Email " + email!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        let pass = UserDefaults.standard.string(forKey: "Password")
        label.text = "Password " + pass!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationItem.title = "Active User"
        let allUsers = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(allUsersTapped))
        navigationItem.rightBarButtonItem = allUsers
        
        
    }
    
    
    @objc private func allUsersTapped() {
        let usersViewController = UsersViewController()
        navigationController?.pushViewController(usersViewController, animated: true)

    }
    
    private func setupViews() {
        logo.layer.cornerRadius = 100
        view.backgroundColor = .white

        stackView = UIStackView(arrangedSubviews: [logo,
                                                   emailLabel,
                                                   passwordLabel],
                                axis: .vertical,
                                spacing: 30,
                                distribution: .fillProportionally)
        
        view.addSubview(stackView)
    }
}

//MARK: - SetConstraints

extension UserInfoViewController {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}



