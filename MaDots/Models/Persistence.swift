//
//  Persistence.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation

struct Persistence {
    
    private static let userKey = "user_flows"
    
    static func getFlowList() -> [Flow] {
        guard let data = UserDefaults.standard.data(forKey: userKey),
              let flows = try? JSONDecoder().decode([Flow].self, from: data) else {
            return []
        }
        return flows
    }
    
    static func setFlow(_ flow: Flow) {
        var flowList = getFlowList()
        flowList.append(flow)
        
        do{
            let data = try JSONEncoder().encode(flowList)
            UserDefaults.standard.set(data, forKey: userKey)
        } catch {
            print("Error saving data")
        }
        
    }
    
    
    
}




