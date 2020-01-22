//
//  RegisterViewController.swift
//  CoreDataExamProject
//
//  Created by COE-14 on 21/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var sgmtGender: UISegmentedControl!
    @IBOutlet weak var citySelect: UIPickerView!
    
    //var people:[NSManagedObject] = []
    //var city:[NSManagedObject] = []
    let arrayGender = ["Male","Female","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let err as NSError {
            print("Could not save. \(err), \(err.userInfo)")
        }
    }
    */
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
        let imgData = UIImageJPEGRepresentation(imgUser.image!, 1.0)!
        let imgString64 = imgData.base64EncodedString(options: .lineLength64Characters)
        let useGender = arrayGender[sgmtGender.selectedSegmentIndex]
        let ID = UUID()
        
        self.save(id: ID, name: txtFldUsername.text!, password: txtFldPassword.text!, email: txtFldEmail.text!, gender: useGender, image: imgString64)
    }
    
    func save(id:UUID, name: String, password:String, email:String, gender:String, image:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)!
        //let cityEntity = NSEntityDescription.entity(forEntityName: "CityTable", in: managedContext)!
        
        let person = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        person.setValue(name, forKey: "userName")
        person.setValue(password, forKey: "userPassword")
        person.setValue(email, forKey: "emailID")
        person.setValue(gender, forKey: "gender")
        person.setValue(image, forKey: "userImage")
        person.setValue(id, forKey: "userID")
        
        do {
            try managedContext.save()
            //people.append(person)
            print("Saved")
        } catch let err as NSError {
            print("Could not save. \(err), \(err.userInfo)")
        }
    }
    
    var imgPicker:UIImagePickerController!
    @IBAction func PickImageOnTapAction(_ sender: UITapGestureRecognizer) {
        
        imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        //self.navigationController?.pushViewController(imgPicker, animated: true)
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage!
        imgUser.image = img
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1//city.count
    }
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        <#code#>
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
