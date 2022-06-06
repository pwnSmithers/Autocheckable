//
//  Cars.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation

// MARK: - Cars
struct Cars: Codable {
    let result: [Car]
    let pagination: Pagination
}

// MARK: - Result
struct Car: Codable {
    let id, title: String
    let imageURL: String
    let year: Int
    let city, state: String
    let hasWarranty: Bool
    let marketplacePrice, marketplaceOldPrice: Int
    let hasFinancing: Bool
    let mileage: Int
    let mileageUnit: MileageUnit
    let installment: Double
    let depositReceived: Bool
    let loanValue: Double
    let websiteURL: String
    let stats: Stats
    let bodyTypeID: String
    let sold, hasThreeDImage: Bool
    let transmission: Transmission
    let marketplaceVisibleDate: String
    let sellingCondition: SellingCondition?
    let fuelType: FuelType?
    let gradeScore: Double?
    let licensePlate: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
        case year, city, state, hasWarranty, marketplacePrice, marketplaceOldPrice, hasFinancing, mileage, mileageUnit, installment, depositReceived, loanValue
        case websiteURL = "websiteUrl"
        case stats
        case bodyTypeID = "bodyTypeId"
        case sold, hasThreeDImage, transmission, marketplaceVisibleDate, sellingCondition, fuelType, gradeScore, licensePlate
    }
}

enum FuelType: String, Codable {
    case diesel = "diesel"
    case electric = "electric"
    case hybrid = "hybrid"
    case petrol = "petrol"
}

enum MileageUnit: String, Codable {
    case km = "km"
    case miles = "miles"
}

enum SellingCondition: String, Codable {
    case foreign = "foreign"
    case local = "local"
    case new = "new"
}

// MARK: - Stats
struct Stats: Codable {
    let webViewCount, webViewerCount, interestCount, testDriveCount: Int
    let appViewCount, appViewerCount, processedLoanCount: Int
}

enum Transmission: String, Codable {
    case automatic = "automatic"
    case duplex = "duplex"
    case manual = "manual"
}
