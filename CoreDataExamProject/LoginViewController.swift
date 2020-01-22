//
//  LoginViewController.swift
//  CoreDataExamProject
//
//  Created by COE-14 on 21/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        let usermail = txtFldEmail.text!
        let password = txtFldPassword.text!
        
        if (usermail == "" || password == "") {
            print("Password or email field empty")
            return
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        request.predicate = NSPredicate(format: "userName = %@", usermail)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try managedContext.fetch(request)
            
            for data in result as! [NSManagedObject] {
                let passwordFromData = data.value(forKey: "userPassword") as! String
                if password == passwordFromData {
                    print("Success")
                }
            }
        } catch let err as NSError {
            print("Could not, \(err), \(err.localizedDescription)")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
