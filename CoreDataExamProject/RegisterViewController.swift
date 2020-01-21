//
//  RegisterViewController.swift
//  CoreDataExamProject
//
//  Created by COE-14 on 21/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var sgmtGender: UISegmentedControl!
    @IBOutlet weak var citySelect: UIPickerView!
    
    var people:[NSManagedObject] = []
    var city:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnRegister(_ sender: Any) {
        /*
        guard let nameToSave = txtFldUsername.text else {
            return
        }
        */
        //self.save
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)!
        //let cityEntity = NSEntityDescription.entity(forEntityName: "CityTable", in: managedContext)!
        
        let person = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        person.setValue(name, forKey: "userName")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        <#code#>
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
