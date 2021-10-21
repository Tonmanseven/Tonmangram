//
//  AuthViewController.swift
//  Tonmangram
//
//  Created by Булат Сунгатуллин on 21.10.2021.
//

import UIKit
import PhoneNumberKit

class AuthViewController: UIViewController {

    private var mainView: UIView!
    
    private let phoneNumberkit = PhoneNumberKit()
    
    var textField: PhoneNumberTextField!
    
    private var activityIndicator: UIActivityIndicatorView!
    
    private let descText = "Проверьте код страны и введите свой номер телефона."

    // MARK: View Setups
    private func phoneLabelSetup() {
        mainView = UIView(frame: self.view.bounds)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .systemBackground
        self.view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        let phoneLabel = UILabel()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 120).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        phoneLabel.text = "Телефон"
        phoneLabel.font = UIFont(name: UIFont.nameOf.NotoSansOriya_Bold.rawValue, size: 25)
        
        let descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40).isActive = true
        descLabel.textAlignment = .center
        descLabel.numberOfLines = 0
        descLabel.font = UIFont(name: UIFont.nameOf.GillSans_Light.rawValue, size: 20)
        descLabel.text = descText
        
        textField = PhoneNumberTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(textField)
        textField.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40).isActive = true
        textField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField.withPrefix = true
        textField.withExamplePlaceholder = true
        textField.withFlag = true
        
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.becomeFirstResponder()
    }
    
    private func navItemSetup() {
        let item = UIBarButtonItem(title: "Далее", style:.plain, target: self,
                                   action: #selector(nextTapped))
        self.navigationItem.rightBarButtonItem = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabelSetup()
        navItemSetup()
    }

    
    @objc func nextTapped() {
        checkValidNumber()
    }
    
    private func checkValidNumber() {
        if let number = textField.text {
            do {
                let phoneNumber = try phoneNumberkit.parse(number)
                print("Parse:", phoneNumber)
            }
            catch {
                textField.animateBorderColor(toColor: .red, duration: 0.25)
                textField.animateBorderColor(toColor: .systemGray5, duration: 0.25)
            }
        }
        
    }
    
    private func presentActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.tintColor = .systemBlue
        
        let item = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.rightBarButtonItem = item
        activityIndicator.startAnimating()
    }
}

