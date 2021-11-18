//
//  EmployeeList.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import UIKit

class EmployeeList: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!
    
    private let manager = EmployeeManager()
    var employees : [Employee]? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Employees List"
        employees = manager.fetchEmployee()
        if(employees != nil && employees?.count != 0)
        {
            self.tblEmployee.reloadData()
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == SegueIdentifier.navigateToEmployeeDetailView)
        {
            let detailsView = segue.destination as? DetailVC
            guard detailsView != nil else { return }
        }
    }

    

}
