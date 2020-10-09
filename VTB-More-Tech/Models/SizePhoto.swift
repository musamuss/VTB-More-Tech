//
//  SizePhoto.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct SizePhoto : Codable {
	let width250 : String?
	let width220 : String?

	enum CodingKeys: String, CodingKey {

		case width250 = "width250"
		case width220 = "width220"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		width250 = try values.decodeIfPresent(String.self, forKey: .width250)
		width220 = try values.decodeIfPresent(String.self, forKey: .width220)
	}

}
