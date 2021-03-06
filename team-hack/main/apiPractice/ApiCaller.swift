//
//  ApiCaller.swift
//  team-hack
//
//  Created by Joey Essak on 5/24/21.
//

import Combine
import Foundation

class APICaller {
    static let sharred = APICaller()
    
    func fetchVideoGames() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promise(.success(["Doom", "wolfenstein 3d","Super Street Fighter 2","Mortal Kombat 2",]))
            }
        }
    }
}
