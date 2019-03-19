//
//  ViewController.swift
//  geko test
//
//  Created by juan on 19/03/19.
//  Copyright © 2019 Enrique Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let loginBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG IN", for: .normal)
        button.titleColor(for: .normal)
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SING UP", for: .normal)
        button.titleColor(for: .normal)
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let btnCustom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SING IN", for: .normal)
        button.titleColor(for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.green
        tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.keyboardType = .alphabet
        tf.setBottomBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.green
        tf.attributedPlaceholder = NSAttributedString(string: "Contact Number", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.keyboardType = .phonePad
        tf.setBottomBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.green
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.keyboardType = .emailAddress
        tf.setBottomBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.green
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.setBottomBorder()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let lblPasswordValidation: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.gray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isPasswordValid = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(inputContainerView)
        view.addSubview(loginBtn)
        view.addSubview(signUpBtn)
        
        setupInputsContainerViewSignIn()
        setupButtonsTop()
        
        self.nameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    
    func setupInputsContainerViewLogin() {
        removeSubViewC()
        
        // x, y, width, heiht constraints
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300).isActive = true
        
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        inputContainerView.addSubview(btnCustom)
        
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        btnCustom.setTitle("SING IN", for: .normal)
        btnCustom.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        btnCustom.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        btnCustom.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        btnCustom.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
    }
    
    func setupInputsContainerViewSignIn() {
        removeSubViewC()
        
        // x, y, width, heiht constraints
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 500).isActive = true
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        inputContainerView.addSubview(lblPasswordValidation)
        inputContainerView.addSubview(phoneTextField)
        inputContainerView.addSubview(btnCustom)
        
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        lblPasswordValidation.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        lblPasswordValidation.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        lblPasswordValidation.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        lblPasswordValidation.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        phoneTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: lblPasswordValidation.bottomAnchor, constant: 12).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: lblPasswordValidation.widthAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
        
        btnCustom.setTitle("CREATE ACCOUNT", for: .normal)
        btnCustom.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        btnCustom.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 50).isActive = true
        btnCustom.widthAnchor.constraint(equalTo: phoneTextField.widthAnchor).isActive = true
        btnCustom.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

    func setupButtonsTop() {
        // x, y, width, heiht constraints
        loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        loginBtn.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -50).isActive = true
        loginBtn.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, multiplier: 0.4).isActive = true
        loginBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        signUpBtn.leftAnchor.constraint(equalTo: loginBtn.rightAnchor).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        signUpBtn.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -50).isActive = true
        signUpBtn.widthAnchor.constraint(equalTo: loginBtn.widthAnchor).isActive = true
        signUpBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        setupLogInBtn()
        setupsignInBtn()
    }
    
    func removeSubViewC() {
        for subUIView in inputContainerView.subviews {
            subUIView.removeFromSuperview()
        }
    }
    
    fileprivate func setupLogInBtn() {
        loginBtn.addTarget(self, action: #selector(btnLoginFn), for: [.touchUpInside])
    }
    
    fileprivate func setupsignInBtn() {
        signUpBtn.addTarget(self, action: #selector(btnSignInFn), for: [.touchUpInside])
    }
    
    @objc func btnLoginFn() {
        loginBtn.backgroundColor = UIColor.green
        signUpBtn.backgroundColor = UIColor.white
        setupInputsContainerViewLogin()
    }
    
    @objc func btnSignInFn() {
        loginBtn.backgroundColor = UIColor.white
        signUpBtn.backgroundColor = UIColor.green
        setupInputsContainerViewSignIn()
    }


    // MARK: - Validation Methods
    func validateText(text: String) -> Bool {
        if text.count > 0 {
            return true
        } else {
            let alertController = UIAlertController(title: "Name Error", message: "The name must have more than one character", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    
    func validateEmail(email: String?) -> String? {
        guard let trimmedText = email?.trimmingCharacters(in: .whitespacesAndNewlines) else { return nil }
        guard let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return nil }
        
        let range = NSMakeRange(0, NSString(string: trimmedText).length)
        let allMatches = dataDetector.matches(in: trimmedText,
                                              options: [],
                                              range: range)
        
        if allMatches.count == 1,
            allMatches.first?.url?.absoluteString.contains("mailto:") == true {
            return trimmedText
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid email address.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return nil
        }
    }
    
    func validatePassword(password: String?) -> Bool {
        var errorMsg = "Password requires at least "
        
        if let txt = passwordTextField.text {
            if (txt.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) {
                errorMsg += "one upper case letter"
            }
            if (txt.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) {
                errorMsg += ", one lower case letter"
            }
            if (txt.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                errorMsg += ", one number"
            }
            if (txt.rangeOfCharacter(from: CharacterSet.symbols) == nil)
                || (txt.rangeOfCharacter(from: CharacterSet.punctuationCharacters) == nil) {
                errorMsg += ", one special characters"
            }
            if txt.count < 8 {
                errorMsg += " and eight characters"
            }
        }
        
        if isPasswordValid {
            return true
        } else {
            let alertController = UIAlertController(title: "Password Error", message: errorMsg, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    func phoneVarification(phone: String) -> Bool {
        if phone.count > 0 && phone.count <= 10 {
            return true
        } else {
            let alertController = UIAlertController(title: "Phone Error", message: "The telephone number must have between 1 to 10 digits", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    
    // MARK: - In-Place Validation Helpers
    func setupAttributeColor(if isValid: Bool) -> [NSAttributedString.Key: Any] {
        if isValid {
            return [NSAttributedString.Key.foregroundColor: UIColor.green]
        } else {
            isPasswordValid = false
            return [NSAttributedString.Key.foregroundColor: UIColor.gray]
        }
    }
    
    func findRange(in baseString: String, for substring: String) -> NSRange {
        if let range = baseString.localizedStandardRange(of: substring) {
            let startIndex = baseString.distance(from: baseString.startIndex, to: range.lowerBound)
            let length = substring.count
            return NSMakeRange(startIndex, length)
        } else {
            print("Range does not exist in the base string.")
            return NSMakeRange(0, 0)
        }
    }


    // Lifting the view up
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = (up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // UITextField Delegates
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let attrStr = NSMutableAttributedString (
            string: "Password must be at least 8 characters, and contain at least one upper case letter, one lower case letter, one number and one special characters.",
            attributes: [
                .font: UIFont.systemFont(ofSize: 11.0),
                .foregroundColor: UIColor.gray
            ])
        
        if let txt = passwordTextField.text {
            isPasswordValid = true
            attrStr.addAttributes(setupAttributeColor(if: (txt.count >= 8)),
                                  range: findRange(in: attrStr.string, for: "at least 8 characters"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil)),
                                  range: findRange(in: attrStr.string, for: "one upper case letter"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil)),
                                  range: findRange(in: attrStr.string, for: "one lower case letter"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil)),
                                  range: findRange(in: attrStr.string, for: "one number"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil) || (txt.rangeOfCharacter(from: CharacterSet.symbols) != nil)),
                                  range: findRange(in: attrStr.string, for: "one special characters"))
        } else {
            isPasswordValid = false
        }
        
        lblPasswordValidation.attributedText = attrStr
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
        switch textField {
        case nameTextField:
            guard (validateText(text: nameTextField.text ?? "")) else {
                return
            }
            break
        case emailTextField:
            guard (validateEmail(email: emailTextField.text) != nil) else {
                return
            }
            break
        case phoneTextField:
            guard phoneVarification(phone: phoneTextField.text ?? "") else {
                return
            }
            break
            
        case passwordTextField:
            guard (validatePassword(password: passwordTextField.text)) else {
                return
            }
            break
        default: break
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
            alpha: alpha
        )
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}


extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.green.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
