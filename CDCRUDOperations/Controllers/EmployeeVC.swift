//
//  EmployeeVC.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import UIKit

class EmployeeVC: UIViewController , UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmailId: UITextField!
    private let manager: EmployeeManager = EmployeeManager()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createButtonTapped(_ sender: Any) {
        let employee = Employee(name: txtEmployeeName.text, email: txtEmployeeEmailId.text, profilePicture: imgProfilePicture.image?.pngData(), id: UUID())
        
        manager.createEmployee(employee: employee)
        self.performSegue(withIdentifier: SegueIdentifier.navigateToEmployeeList, sender: nil)
    }
    
    
    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
