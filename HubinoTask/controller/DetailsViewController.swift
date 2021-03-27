//
//  DetailsViewController.swift
//  HubinoTask
//
//  Created by Greens on 10/03/21.
//  Copyright © 2021 Greens. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    var getdata : [NSManagedObject] = []

    //MARK: OUTLET
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cpmobileLabel: UILabel!
    @IBOutlet weak var contactpersonLable: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mobilenoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = getContext()
               
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
                   do{
                       getdata = try context.fetch(fetchRequest) as! [NSManagedObject]
                       print("****Get the Data*****")
                       print(getdata)
                       } catch {
                           print("error")  }
                       
    }
    func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
       return appDelegate.persistentContainer.viewContext
    }
    
}
