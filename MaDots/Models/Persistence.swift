//
//  Persistence.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation
import UIKit


struct Persistence {
    
    private static let userKey = "user_flows"
    private static let tempFlowKey = "tempFlow"
    private static let categoriesKey = "allcategories"
    private static let categoriesSelectedWithColor = "categoriesWithColor"
    
    static func getFlowList() -> [Flow] {
        
        guard let data = UserDefaults.standard.data(forKey: userKey),
              let flows = try? JSONDecoder().decode([Flow].self, from: data) else { return [] }
        return flows
        
    }
    static func clearFlowList() {
        UserDefaults.standard.removeObject(forKey: userKey)
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
    //----- gustavo
    static func saveCategory(category: String) {
        
        var title: [String] = []
        
        returnCategories().forEach { category in
            title.append(category)
        }
        
        title.append(category)
        
        UserDefaults.standard.set(title, forKey: categoriesKey)
        
    }
    
    static func returnCategories() -> [String] {
        
        let allCategories = UserDefaults.standard.value(forKey: categoriesKey) as? [String] ??  ["Meditation","Work","Study","Writing","Reading","Creation","Planning","Art","Exercise","Search","Organization","Design","Code"]
        
        return allCategories
        
    }
    
    static func removeCategory(categoryToRemove: String) {
        
        var allCategories = returnCategories() 
        allCategories.removeAll { category in
            category == categoryToRemove
        }
        
        UserDefaults.standard.set(allCategories, forKey: categoriesKey)

    }
    
    static func savingCategoriesWithColorDict(_ dict: [String: UIColor]) {
        //obs: o NSKeyedArchiver funciona com tipos que conformam NSCoding, ou seja, classes de objective-C/Foundation, enquanto o JSONencoder() é usado para estruturas personalizadas (structs). Ambos fazem o mesmo papel de transformar algum tipo em tipo de dados.
        let dataDict = dict.mapValues { color -> Data in
            return try! NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        }
        
        UserDefaults.standard.set(dataDict, forKey: "categoriesSelectedWithColor")
    }
    
    static func loadCategoriesWithColor() -> [String: UIColor]? {
        
        guard let dataDict = UserDefaults.standard.dictionary(forKey: "categoriesSelectedWithColor") as? [String: Data] else {
            
            return nil
        }
        
        var result: [String: UIColor] = [:]
        for (key, data) in dataDict {
            if let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) {
                result[key] = color
            }
        }
        return result
    }




}




