//
//  ContactViewController.swift
//  UITableView.1
//
//  Created by 1 on 25/1/24.
//


import UIKit

class ContactViewController: UIViewController, UITableViewDataSource {
   
    
    var Contacts: [Contact] = []
    private lazy var cellID = "cell"
    
    
    private lazy var contactLable: UILabel = MakerView().makeLabel(text: "My Contackts", textSize: 16, textWeigt: .bold)
    
    private lazy var simpleTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTable()
        setupLabel()
        setupData()
    }
    
    private func setupLabel() {
        view.addSubview(contactLable)
        
        NSLayoutConstraint.activate([
            contactLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            contactLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTable() {
        
        view.addSubview(simpleTableView)
        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        simpleTableView.dataSource = self
        
        simpleTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            simpleTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            simpleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            simpleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            simpleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
        ])
        
    }
        private func setupData() {
             Contacts = [
             Contact(image: "1", name: "Aibek", phoneNumber: "+996 703 999 999"),
             Contact(image: "2", name: "Said", phoneNumber: "+996 500 111 111"),
             Contact(image: "3", name: "Talasov", phoneNumber: "+996 700 000 000"),
             Contact(image: "4", name: "Taky", phoneNumber: "+996 222 222 222"),
             Contact(image: "5", name: "Mukhammad", phoneNumber: "+996 123 456"),
             Contact(image: "6", name: "Rusay", phoneNumber: "+996 987 987"),
             Contact(image: "7", name: "Dagny", phoneNumber: "+996 300 300"),
             Contact(image: "8", name: "Dahny Wolf", phoneNumber: "+996 500 000"),
             Contact(image: "9", name: "Nazif", phoneNumber: "+996 220 220 220"),
             Contact(image: "10", name: "Nazgul", phoneNumber: "+996 100 100 100"),
             Contact(image: "1", name: "Adyl", phoneNumber: "+996 701 202 100"),
             Contact(image: "2", name: "Mira", phoneNumber: "+996 700 201 102"),
             Contact(image: "3", name: "Aldamchy", phoneNumber: "+996 202 502 552"),
             Contact(image: "4", name: "Make", phoneNumber: "+996 202 555 288"),
             Contact(image: "5", name: "Kuke", phoneNumber: "+996 202 266 772"),
             Contact(image: "6", name: "Aigyl", phoneNumber: "+996 555 999 999"),
             Contact(image: "7", name: "Gulzada", phoneNumber: "+996 205 202 992"),
             Contact(image: "10", name: "Ainazik", phoneNumber: "+996 505 333 552"),
             Contact(image: "9", name: "Nazif", phoneNumber: "+996 505 333 552"),
             Contact(image: "1", name: "Aidana", phoneNumber: "+996 505 333 552"),
             Contact(image: "8", name: "Guljan", phoneNumber: "+996 505 333 552"),
             ]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                
                guard indexPath.row < Contacts.count else {
                    return cell
                }
                
                let contact = Contacts[indexPath.row]
            
                cell.textLabel?.text = contact.name
                cell.detailTextLabel?.text = contact.phoneNumber
                cell.imageView?.image = UIImage(named: contact.image)
                
                return cell
            }
 

}
