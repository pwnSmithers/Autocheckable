//
//  CarDetails.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 07/06/2022.
//


import Foundation

// MARK: - CarDetails
struct CarDetails: Codable {
    let damageMedia: [DamageMedia]
    let id: String
    let year: Int
    let insured: Bool
    let mileage: Int
    let vin: String
    let marketplacePrice: Int
    let marketplaceVisible: Bool
    let marketplaceVisibleDate: String
    let isFeatured: Bool
    let imageURL: String
    let model: Model
    let state, country, ownerType, transmission: String
    let fuelType, sellingCondition: String?
    let bodyType: BodyType
    let city: String
    let marketplaceOldPrice: Int
    let createdAt, updatedAt, mileageUnit: String
    let hasWarranty, hasFinancing: Bool
    let interiorColor, exteriorColor, engineType: String
    let gradeScore: Double?
    let installment: Int
    let depositReceived: Bool
    let loanValue: Double
    let websiteURL: String
    let sold, hasThreeDImage: Bool
    let inspectorDetails: InspectorDetails?
    let carName: String
    let financingSettings: FinancingSettings
    let ccMeasurement: String?

    enum CodingKeys: String, CodingKey {
        case  damageMedia, id, year, insured, mileage, vin, marketplacePrice, marketplaceVisible, marketplaceVisibleDate, isFeatured
        case imageURL = "imageUrl"
        case model, state, country, ownerType, transmission, fuelType, sellingCondition, bodyType, city, marketplaceOldPrice, createdAt, updatedAt, mileageUnit, hasWarranty, hasFinancing, interiorColor, exteriorColor, engineType, gradeScore, installment, depositReceived, loanValue
        case websiteURL = "websiteUrl"
        case sold, hasThreeDImage, inspectorDetails, carName, financingSettings, ccMeasurement
    }
}

// MARK: - BodyType
struct BodyType: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

// MARK: - DamageMedia
struct DamageMedia: Codable {
    let inspectionItems: [InspectionItem]
    let name, comment: String?
}

// MARK: - InspectionItem
struct InspectionItem: Codable {
    let medias: [Media]
    let name, comment, response, condition: String
}

// MARK: - Media
struct Media: Codable {
}

// MARK: - FinancingSettings
struct FinancingSettings: Codable {
    let loanCalculator: LoanCalculator
}

// MARK: - LoanCalculator
struct LoanCalculator: Codable {
    let loanPercentage: Double
    let ranges: Ranges
    let defaultValues: DefaultValues
}

// MARK: - DefaultValues
struct DefaultValues: Codable {
    let interestRate, downPayment: Double
    let tenure: Int
}

// MARK: - Ranges
struct Ranges: Codable {
    let minInterestRate, maxInterestRate, minDownPayment, maxDownPayment: Double
    let tenure: Int
}

// MARK: - InspectorDetails
struct InspectorDetails: Codable {
    let inspectedMakes: [InspectedMake]?
    let inspectorFullName: String?
    let totalInspection: Int?
    let profileImageURL: String?

    enum CodingKeys: String, CodingKey {
        case inspectedMakes, inspectorFullName, totalInspection
        case profileImageURL = "profileImageUrl"
    }
}

// MARK: - InspectedMake
struct InspectedMake: Codable {
    let count: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case count, name
        case imageURL = "imageUrl"
    }
}

// MARK: - Model
struct Model: Codable {
    let id: Int
    let name, imageURL, wheelType: String
    let make: BodyType
    let popular: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
        case wheelType, make, popular
    }
}
