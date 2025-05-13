//
//  DotButton.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 13/05/25.
//
import UIKit

class DotButtonView: UIView {
    
    //Variável do botão redondo
    private lazy var dotComponent: UIButton = {
        var dot = UIButton()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = .red //Cor padrão para saber se não está carregando
        return dot
    }()
    
    var dotColor: UIColor{
        get{dotComponent.backgroundColor ?? .clear}
        set{dotComponent.backgroundColor = newValue}
    }
    
    //MARK: INITS
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder){
        fatalError( "init(coder:) has not been implemented" )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        //Arredondando o botão
        dotComponent.layer.cornerRadius = dotComponent.bounds.height / 2 //Metade da altura
        dotComponent.clipsToBounds = true //Corta fora
    }
}//Fim da classe

extension DotButtonView: ViewSetupProtocol{
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dotComponent.centerXAnchor.constraint(equalTo: centerXAnchor),
            dotComponent.centerYAnchor.constraint(equalTo: centerYAnchor),
            dotComponent.heightAnchor.constraint(equalTo: heightAnchor), // H = H
            dotComponent.widthAnchor.constraint(equalTo: heightAnchor) //W = W
        ])
    }
    
    func addSubViews() {
        addSubview(dotComponent)
    }
    
}//Fim da extension
    

