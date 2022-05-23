//
//  WeatherForecastEntity.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/3/22.
//

import Foundation

// MARK: - WeatherForecastEntity
struct WeatherForecastEntity: Codable {
    var lat, lon: Double?
    var timezone: String?
    var timezoneOffset: Int?
    var daily: [Daily]?
    var hourly: [HourlyForecast]?
}

// MARK: - Daily
struct Daily: Codable {
    var dt, sunrise, sunset, moonrise: Int?
    var moonset: Int?
    var moonPhase: Double?
    var temp: Temp?
    var pressure, humidity: Int?
    var dewPoint, windSpeed: Double?
    var windDeg: Int?
    var windGust: Double?
    var weather: [Weather]?
    var clouds: Int?
    var pop, rain, uvi: Double?
}

// MARK: - Temp
struct Temp: Codable {
    var day: Double?
}

// MARK: - Weather
struct Weather: Codable {
    var icon: String?
    var description: String?
}

// MARK: - HourlyForecast
struct HourlyForecast: Codable {
    var dt: Int?
    var temp, feelsLike: Double?
    var pressure, humidity: Int?
    var dewPoint, uvi: Double?
    var clouds, visibility: Int?
    var windSpeed: Double?
    var windDeg: Int?
    var windGust: Double?
    var weather: [Weather]?
    var pop: Double?
}
