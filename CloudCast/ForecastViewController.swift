//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Katelyn Norton on 9/24/23.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var forecastImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        selectedForecastIndex = max(0, selectedForecastIndex - 1)
        configure(with: forecasts[selectedForecastIndex])
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1)
        configure(with: forecasts[selectedForecastIndex])
    }
    
    
    private var forecasts = [WeatherForecast]() // tracks all the possible forecasts
    private var selectedForecastIndex = 0 // tracks which forecast is being shown, defaults to 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let fakeData = WeatherForecast(temperature: 25.0, date: Date(), weatherCode: .partlyCloudy)
      //configure(with: fakeData)
        forecasts = createMockData()
        configure(with: forecasts[selectedForecastIndex])
    }
    //private func configure(with forecast: WeatherForecast) {
      //forecastImageView.image = forecast.weatherCode.image
      //descriptionLabel.text = forecast.weatherCode.description
      //temperatureLabel.text = "\(forecast.temperature)°F"
      //let dateFormatter = DateFormatter()
      //dateFormatter.dateFormat = "MMMM d, yyyy"
      //dateLabel.text = dateFormatter.string(from: forecast.date)
    //}
    
    private func createMockData() -> [WeatherForecast] {
            // This is just using the Calendar API to get a few random dates
            let today = Date()
            var dateComponents = DateComponents()
            dateComponents.day = 1
            let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
            let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
            // Create a few mock data to show
            let mockData1 = WeatherForecast(
                                            temperature: 59.5,
                                            date:today, weatherCode: .violentRainShowers)
            let mockData2 = WeatherForecast(
                                            temperature: 65.5,
                                            date: tomorrow,weatherCode: .fog)
            let mockData3 = WeatherForecast(
                                            temperature: 49.5,
                                            date: dayAfterTomorrow,weatherCode: .partlyCloudy)
            return [mockData1, mockData2, mockData3]
        }
        private func configure(with forecast: WeatherForecast) {
            forecastImageView.image = forecast.weatherCode.image
                descriptionLabel.text = forecast.weatherCode.description
                temperatureLabel.text = "\(forecast.temperature)°F"
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM d, yyyy"
                dateLabel.text = dateFormatter.string(from: forecast.date)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
