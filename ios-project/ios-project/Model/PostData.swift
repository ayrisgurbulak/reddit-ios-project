//
//  postData.swift
//  ios-project
//
//  Created by Ayris Gürbulak on 26.01.2022.
//

import Foundation

struct PostData: Decodable {
    let data: postData
}

struct postData: Decodable {
    let children: [Children]
}

struct Children: Decodable {
    let data: ChildrenData
}

struct ChildrenData: Decodable {
    let author_fullname: String?
    let title: String?
    let thumbnail: String?
    let thumbnail_height: Int?
}
