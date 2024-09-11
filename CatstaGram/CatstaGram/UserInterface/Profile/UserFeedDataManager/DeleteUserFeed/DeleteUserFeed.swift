//
//  DeleteUserFeed.swift
//  CatstaGram
//
//  Created by 김민규 on 9/11/24.
//

import Foundation

struct DeleteUserFeed: Decodable {
        let isSuccess: Bool?
        let code: Int?
        let message: String?
        let result: String?
}
