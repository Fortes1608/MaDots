//
//  Persistence.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation

struct Persistence {
    
    private static let userKey = "user"
    
    var days : [Flow] = []
    
    static func getFlowList() -> Day? {
        
        if let data = UserDefaults.standard.value(forKey: userKey) as? Data{
            do{
                let flowList = try JSONDecoder().decode(Day.self, from: data)
                return flowList
            }
            catch{
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
   static func setFlow(_ flow: Flow) {
        
       var flowList = getFlowList()?.days ?? []
       flowList.append(flow)
       do{
           let data = try JSONEncoder().encode(flowList)
           UserDefaults.standard.set(try? JSONEncoder().encode(flow), forKey: userKey)
       }
       catch{
           print(error.localizedDescription)
       }
   }
    
}




