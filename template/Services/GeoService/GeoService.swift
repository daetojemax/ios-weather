import Foundation

protocol GeoService {

    func requestLocation(resultHandler: @escaping LocationHandler,
                         errorHandler: @escaping StringClosure)
    
    func requestAuthorization()
        
    func serviceAuthorized() -> Bool
    
    func serviceDenied() -> Bool
}
