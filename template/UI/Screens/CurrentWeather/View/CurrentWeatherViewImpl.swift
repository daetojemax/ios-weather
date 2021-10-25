import UIKit

protocol CurrentWeatherView: UIView {
    func update(with inputData: CurrentWeatherViewInputData)
    func setOnSelect(_ onSelect: @escaping (CityType) -> Void)
}

final class CurrentWeatherViewImpl: UIView, CurrentWeatherView {
    
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfRegion: UITextField!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblRecommend: UILabel!
    
    private let cityPicker = UIPickerView()
    private var onSelect: ((CityType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tfRegion.inputView = cityPicker
        cityPicker.delegate = self
        cityPicker.dataSource = self
        tfRegion.text = "Выберите город"
        lblRecommend.text = "Для начала выберите город"
    }
    
    func update(with inputData: CurrentWeatherViewInputData) {
        lblWeather.text = "\(inputData.weather) ℃"
        tfRegion.text = inputData.city
        imgWeather.setImageByKf(inputData.imageLink, placeholder: nil)
        self.onSelect = inputData.onSelect
        var recommendText = ""
        switch inputData.weather {
            case ..<0:
                recommendText = "Довольно холодно, наденьте шапку"
            case 0...15:
                recommendText = "Приятная погода, наденьте легкую шапку"
            case 15...:
                recommendText = "Очень тепло, надевайте шорты"
            default:
                recommendText = ""
        }
        lblRecommend.text = recommendText
    }
    
    func setOnSelect(_ onSelect: @escaping (CityType) -> Void) {
        self.onSelect = onSelect
    }
}

extension CurrentWeatherViewImpl: UIPickerViewDelegate {
    
}

extension CurrentWeatherViewImpl: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        CityType.allCases.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CityType.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = CityType.allCases[row]
        tfRegion.resignFirstResponder()
        onSelect?(type)
    }
}

struct CurrentWeatherViewInputData {
    let weather: Int
    let city: String
    let onSelect: (CityType) -> Void
    let imageLink: String
}

//- температура меньше 0 градусов;
//- температура от 0 до 15 градусов;
//- температура выше 15 градусов
