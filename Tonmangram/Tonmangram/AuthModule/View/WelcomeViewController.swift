//
//  WelcomeViewController.swift
//  Tonmangram
//
//  Created by Булат Сунгатуллин on 21.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    private var welcomeLabel: UILabel!
    private var teleImageView: UIImageView!
    private var descLabel: UILabel!
    private var nextButton: UIButton!
    private var mainView: UIView!
    
    private let descText = "Открытый клиент Telegram. Общайтесь с друзьями и с семьей где угодно и когда угодно"

    // MARK: View Setups
    /// Welcome Stack
    private func welcomeLabelSetup() {
        mainView = UIView(frame: self.view.bounds)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .systemBackground
        self.view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(welcomeLabel)
        welcomeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 120).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        welcomeLabel.text = "Добро пожаловать!"
        welcomeLabel.font = UIFont(name: UIFont.nameOf.NotoSansOriya_Bold.rawValue, size: 25)
    }
    
    private func teleImageSetup() {
        teleImageView = UIImageView()
        teleImageView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(teleImageView)
        teleImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40).isActive = true
        teleImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        teleImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        teleImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        teleImageView.image = UIImage(named: "telegramIcn")
        teleImageView.contentMode = .scaleAspectFill
    }
    
    private func descLabelSetup() {
        descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: teleImageView.bottomAnchor, constant: 40).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40).isActive = true
        descLabel.textAlignment = .center
        descLabel.numberOfLines = 0
        descLabel.font = UIFont(name: UIFont.nameOf.GillSans_Light.rawValue, size: 20)
        descLabel.text = descText
    }
        
    private func nextButtonSetup() {
        nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nextButton)
        nextButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -60).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.backgroundColor = .darkGray
        nextButton.setTitle(NextButtonNames.start.rawValue, for: .normal)
        nextButton.layer.cornerRadius = 30
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .touchDown)
        
    }
    
    // MARK: View Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabelSetup()
        teleImageSetup()
        descLabelSetup()
        nextButtonSetup()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentWelomeView([welcomeLabel, teleImageView, descLabel])
    }
    
    // MARK: Other Methods and Selectors
    private func presentWelomeView<T: UIView>(_ viewTypes: [T]) {
        for viewType in viewTypes {
            viewType.center.x = view.center.x
            viewType.center.x += view.bounds.width
            
            UIView.animate(withDuration: 0.25, delay: 0,  options: [.curveEaseOut], animations: {
                viewType.center.x -= self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    private func hideWelomeView<T: UIView>(_ viewTypes: [T]) {
        for viewType in viewTypes {
            viewType.center.x = view.center.x
            UIView.animate(withDuration: 0.25, delay: 0,  options: [.curveEaseOut], animations: {
                viewType.center.x -= self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil )
        }
    }
    
    @objc
    private func nextTapped(_ sender: UIButton) {
        sender.pulsate()
        hideWelomeView([welcomeLabel, teleImageView, descLabel])
        let vc = AuthViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navVC.navigationBar.shadowImage = UIImage()
        navVC.navigationBar.isTranslucent = true
        navVC.view.backgroundColor = .clear
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
}

enum NextButtonNames: String {
    case start = "Начать общение"
    case next = "Продолжить"
}
