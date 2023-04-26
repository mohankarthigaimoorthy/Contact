//
//  oneViewController.swift
//  pepContact
//
//  Created by Mohan K on 23/02/23.
//

import UIKit
struct Contact {
    var name : String
    var phoneNumber : String
    var email : String
}

class profile : UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
}
class oneViewController: UIViewController {
    var contacts: [Contact(name: "john deer", phoneNumber: "9087654345", email: "mine@sampleExample.com")]
    var selectedContact: Contact?
    @IBOutlet weak var contactView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contact1 =
        let contactt2 = Contact(name: "miechalebilly", phoneNumber: "8989765433", email: "renew@sampleExample.com")
        
        contacts.append(contact1)
        contacts.append(contactt2)
        
     track()
        // Do any additional setup after loading the view.
    }
    
    func track() {
        contactView.dataSource = self
        contactView.delegate = self
        DispatchQueue.main.async {
            self.contactView.reloadData()
        }
    }

}

extension oneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! profile
        let contacte = contacts[indexPath.row]
        cell.nameLbl.text = contacte.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = contacts[indexPath.row]
        
        self.performSegue(withIdentifier: "mine", sender: self)
        DispatchQueue.main.async {
            self.contactView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mine "
        { let viewController = segue.destination as!
            ViewController
            viewController.contacts = selectedContact
        }
    }
}
