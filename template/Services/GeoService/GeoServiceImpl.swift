import CoreLocation

class GeoServiceImpl: NSObject {
    
    // MARK: - property

    internal var manager: CLLocationManager!
    internal var locationAuthStatus: CLAuthorizationStatus!
    
    internal var latitude : Double?
    internal var longitude : Double?
    
    internal var locationHandlers: [LocationHandler]!
    internal var errorHandlers: [StringClosure]!
    
    // MARK: - initial
    
    override init() {
        super.init()
        manager = CLLocationManager()
        manager.delegate = self
        manager.distanceFilter = kCLDistanceFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBest
        locationAuthStatus = CLLocationManager.authorizationStatus()
        locationHandlers = [LocationHandler]()
        errorHandlers = [StringClosure]()
    }
    
    internal func notifySuccess(latitude: Double?, longitude: Double?) {
        for (successHandler) in locationHandlers {
            successHandler(latitude, longitude)
        }
        locationHandlers.removeAll()
    }
    
    internal func notifyFailure(error: String) {
        for (errorHandler) in errorHandlers {
            errorHandler(error)
        }
        errorHandlers.removeAll()
    }
}

extension GeoServiceImpl: GeoService {
    
    func requestLocation(resultHandler: @escaping LocationHandler,
                         errorHandler: @escaping StringClosure) {
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        locationHandlers.append(resultHandler)
        errorHandlers.append(errorHandler)
        if !serviceAuthorized() {
            manager.requestWhenInUseAuthorization()
        } else {
            manager.startUpdatingLocation()
        }
    }
    
    func serviceAuthorized() -> Bool {
        if locationAuthStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
            return true
        }
        return locationAuthStatus == .authorizedWhenInUse
    }
    
    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    func serviceDenied() -> Bool {
        return locationAuthStatus == .denied
    }
}

extension GeoServiceImpl: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthStatus = status
        if status == .denied || status == .restricted {
            notifyFailure(error: "Геолокация недоступна. Разрешите доступ к геолокации в настройках")
        }
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager,
                         didUpdateToLocation newLocation: CLLocation,
                         fromLocation oldLocation: CLLocation) {
        manager.stopUpdatingLocation()
        latitude = newLocation.coordinate.latitude
        longitude = newLocation.coordinate.longitude
        notifySuccess(latitude: latitude, longitude: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let newLocation = locations.last else {
            notifySuccess(latitude: latitude, longitude: longitude)
            return
        }
        latitude = newLocation.coordinate.latitude
        longitude = newLocation.coordinate.longitude
        notifySuccess(latitude: latitude, longitude: longitude)
    }
}
