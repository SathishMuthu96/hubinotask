//
//  ViewController.swift
//  HubinoTask
//
//  Created by Greens on 10/03/21.
//  Copyright © 2021 Greens. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var parse = Parser()
    var personDetails = [results]()
    var firstNameArray = [String]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
         print("hello")
        parse.parsing{
            (content) in
            //print("content----->",content)
            self.personDetails = content
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    for index in content
                    {
                        self.firstNameArray.append(index.firstname!)
                    }
                    
            }
       // parse.parsing(completionhandler: [results])
        }
        print("PersonDetails---->",personDetails)
        //print("persondetails-->",personDetails)
        saveData()
    }



func getContext() -> NSManagedObjectContext
   {
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       return  appDelegate.persistentContainer.viewContext
   }
func saveData() {
    //let context = getContext()
    //let datasaved = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
    for show in  firstNameArray{
  //   datasaved.setValue(personDetails[indexPath.row].id, forKey: "id")
//   datasaved.setValue(personDetails[indexPath.row].firstname, forKey: "firstname")
//   datasaved.setValue(personDetails[indexPath.row].lastname, forKey: "lastname")
//   datasaved.setValue(personDetails[indexPath.row].birthday, forKey: "birthday")
//   datasaved.setValue(personDetails[indexPath.row].age, forKey: "age")
//   datasaved.setValue(personDetails[indexPath.row].email, forKey: "email")
//   datasaved.setValue(personDetails[indexPath.row].mobileno, forKey: "mobileno")
//   datasaved.setValue(personDetails[indexPath.row].address, forKey: "address")
//   datasaved.setValue(personDetails[indexPath.row].contactperson, forKey: "contactperson")
//   datasaved.setValue(personDetails[indexPath.row].cpmobileno, forKey: "cpmobileno")
        let datasaved = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)

        datasaved.setValue(show, forKey: "firstname")
        
    }
   do {
       try context.save()
   } catch{}
    print("*****Data Saved******")
     print(datasaved)
}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = personDetails[indexPath.row].firstname
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsVc", sender: self)
    }
    
}
