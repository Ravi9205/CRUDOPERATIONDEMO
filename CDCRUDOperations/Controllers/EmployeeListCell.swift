//
//  EmployeeListCell.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import UIKit

class EmployeeListCell: UITableViewCell {
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblEmployeeName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
