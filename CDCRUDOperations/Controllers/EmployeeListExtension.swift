//
//  EmployeeListExtension.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import Foundation
import UIKit

extension EmployeeList : UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeListCell
        let employee = self.employees![indexPath.row]
        cell.lblEmployeeName.text = employee.name
        cell.imgProfilePicture.image = UIImage(data: (employee.profilePicture) ?? Data())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: SegueIdentifier.navigateToEmployeeDetailView, sender: nil)

    }
    
}
