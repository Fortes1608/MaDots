//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension MonthDetailsViewController: UICollectionViewDataSource {
    
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
        
        let allFlows = Persistence.getFlowList()
        let calendar = Calendar.current
        let today = Date()
        let monthFlows = allFlows.filter { calendar.isDate($0.date, equalTo: today, toGranularity: .month) }
        
        // Math helpers
        let totalSessions = monthFlows.count
        let totalMonthlyTime = totalSessions * 15
        
        // Top Category
        let groupedByCategory = Dictionary(grouping: monthFlows, by: { $0.category.rawValue })
        let topCategory = groupedByCategory.max(by: { $0.value.count < $1.value.count })?.key ?? "-"
        let topCategoryTime = (groupedByCategory[topCategory]?.count ?? 0) * 15
        
        // Active Days & Focus Day
        let groupedByDay = Dictionary(grouping: monthFlows) { calendar.startOfDay(for: $0.date) }
        let activeDaysCount = groupedByDay.count
        let topFocusDayEntry = groupedByDay.max(by: { $0.value.count < $1.value.count })
        let maxSessionsOnFocusDay = topFocusDayEntry?.value.count ?? 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        let focusDayString = topFocusDayEntry != nil ? dateFormatter.string(from: topFocusDayEntry!.key) : "-"
        
        // Timeline helpers
        let earliestDate = monthFlows.min(by: { $0.date < $1.date })?.date
        let earliestDateString = earliestDate != nil ? dateFormatter.string(from: earliestDate!) : "-"
        let activeMean = activeDaysCount > 0 ? (totalMonthlyTime / activeDaysCount) : 0
        let hoursPerWeek = (Double(totalMonthlyTime) / 60.0) / 4.3
        
        // Weekly & Patterns
        let groupedByWeek = Dictionary(grouping: monthFlows) { calendar.component(.weekOfMonth, from: $0.date) }
        let topWeek = groupedByWeek.max(by: { $0.value.count < $1.value.count })?.key
        let topWeekString = topWeek != nil ? "Week \(topWeek!)" : "-"
        
        let groupedByWeekday = Dictionary(grouping: monthFlows) { calendar.component(.weekday, from: $0.date) }
        let topWeekday = groupedByWeekday.max(by: { $0.value.count < $1.value.count })?.key
        var topWeekdayString = "-"
        if let topW = topWeekday {
            // Calendar weekday is 1-based starting from Sunday. weekdaySymbols is also 0-indexed corresponding to same.
            let formatter = DateFormatter()
            if topW - 1 < formatter.weekdaySymbols.count && topW > 0 {
                topWeekdayString = formatter.weekdaySymbols[topW - 1]
            }
        }
        
        let groupedBySchedule = Dictionary(grouping: monthFlows) { flow -> String in
            let hour = calendar.component(.hour, from: flow.date)
            switch hour {
            case 0..<12: return "Morning"
            case 12..<18: return "Afternoon"
            default: return "Night"
            }
        }
        let topSchedule = groupedBySchedule.max(by: { $0.value.count < $1.value.count })?.key ?? "-"
        
        if indexPath.section == 0 {
            let upperLabels = ["Category", "Time", "Total", "Focus Day", "Maximum Sessions"]
            let lowerLabel = [topCategory, "\(topCategoryTime) min", "\(totalMonthlyTime) min", focusDayString, "\(maxSessionsOnFocusDay)"]
            
            let labelForCell = upperLabels[indexPath.item]
            let lowerlabelForCell = lowerLabel[indexPath.item]
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerlabelForCell, image: nil)
            return cell
            
        } else if indexPath.section == 1 {
            let upperLabels = ["Sections", "Total Time", "Active Days"]
            let lowerLabel = ["\(totalSessions)", "\(totalMonthlyTime) min", "\(activeDaysCount)"]
            
            let labelForCell = upperLabels[indexPath.item]
            let lowerlabelForCell = lowerLabel[indexPath.item]
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerlabelForCell, image: nil)
            return cell
            
        } else if indexPath.section == 2 {
            let upperLabels = ["First Section", "Active Mean", "Sequence of Days", "Hours per Week"]
            let lowerLabels = [earliestDateString, "\(activeMean) min", "\(activeDaysCount)", String(format: "%.1f h", hoursPerWeek)]
            
            let labelForCell = upperLabels[indexPath.item]
            let lowelabelForCell = lowerLabels[indexPath.item]
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowelabelForCell, image: nil)
            return cell
            
        } else {
            let upperLabels = ["Best Week", "Schedule with More Focus", "Day of Week", "More Continuous Focus"]
            let lowerLabels = [topWeekString, topSchedule, topWeekdayString, "\(maxSessionsOnFocusDay)"]
            
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
                case 0: header.configure(with: "Highlights of the Month")
                    return header
                case 1: header.configure(with: "Full Focus")
                    return header
                case 2: header.configure(with: "Consistency and Rhythm")
                    return header
                default:header.configure(with: "Time Patterns")
                    return header
                }
                
            }
            fatalError("Unexpected element kind")
        }
    
}
