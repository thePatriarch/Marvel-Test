//
//	Comic.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Comic : Codable {

	let available : Int?
	let collectionURI : String?
	let items : [Item]?
	let returned : Int?


	enum CodingKeys: String, CodingKey {
		case available = "available"
		case collectionURI = "collectionURI"
		case items = "items"
		case returned = "returned"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		available = try values.decodeIfPresent(Int.self, forKey: .available)
		collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
		items = try values.decodeIfPresent([Item].self, forKey: .items)
		returned = try values.decodeIfPresent(Int.self, forKey: .returned)
	}


}