//
//  ViewController.swift
//  UITableView.1
//
//  Created by 1 on 25/1/24.
//


import UIKit

class ViewController: UIViewController {
    
    private lazy var loginLabel: UILabel = MakerView().makeLabel(text: "Login", textSize: 18, textWeigt: .bold)
    private lazy var welcomeLabel: UILabel = MakerView().makeLabel(text: "Welcome back, Rohit thakur")
    private lazy var enterLabel: UILabel = MakerView().makeLabel(text: "Enter Your Mobile Number", textColor: .orange, textSize: 17, textWeigt: .bold)
    private lazy var changeLabel: UILabel = MakerView().makeLabel(text: "Change Number?")
    private lazy var youLabel: UILabel = MakerView().makeLabel(text: "You Don't have an account?")
    
    private lazy var personImage: UIImageView = MakerView().makeImage(named: "person")
    private lazy var girlImage: UIImageView = MakerView().makeImage(named: "girl")
    private lazy var googleImage: UIImageView = MakerView().makeImage(named: "google")
    
    private lazy var loginButton: UIButton = MakerView().makeButton(title: "Login", tintColor: .white ,backgroundColor: .orange)
    private lazy var googleButton: UIButton = MakerView().makeButton(title: "Google")
    private lazy var signButton: UIButton = MakerView().makeButton(title: "Sign in")
    
    private lazy var enterTF: UITextField = {
        var tf = UITextField()
        tf.placeholder = "Enter Number"
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 14
        tf.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = .always
        return tf
    }()
    
    private lazy var googleStack: UIStackView = MakerView().makeStack()
    private lazy var loginStack: UIStackView = MakerView().makeStack()
    private lazy var signStack: UIStackView = MakerView().makeStack()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
        setupImage()
        setupTF()
        setupButton()
        setupMyStack()
        
    }
    
    private func setupLabel() {
        view.addSubview(loginStack)
        view.addSubview(welcomeLabel)
        view.addSubview(enterLabel)
        view.addSubview(girlImage)
        view.addSubview(changeLabel)
        view.addSubview(enterTF)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 0),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: girlImage.bottomAnchor, constant: 10),
            enterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeLabel.topAnchor.constraint(equalTo: enterTF.bottomAnchor, constant: 8),
            changeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }
    
    private func setupImage() {
        view.addSubview(girlImage)
        
        NSLayoutConstraint.activate([
            girlImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
            girlImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            girlImage.heightAnchor.constraint(equalToConstant: 231)
        ])
        
    }
    
    private func setupTF() {
        view.addSubview(enterTF)
        
        NSLayoutConstraint.activate([
            enterTF.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 25),
            enterTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            enterTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            enterTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupButton() {
        view.addSubview(loginButton)
        googleStack.addArrangedSubview(googleImage)
        googleStack.addArrangedSubview(googleButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: changeLabel.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ]); loginButton.addTarget(self, action: #selector(goToContactViewController), for: .touchUpInside)
    }
    
    @objc func goToContactViewController(sender: UIButton) {
        guard let text1 = enterTF.text else { return }
        
        if text1.isEmpty {
            validateTF(tf: enterTF, error: "Please, fill field", borderColor: UIColor.red.cgColor, borderWidth: 2)
        } else if !text1.hasPrefix("+996") {
            validateTF(tf: enterTF, error: "Invalid phone number", borderColor: UIColor.red.cgColor, borderWidth: 2)
        } else {
            let contact = ContactViewController()
            navigationController?.pushViewController(contact, animated: true)
        }
    }
    
    func validateTF( tf: UITextField, error: String, borderColor: CGColor, borderWidth: Int) {
        tf.placeholder = error
        tf.layer.borderColor = borderColor
        tf.layer.borderWidth = CGFloat(borderWidth)
    }
    
    private func setupMyStack() {
        view.addSubview(loginStack)
        view.addSubview(googleStack)
        view.addSubview(signStack)
        
        loginStack.addArrangedSubview(loginLabel)
        loginStack.addArrangedSubview(personImage)
        
        signStack.addArrangedSubview(youLabel)
        signStack.addArrangedSubview(signButton)
        
        
        
        NSLayoutConstraint.activate([
            loginStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            loginStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginStack.heightAnchor.constraint(equalToConstant: 20),
            loginStack.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            googleStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 35),
            googleStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleStack.heightAnchor.constraint(equalToConstant: 25),
            googleStack.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            signStack.topAnchor.constraint(equalTo: googleStack.bottomAnchor, constant: 45),
            signStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signStack.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        
        
    }
    
}

