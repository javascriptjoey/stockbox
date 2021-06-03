//
//  ApiCall.swift
//  team-hack
//
//  Created by Joey Essak on 5/26/21.
//
import Combine
import Foundation

class ApiCall {
    static let sharred = APICaller()
    
    func fetchUsers() -> Future <[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() ){
                promise(.success([""]))
            }
            
        }
    }
}
