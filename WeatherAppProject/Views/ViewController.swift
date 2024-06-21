//
//  ViewController.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/7/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -Outlets
    
    @IBOutlet weak var loadingContainerView: UIView!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var rainDropLabel: UILabel!
    @IBOutlet weak var airPressureLabel: UILabel!
    @IBOutlet weak var weatherCityLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var weatherDegreeLabel: UILabel!
    
    @IBOutlet weak var todayButtonOutlet: UIButton!
    
    @IBOutlet weak var theOtherDaysButtonOutlet: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var todaysInfoContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var otherDaysContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: CollectionViewDataSource!
    private var tableViewData: TableViewDataSource!
    
    private var weatherdata: WeatherForecastEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData()
       
        
        LocationHelper.getAddressFromLatLon(pdblLatitude: "30.4872", withLongitude: "-97.7233") { [weak self] address in
            self?.weatherCityLabel.text = address
        }
    }

    @IBAction func todaysWeatherButton(_ sender: Any) {
        todaysInfoContainerView.isHidden = false
        otherDaysContainerView.isHidden = true
    }
    
    @IBAction func otherDaysWeatherButton(_ sender: Any) {
        todaysInfoContainerView.isHidden = true
        otherDaysContainerView.isHidden = false
    }
    
    @IBAction func addNewPlace(_ sender: Any) {
        if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddLocationViewController") as? AddLocationViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        fetchData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        
    }
}


private extension ViewController {
    
    private func setupUI() {
        dataSource = .init(collectionView: collectionView)
        dataSource.delegate = self
        tableViewData = .init(tableView: tableView)
        
        todaysInfoContainerView.isHidden = false
        otherDaysContainerView.isHidden = true
        
        
    }
    private func convertToFahrenheit(Kelv : Double) -> Double {
        let celcius = Kelv - 273.15
        return (celcius * 9/5) + 32
    }
    
    private func fillExtraInfo(model : Daily) {
        rainDropLabel.setAttrText(title: "Rain", value: "\(model.rain ?? 0)kg/m\n")
        windSpeedLabel.setAttrText(title: "Wind", value: "\(model.windSpeed ?? 0)km/s\n")
        airPressureLabel.setAttrText(title: "Pressure", value: "\(model.pressure ?? 0)mb\n")
    }
    
    private func showLoadingView() {
        DispatchQueue.main.async {
            self.scrollView.isHidden = true
            self.loadingContainerView.isHidden = false
            self.indicatorView.startAnimating()
        }
    }
    
    private func hideLoadingView() {
        DispatchQueue.main.async {
            self.scrollView.isHidden = false
            self.loadingContainerView.isHidden = true
            self.indicatorView.stopAnimating()
        }
    }
    
    private func fetchData() {
        showLoadingView()
        // Makes a request to fetch weather data using
        ApiRequestHandler.request { result in
            self.hideLoadingView()
            //Switches on the result of the API request. If the request is successful, it stores the fetched data in a property called weatherdata.
            switch result {
            case let .success(data):
                self.weatherdata = data
                if let hourlyData = data.hourly {
                    var viewModels: [TimeZoneViewModel] = []
              //Iterates over the first 24 items in hourlyData
                    for (index, item) in hourlyData.prefix(24).enumerated() {
                        viewModels.append(.init(
                            hour: "\(DateHelper.formatToAmPm(item.dt ?? 0))",
                            imageUrl: nil,
                            degree: "\(String(format: "%.0f", self.convertToFahrenheit(Kelv: item.temp ?? 0)))",
                            isFocused: index == 0
                            
                        ))
                    }
                    
                    self.dataSource.setItems(viewModels)
                    
                    DispatchQueue.main.async {
                        self.weatherDegreeLabel.text = "\(viewModels.first?.degree ?? "")℉"
                        self.weatherConditionLabel.text = hourlyData .first?.weather?.first?.description?.capitalized
                    }
                }
                
                if let dailyData = data.daily?.first {
                    DispatchQueue.main.async {
                        self.fillExtraInfo(model: dailyData)
                    }
                }
                
                if var daily = data.daily, !daily.isEmpty {
                    daily.remove(at: 0)
                    var viewModels: [OtherDaysInfoModel] = []
                    
                    viewModels = daily.prefix(6).map{ .init(dayName: DateHelper.formatDateToDay($0.dt ?? 0), dailyDegree: "\(String(format: "%.0f", self.convertToFahrenheit(Kelv: $0.temp?.day ?? 0)))", weatherImage: "") }
                    
                    DispatchQueue.main.async {
                        self.tableViewData.addItems(viewModels)
                    }
                }
                
            case let .failure(error):
                break
            }
        }
    }
}

extension ViewController: CollectionViewDataSourceDelegate {
    
    func didClickItem(at index: Int) {
        if let data = weatherdata, let hourly = data.hourly {
            var viewModels: [TimeZoneViewModel] = []
      
            for (i, item) in hourly.prefix(24).enumerated() {
                viewModels.append(.init(
                    hour: "\(DateHelper.formatToAmPm(item.dt ?? 0))",
                    imageUrl: nil,
                    degree: "\(String(format: "%.0f", self.convertToFahrenheit(Kelv: item.temp ?? 0)))",
                    isFocused: i == index
                    
                ))
            }
            
            self.dataSource.setItems(viewModels)
            
            self.weatherDegreeLabel.text = "\(String(format: "%.0f", self.convertToFahrenheit(Kelv: hourly[index].temp ?? 0)))"
            self.weatherConditionLabel.text = hourly[index].weather?.first?.description?.capitalized
        }
    }
}

//This code fetches weather data, processes it into view models, and updates the UI accordingly. It also handles user interactions with the collection view, updating the displayed weather details based on the selected item.
