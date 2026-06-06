//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension DayDetailViewController: UICollectionViewDataSource {
    
    private var uniqueCategories: [CategoriesType] {
        guard let day = self.day else { return [] }
        var categories: [CategoriesType] = []
        for flow in day.flows {
            if !categories.contains(flow.category) {
                categories.append(flow.category)
            }
        }
        return categories
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 + uniqueCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        let todayFlows = self.day?.flows ?? []
        let categories = uniqueCategories
        
        func getFlows(for section: Int) -> [Flow] {
            if section == 0 {
                return todayFlows // general section
            } else {
                let category = categories[section - 1]
                return todayFlows.filter { $0.category == category }
            }
        }
        
        let flowsForThisSection = getFlows(for: indexPath.section)
        let totalSessions = flowsForThisSection.count
        let totalTimeMinutes = totalSessions * 15 // Each session is 15 minutes
        
        // General day review
        if indexPath.section == 0 {
            let upperLabels = ["Time", "Sections", "Largest Single Focus"]
            let labelForCell = upperLabels[indexPath.item]
            
            var lowerLabel = ""
            switch labelForCell {
            case "Time":
                lowerLabel = "\(totalTimeMinutes) min"
            case "Sections":
                lowerLabel = "\(totalSessions)"
            case "Largest Single Focus":
                let grouped = Dictionary(grouping: todayFlows, by: { $0.category })
                let largest = grouped.values.map { $0.count }.max() ?? 0
                lowerLabel = "\(largest * 15) min"
            default:
                lowerLabel = "-"
            }
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerLabel, image: nil )
            return cell
            
        // Category review
        } else {
            let upperLabels = ["Total Time", "Sections", "Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            var lowerLabel = ""
            var image: UIImage? = nil
            
            switch labelForCell {
            case "Total Time":
                lowerLabel = "\(totalTimeMinutes) min"
            case "Sections":
                lowerLabel = "\(totalSessions)"
            case "Dots":
                lowerLabel = "\(totalSessions)"
                // Optionally map image dots appropriately, simulating UI:
                // image = UIImage(named: "bolaazul") -> leaving nil to fallback or configuring dot color below?
            default:
                lowerLabel = "-"
            }
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerLabel, image: image)
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

                let categories = uniqueCategories
                
                if indexPath.section == 0 {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
                    formatter.locale = Locale(identifier: "en_US") // Fallback
                    let dateString = day != nil ? formatter.string(from: day!.date) : "Today"
                    header.configure(with: dateString)
                } else {
                    header.configure(with: categories[indexPath.section - 1].rawValue)
                }
                
                return header
            }
            
            fatalError("Unexpected element kind")
        }
}
