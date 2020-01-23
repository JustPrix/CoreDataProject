//
//  ProfileViewController.swift
//  CoreDataExamProject
//
//  Created by COE-14 on 21/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
    var mailOfUser = "antonio@mail.com"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RetrieveData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RetrieveData(){
        guard let appDeleg = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDeleg.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        
        fetchRequest.fetchLimit = 1
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "emailID = %@", mailOfUser)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "userName")!)
                print(data.value(forKey: "userPassword")!)
                print(data.value(forKey: "gender")!)
                print(data.value(forKey: "emailID")!)
            }
        } catch let err as NSError {
            print("Error \(err), \(err.localizedDescription)")
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
