//
//  CarModel.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarModel : Codable {
	let specmetallicPay : Int?
	let prefix : String?
	let bodies : [CarBody]?
	let photo : String?
	let title : String?
	let absentee : Bool?
	let titleRus : String?
	let pearlPay : Int?
	let alias : String?
	let renderPhotos : CarRenderPhotos?
	let metallicPay : Int?
	let model : CarModelType?
	let transportType : TransportType?
	let id : Int?
	let ownTitle : String?
	let brand : CarBrand?
	let minprice : Int?
	let hasSpecialPrice : Bool?
	let premiumPriceSpecials : [String]?
	let count : Int?
	let colorsCount : Int?
	let carId : String?
	let sizesPhotos : SizePhoto?

	enum CodingKeys: String, CodingKey {

		case specmetallicPay = "specmetallicPay"
		case prefix = "prefix"
		case bodies = "bodies"
		case photo = "photo"
		case title = "title"
		case absentee = "absentee"
		case titleRus = "titleRus"
		case pearlPay = "pearlPay"
		case alias = "alias"
		case renderPhotos = "renderPhotos"
		case metallicPay = "metallicPay"
		case model = "model"
		case transportType = "transportType"
		case id = "id"
		case ownTitle = "ownTitle"
		case brand = "brand"
		case minprice = "minPrice"
		case hasSpecialPrice = "hasSpecialPrice"
		case premiumPriceSpecials = "premiumPriceSpecials"
		case count = "count"
		case colorsCount = "colorsCount"
		case carId = "carId"
		case sizesPhotos = "sizesPhotos"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		specmetallicPay = try values.decodeIfPresent(Int.self, forKey: .specmetallicPay)
		prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
		bodies = try values.decodeIfPresent([CarBody].self, forKey: .bodies)
		photo = try values.decodeIfPresent(String.self, forKey: .photo)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		absentee = try values.decodeIfPresent(Bool.self, forKey: .absentee)
		titleRus = try values.decodeIfPresent(String.self, forKey: .titleRus)
		pearlPay = try values.decodeIfPresent(Int.self, forKey: .pearlPay)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		renderPhotos = try values.decodeIfPresent(CarRenderPhotos.self, forKey: .renderPhotos)
		metallicPay = try values.decodeIfPresent(Int.self, forKey: .metallicPay)
		model = try values.decodeIfPresent(CarModelType.self, forKey: .model)
		transportType = try values.decodeIfPresent(TransportType.self, forKey: .transportType)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		ownTitle = try values.decodeIfPresent(String.self, forKey: .ownTitle)
		brand = try values.decodeIfPresent(CarBrand.self, forKey: .brand)
		minprice = try values.decodeIfPresent(Int.self, forKey: .minprice)
		hasSpecialPrice = try values.decodeIfPresent(Bool.self, forKey: .hasSpecialPrice)
		premiumPriceSpecials = try values.decodeIfPresent([String].self, forKey: .premiumPriceSpecials)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		colorsCount = try values.decodeIfPresent(Int.self, forKey: .colorsCount)
		carId = try values.decodeIfPresent(String.self, forKey: .carId)
		sizesPhotos = try values.decodeIfPresent(SizePhoto.self, forKey: .sizesPhotos)
	}

}
