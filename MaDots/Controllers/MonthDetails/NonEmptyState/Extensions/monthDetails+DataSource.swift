//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension MonthDetailsViewController: UICollectionViewDataSource {
    
    // Helper to get flow list for the month
    private var daysWithFlow: [Day] {
        guard let year = self.year, let month = self.month else { return [] }
        return Persistence.DaysWithFlow(year: year, month: month)
    }
    
    private var allFlowsInMonth: [Flow] {
        return daysWithFlow.flatMap { $0.flows }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 5
        case 1: return 3
        default: return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        let allFlows = self.allFlowsInMonth
        let activeDaysCount = self.daysWithFlow.count
        let totalSessions = allFlows.count
        let totalTime = totalSessions * 15 // minutes

        // Calculations
        let groupedByCategory = Dictionary(grouping: allFlows, by: { $0.category })
        let bestCategory = groupedByCategory.max { $0.value.count < $1.value.count }?.key.rawValue ?? "-"
        
        let groupedByDay = Dictionary(grouping: allFlows, by: { Calendar.current.startOfDay(for: $0.date) })
        let bestDayCount = groupedByDay.values.map { $0.count }.max() ?? 0
        let bestDayTime = bestDayCount * 15
        
        var bestDayDateStr = "-"
        if let bestDate = groupedByDay.max(by: { $0.value.count < $1.value.count })?.key {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd"
            bestDayDateStr = formatter.string(from: bestDate)
        }
        
        let activeMean = activeDaysCount > 0 ? totalTime / activeDaysCount : 0
        
        if indexPath.section == 0 {
            
            let upperLabels = ["Category", "Time", "Total Sessions", "Focus Day", "Maximum Sessions"]
            let lowerLabel = [
                bestCategory,
                "\(totalTime) min",
                "\(totalSessions)",
                bestDayDateStr,
                "\(bestDayTime) min"
            ]
            
            let labelForCell = upperLabels[indexPath.item]
            let lowerlabelForCell = lowerLabel[indexPath.item]
            
            var singleDotColor: UIColor? = nil
            if labelForCell == "Category" {
                if let dicColor = Persistence.loadCategoriesWithColor() {
                    singleDotColor = dicColor[bestCategory] ?? .systemBlue
                }
            }
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerlabelForCell, image: nil, singleDotColor: singleDotColor)
            return cell
            
        } else if indexPath.section == 1 {
            
            let upperLabels = ["Sections", "Total Time", "Active Days"]
            let lowerLabel = [
                "\(totalSessions)",
                "\(totalTime) min",
                "\(activeDaysCount)"
            ]
            let labelForCell = upperLabels[indexPath.item]
            let lowerlabelForCell = lowerLabel[indexPath.item]
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerlabelForCell, image: nil)
            return cell
            
        } else if indexPath.section == 2 {
            
            var firstSectionStr = "-"
            if let firstDate = allFlows.min(by: { $0.date < $1.date })?.date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM dd"
                firstSectionStr = formatter.string(from: firstDate)
            }
            
            let hoursPerWeek = (totalTime / 60) / 4 // Approx 4 weeks
            
            let upperLabels = ["First Section", "Active Mean", "Sequence of Days", "Hours per week"]
            let lowerLabels = [
                firstSectionStr,
                "\(activeMean) min/day",
                "\(activeDaysCount)", // Approx
                "\(hoursPerWeek)h"
            ]
            let labelForCell = upperLabels[indexPath.item]
            let lowelabelForCell = lowerLabels[indexPath.item]
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowelabelForCell, image: nil)
            return cell
            
        } else {
            // Simplified analytics
            let upperLabels = ["Best Week", "Most Focus Time", "Day of Week", "More continuous focus"]
            
            let maxDailySessionsStr = "\(bestDayTime) min"
            
            // Try to figure out best day of week
            let groupedByWeekday = Dictionary(grouping: allFlows) { flow -> String in
                let formatter = DateFormatter()
                formatter.dateFormat = "EEEE"
                return formatter.string(from: flow.date)
            }
            let bestWeekday = groupedByWeekday.max { $0.value.count < $1.value.count }?.key ?? "-"
            
            let lowerLabels = [
                "-", 
                maxDailySessionsStr,
                bestWeekday,
                maxDailySessionsStr
            ]
            
            let labelForCell = upperLabels[indexPath.item]
            let lowelabelForCell = lowerLabels[indexPath.item]
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowelabelForCell, image: nil)
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath ) -> UICollectionReusableView {
            
            if kind == UICollectionView.elementKindSectionHeader {
                
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderCollectionView.reuseIdentifier, for: indexPath ) as! HeaderCollectionView
                
                switch indexPath.section {
                case 0: header.configure(with: "Highlights of \(self.month ?? "the month")")
                    return header
                case 1: header.configure(with: "Full Focus")
                    return header
                case 2: header.configure(with: "Consistence and Rhythm")
                    return header
                default:header.configure(with: "Time Patterns")
                    return header
                }
                
            }
            fatalError("Unexpected element kind")
        }
}
