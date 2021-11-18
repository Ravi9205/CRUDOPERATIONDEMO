//
//  EmployeeManager.swift
//  CDCRUDOperations
//
//  Created by Ravi dwivedi on 13/09/21.
//  Copyright © 2021 Ravi dwivedi. All rights reserved.
//

import Foundation
import CoreData


struct EmployeeManager
{
    private let _employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(employee: Employee) {
        _employeeDataRepository.create(employee: employee)
    }
    
    func fetchEmployee() -> [Employee]? {
        return _employeeDataRepository.getAll()
    }
    
    func fetchEmployee(byIdentifier id: UUID) -> Employee?
    {
        return _employeeDataRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return _employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool {
        return _employeeDataRepository.delete(id: id)
    }
}

