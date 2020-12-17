//
//  ContactNewTVC.swift
//  iOS5-LeDang-Pham
//
//  Created by Kim on 17.12.20.
//

import UIKit

class ContactNewTVC: UITableViewController, UITextFieldDelegate {
    
    var myAddressBook: AddressBook? = nil
    //var newCard:AddressCard? = nil
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - View Will Disappear
    override func viewWillDisappear(_ animated: Bool) {
        if let newcard = createCard() {
//            self.newCard = newcard
            myAddressBook?.add(card: newcard)
        }
        
    }
    
    // MARK: - Table view data source
    
    // MARK: - Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //TODO: maybe add sections for hobbies, friends?
    }
    
    // MARK: - Number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        switch section{
//        case 0 : return 5
//        case 1 : return hobbies?.count ?? 0
//        case 2 : return friends?.count ?? 0
//        default: return 1
//        }
        return 5
    }

    // MARK: - Cell per row
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Only general details
        let cell = tableView.dequeueReusableCell(withIdentifier: "newDetail", for: indexPath) as! GeneralDetailTVCell
        
        cell.infoText.delegate = self
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.infoLabel.text = "Firstname"
            cell.infoText.text = ""
        case 1:
            cell.infoLabel.text = "Lastname"
            cell.infoText.text = ""
        case 2:
            cell.infoLabel.text = "Street"
            cell.infoText.text = ""
        case 3:
            cell.infoLabel.text = "Post Code"
            cell.infoText.text = ""
        case 4:
            cell.infoLabel.text = "City"
            cell.infoText.text = ""
        default: break
        }
        return cell
        
        
      //TODO: maybe add hobbies and friends here too..?
        
    }
    
    // MARK: - Header for sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return ""
//        } else if section == 1 {
//            return "Hobbies"
//        } else if section == 2 {
//            return "Friends"
//        } else {
//            return ""
//        }
        
        return ""
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    func createCard() -> AddressCard? {
        let cellFirstname = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! GeneralDetailTVCell
        let cellLastname = tableView.cellForRow(at: IndexPath(row: 1,section: 0)) as! GeneralDetailTVCell
        let cellStreet = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! GeneralDetailTVCell
        let cellPostcode = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! GeneralDetailTVCell
        let cellCity = tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as! GeneralDetailTVCell
        
        var firstname:String = ""
        var lastname:String = ""
        var street:String = ""
        var postCode:Int = 0
        var city:String = ""
        if let fname = cellFirstname.infoText.text {
            firstname = fname
        }
        if let lname = cellLastname.infoText.text {
            lastname = lname
        }

        if let newstreet = cellStreet.infoText.text {
            street = newstreet
        }

        if let plz = cellPostcode.infoText.text {
            postCode = Int(plz) ?? 0
        }
        if let newcity = cellCity.infoText.text {
            city = newcity
        }

        let brandnewCard = AddressCard(firstName: firstname, lastName: lastname, street: street, postCode: postCode, city: city)
        return brandnewCard
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//            if let controller = segue.destination as? ContactDetailTVC {
//                controller.card = newCard
//            }
        
    }
    
    
    // Make keyboard hide after user hit enter after changing textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
