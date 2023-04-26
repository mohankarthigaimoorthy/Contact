//
//  ViewController.swift
//  pepContact
//
//  Created by Mohan K on 23/02/23.
//

import UIKit


class ContactsView : UITableViewCell {
    
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var phoneTxt: UILabel!
    @IBOutlet weak var emailTxt: UILabel!
    
    
}
class ViewController: UIViewController {

    @IBOutlet weak var contactTable: UITableView!
    var contacts: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contact1 = Contact(name: "john deer", phoneNumber: "9087654345", email: "mine@sampleExample.com")
        let contactt2 = 
        
        contacts.append(contact1)
        contacts.append(contactt2)
        
//        contacts[3].phoneNumber = "8767564657"
        trunk()
    }
    func trunk() {
        contactTable.dataSource = self
        contactTable.delegate = self
        DispatchQueue.main.async {
            self.contactTable.reloadData()

        }
        
    }

}

extension  ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTable.dequeueReusableCell(withIdentifier: "ContactsView", for: indexPath) as!  ContactsView
//        let contact = contacts[Contact]()
        cell.nameTxt.text = contacts?.name
        cell.phoneTxt.text = contacts?.phoneNumber
        cell.emailTxt.text =  contacts?.email
        return cell
         
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
