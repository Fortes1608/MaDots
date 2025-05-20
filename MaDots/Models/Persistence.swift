//
//  Persistence.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation

struct Persistence {
    
    private static let userKey = "user_flows"
    private static let tempFlowKey = "tempFlow"
    
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
    
    static func setTemporaryFlow(_ flow: Flow) {
            if let data = try? JSONEncoder().encode(flow) {
                UserDefaults.standard.set(data, forKey: tempFlowKey)
            }
        }

    static func getTemporaryFlow() -> Flow? {
            guard let data = UserDefaults.standard.data(forKey: tempFlowKey),
                  let flow = try? JSONDecoder().decode(Flow.self, from: data) else {
                return nil
            }
            return flow
        }
    
    static func yearsWithFlow() -> [String]{
        let flowList = getFlowList()
        let calendar = Calendar.current
        let years = flowList.map { flow in
            String(calendar.component(.year, from: flow.date))
        }
        let yearsSet = Array(Set(years)).sorted()
            
            return yearsSet
    }
    

    static func monthsWithFlow(year: String) -> [String] {
        let flowList = getFlowList()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM"
        
        let filteredMonths = flowList.compactMap { flow -> String? in
            let flowYear = String(calendar.component(.year, from: flow.date))
            if flowYear == year {
                return formatter.string(from: flow.date)
            }
            return nil
        }
        
        var seen = Set<String>()
        let uniqueMonths = filteredMonths.filter { month in
            if seen.contains(month) {
                return false
            } else {
                seen.insert(month)
                return true
            }
        }
        
        return uniqueMonths
    }

    static func monthNumber(from name: String) -> String? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM" 
        if let date = formatter.date(from: name) {
            let calendar = Calendar.current
            let month = calendar.component(.month, from: date)
            return String(format: "%02d", month)
        }

        return nil
    }

    
    static func DaysWithFlow(year: String, month: String) -> [Day] {
        guard let monthNumber = monthNumber(from: month) else { return [] }

        let flowList = getFlowList()
        let calendar = Calendar.current

        let filteredFlows = flowList.filter { flow in
            let flowYear = String(calendar.component(.year, from: flow.date))
            let flowMonth = String(format: "%02d", calendar.component(.month, from: flow.date))
            return flowYear == year && flowMonth == monthNumber
        }

        let groupedByDay = Dictionary(grouping: filteredFlows) { flow in
            calendar.startOfDay(for: flow.date)
        }

        let days = groupedByDay.map { (date, flows) -> Day in
            Day(flows: flows, date: date)
        }

        return days
    }

}




