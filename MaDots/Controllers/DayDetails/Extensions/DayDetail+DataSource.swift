//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension DayDetailViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    //Nu
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        let allFlows = Persistence.getFlowList()
        
        let today = Date()
        let calendar = Calendar.current

        let todayFlows = allFlows.filter { flow in
            calendar.isDate(flow.date, inSameDayAs: today)
        }
        
        let totalSessions = todayFlows.count
        let totalTimeMinutes = totalSessions * 15 // Cada sessão é 15 minutos
        
        //Individual
        let meditationFlows = todayFlows.filter { $0.category == .Meditation }
        let workFlows = todayFlows.filter { $0.category == .Work }
        let studyFlows = todayFlows.filter { $0.category == .Study }

        // Por exemplo:
//        let workSessions = workFlows.count
//        let workTime = workSessions * 15
        
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
                let largest = max(meditationFlows.count, workFlows.count, studyFlows.count)
                lowerLabel = "\(largest * 15) min"
            default:
                lowerLabel = "-"
            }
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: lowerLabel, image: nil)
            
            return cell
            
        //Revisao geral do categ1
        } else if  indexPath.section == 1 {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
        
        //Revisao geral do categ2
        } else if indexPath.section == 2 {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
        
        //Revisao geral do categ3 (xyz)
        } else {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
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
                    
                case 0: header.configure(with: "08 de Maio de 2025")
                    return header
                case 1: header.configure(with: "Meditation")
                    return header
                case 2: header.configure(with: "Work")
                    return header
                default:header.configure(with: "Study")
                    return header
                    
                }
                
            }
            
            fatalError("Unexpected element kind")
            
        }
}
