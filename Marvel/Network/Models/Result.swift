//
//	Result.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Result : Codable {

	let comics : Comic?
	let descriptionField : String?
	let events : Comic?
	let id : Int?
	let modified : String?
	let name : String?
	let resourceURI : String?
	let series : Comic?
	let stories : Comic?
	let thumbnail : Thumbnail?
	let urls : [Url]?


	enum CodingKeys: String, CodingKey {
		case comics
		case descriptionField = "description"
		case events
		case id = "id"
		case modified = "modified"
		case name = "name"
		case resourceURI = "resourceURI"
		case series
		case stories
		case thumbnail
		case urls = "urls"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		comics = try Comic(from: decoder)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		events = try Comic(from: decoder)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		series = try Comic(from: decoder)
		stories = try Comic(from: decoder)
		thumbnail = try Thumbnail(from: decoder)
		urls = try values.decodeIfPresent([Url].self, forKey: .urls)
	}


}