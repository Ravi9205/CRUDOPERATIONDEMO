//
//  DetailsVCExtension.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import Foundation
import UIKit

extension DetailVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img
        
        dismiss(animated: true, completion: nil)
    }
}

