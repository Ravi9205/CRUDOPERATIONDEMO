//
//  DetailVC.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmailId: UITextField!
    
    private let manager = EmployeeManager()
    var selectedEmployee: Employee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetUp()
        // Do any additional setup after loading the view.
    }
    
    func viewWillSetUp()
    {
        self.txtEmployeeName.text = selectedEmployee?.name
        self.txtEmployeeEmailId.text = selectedEmployee?.email
        self.imgProfilePicture.image = UIImage(data: (selectedEmployee?.profilePicture) ?? Data())
    }

    
    // MARK: Update button action
    @IBAction func updateButtonTapped(_ sender: Any)
    {
        let employee = Employee(name: self.txtEmployeeName.text, email: self.txtEmployeeEmailId.text, profilePicture: self.imgProfilePicture.image?.pngData(), id: selectedEmployee!.id)
        
        if(manager.updateEmployee(employee: employee))
        {
            displayAlert(alertMessage: "Record Updated")
        }else
        {
            displayErrorAlert()
        }

    }
    
    // MARK: Delete button action
    @IBAction func deleteButtonTapped(_ sender: Any)
    {
        
        if(manager.deleteEmployee(id: selectedEmployee!.id))
        {
            displayAlert(alertMessage: "Record deleted")
        }
        else
        {
            displayErrorAlert()
        }
    }
    
    // MARK: Select image tap gesture action
    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: Private functions
    private func displayAlert(alertMessage:String)
    {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    private func displayErrorAlert()
    {
        let errorAlert = UIAlertController(title: "Alert", message: "Something went wrong, please try again later", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlert.addAction(okAction)
        self.present(errorAlert, animated: true)
    }
    
    
    
}
