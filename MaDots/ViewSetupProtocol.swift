import Foundation

protocol ViewSetupProtocol {
    
    func addSubViews()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setup()
    
}

extension ViewSetupProtocol {
    
    func setup() {
        
        addSubViews()
        setupConstraints()
        setupAdditionalConfiguration()
        
    }
    
    func setupAdditionalConfiguration() {}
    
}
