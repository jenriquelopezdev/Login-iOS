//
//  LoginWelcomeViewController.swift
//  geko test
//
//  Created by juan on 19/03/19.
//  Copyright © 2019 Enrique Lopez. All rights reserved.
//

import UIKit
import CoreData

class LoginWelcomeViewController: UIViewController {
    
    let lblName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblEmail: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblPhone: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        self.view.backgroundColor = UIColor.white

        navigationItem.title = "Welcome"
        
        view.addSubview(lblName)
        view.addSubview(lblEmail)
        view.addSubview(lblPhone)
        
        setupView()
        
        lblEmail.text = email ?? ""
        retrieveData(email: email ?? "")
    }
    
    
    func setupView() {
        lblName.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        lblName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lblName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        
        lblEmail.leftAnchor.constraint(equalTo: lblName.leftAnchor).isActive = true
        lblEmail.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 20).isActive = true
        lblEmail.widthAnchor.constraint(equalTo: lblName.widthAnchor).isActive = true
        
        lblPhone.leftAnchor.constraint(equalTo: lblEmail.leftAnchor).isActive = true
        lblPhone.topAnchor.constraint(equalTo: lblEmail.bottomAnchor, constant: 20).isActive = true
        lblPhone.widthAnchor.constraint(equalTo: lblEmail.widthAnchor).isActive = true
    }
    
    func retrieveData(email: String) {
        let email = email.lowercased()
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name") as! String
                let phone = data.value(forKey: "phone") as! String
                
                lblName.text = name
                lblPhone.text = phone
            }
            
        } catch {
            
            print("Failed")
        }
    }
}
