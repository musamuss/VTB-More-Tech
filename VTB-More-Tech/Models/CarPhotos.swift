//
//  CarPhotos.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarPhotos : Codable {
	let wagon : CarPhoto?
	let sedan : CarPhoto?
	let liftbek : CarPhoto?
	let hatchback : CarPhoto?

	enum CodingKeys: String, CodingKey {

		case wagon = "wagon"
		case sedan = "sedan"
		case liftbek = "liftbek"
		case hatchback = "hatchback"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wagon = try values.decodeIfPresent(CarPhoto.self, forKey: .wagon)
		sedan = try values.decodeIfPresent(CarPhoto.self, forKey: .sedan)
		liftbek = try values.decodeIfPresent(CarPhoto.self, forKey: .liftbek)
		hatchback = try values.decodeIfPresent(CarPhoto.self, forKey: .hatchback)
	}

}
