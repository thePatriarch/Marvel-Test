//
//	Item.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Item : Codable {

	let name : String?
	let resourceURI : String?
	let type : String?


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case resourceURI = "resourceURI"
		case type = "type"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}


}