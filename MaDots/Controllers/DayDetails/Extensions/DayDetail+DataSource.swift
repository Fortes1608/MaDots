//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension DayDetailViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let categories = UserDefaults.standard.value(forKey: "selectedItens") as? [String] ?? []
        return 1 + categories.count
    }
    
    //Nu
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        let categories = UserDefaults.standard.value(forKey: "selectedItens") as? [String] ?? []
        let dicColor = Persistence.loadCategoriesWithColor() ?? [:]
        
        let allFlows = Persistence.getFlowList()
        
        let today = Date()
        let calendar = Calendar.current
        
        
        let todayFlows = allFlows.filter { flow in
            calendar.isDate(flow.date, inSameDayAs: today)
        }
        
        let uniqueCategories: [CategoriesType] = categories.compactMap { CategoriesType(rawValue: $0) }
        
        func getFlows(for section: Int) -> [Flow] {
            if section == 0 {
                return todayFlows // seção geral
            } else {
                guard (section - 1) < uniqueCategories.count else { return [] }
                let category = uniqueCategories[section - 1]
                return todayFlows.filter { $0.category == category }
            }
        }
        
        let totalSessions = todayFlows.count
        let totalTimeMinutes = totalSessions * 15 // Cada sessão é 15 minutos
        
        //Revisao geral do dia em si
        if indexPath.section == 0 {
            
            let upperLabels = ["Time","Sections","Largest Single Focus"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
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
            
            let dot = DotButtonView()
            dot.dotColor = .blue
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerLabel, image: nil )
            
            return cell
            
        //Revisao geral das categorias (1, 2, 3...)
        } else {
            let upperLabels = ["Total Time", "Sections", "Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            let flowsForThisSection = getFlows(for: indexPath.section)
            let totalCategorySessions = flowsForThisSection.count
            let totalCategoryTime = totalCategorySessions * 15
            
            var lowerLabel = ""
            var dotCount = 0
            var dotColor: UIColor? = nil
            
            switch labelForCell {
            case "Total Time":
                lowerLabel = "\(totalCategoryTime) min"
            case "Sections":
                lowerLabel = "\(totalCategorySessions)"
            case "Dots":
                lowerLabel = "\(totalCategorySessions)"
                dotCount = totalCategorySessions
                if (indexPath.section - 1) < categories.count {
                    let catString = categories[indexPath.section - 1]
                    dotColor = dicColor[catString] ?? .systemBlue
                }
            default:
                lowerLabel = "-"
            }
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerLabel, image: nil, dotCount: dotCount, dotColor: dotColor)
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

                let categories = UserDefaults.standard.value(forKey: "selectedItens") as? [String] ?? []
                
                if indexPath.section == 0 {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
                    formatter.locale = Locale(identifier: "pt_BR")
                    header.configure(with: formatter.string(from: Date()))
                } else {
                    let categoryIndex = indexPath.section - 1
                    if categoryIndex < categories.count {
                        header.configure(with: categories[categoryIndex])
                    } else {
                        header.configure(with: "-")
                    }
                }
                
                return header
            }
            
            fatalError("Unexpected element kind")
            
        }
}
