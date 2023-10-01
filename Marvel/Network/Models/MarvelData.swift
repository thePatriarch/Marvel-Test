//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct MarvelData : Codable {

	let count : Int?
	let limit : Int?
	let offset : Int?
	let results : [Result]?
	let total : Int?


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case limit = "limit"
		case offset = "offset"
		case results = "results"
		case total = "total"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
		results = try values.decodeIfPresent([Result].self, forKey: .results)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}


}
