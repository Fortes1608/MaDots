import UIKit

// Agora com rawValue: Int para facilitar comparações
enum DotColor: Int, CaseIterable {
    case red, green, blue

    var uiColor: UIColor {
        switch self {
        case .red: return UIColor.color2
        case .green: return UIColor.color1
        case .blue: return UIColor.color3
        }
    }
}

class DotButton: UIButton {
    var color: DotColor!
    var groupID: Int!
}

var buttonStacks: [UIStackView] = []

class SimplifiedColorPickerViewController: UIViewController {

    var selectedColors: [Int: DotColor] = [:] // groupID -> DotColor

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDotLines(count: 3)
    }

    func setupDotLines(count: Int) {
        for groupID in 0..<count {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 12
            stack.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stack)

            NSLayoutConstraint.activate([
                stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stack.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(120 + groupID * 70))
            ])

            for color in DotColor.allCases {
                let button = DotButton(type: .system)
                button.color = color
                button.groupID = groupID
                button.backgroundColor = color.uiColor
                button.layer.cornerRadius = 20
                button.clipsToBounds = true
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalToConstant: 40).isActive = true
                button.heightAnchor.constraint(equalToConstant: 40).isActive = true
                button.addTarget(self, action: #selector(dotTapped(_:)), for: .touchUpInside)
                stack.addArrangedSubview(button)
            }
        }
    }

    @objc func dotTapped(_ sender: DotButton) {
        let color = sender.color!
        let groupID = sender.groupID!

        // Verifica se outro grupo já usava essa cor
        if let existingGroup = selectedColors.first(where: { $0.value == color && $0.key != groupID }) {
            print("Cor já estava sendo usada pelo grupo \(existingGroup.key), removendo de lá.")
            selectedColors[existingGroup.key] = nil
        }

        // Atualiza a cor do grupo atual
        selectedColors[groupID] = color

        updateButtons()
    }

    func updateButtons() {
        for view in view.subviews where view is UIStackView {
            guard let stack = view as? UIStackView else { continue }
            for case let button as DotButton in stack.arrangedSubviews {
                let groupID = button.groupID!
                let color = button.color!

                if selectedColors[groupID] == color {
                    // A cor está selecionada por este grupo
                    button.alpha = 1.0
                    button.isEnabled = true
                } else if selectedColors.contains(where: { $0.value == color && $0.key != groupID }) {
                    // A cor está em uso por outro grupo
                    button.alpha = 0.3
                    button.isEnabled = true
                } else if selectedColors[groupID] != nil {
                    // O grupo atual tem uma cor selecionada, e esse botão não é ela
                    button.alpha = 0.3
                    button.isEnabled = true
                } else {
                    // O grupo ainda não tem seleção
                    button.alpha = 1.0
                    button.isEnabled = true
                }
            }
        }
    }
}
