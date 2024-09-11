//
//  UserFeedModel.swift
//  CatstaGram
//
//  Created by 김민규 on 9/11/24.
//

import Foundation

struct UserFeedModel : Decodable {
    
        let isSuccess : Bool?
        let code : Int?
        let message : String?
        let result : UserFeedModelResult?
}

struct UserFeedModelResult: Decodable {
    let _isMyFeed : Bool?
    let userInfo : GetUserInfo?
    let getUserPosts: [GetUserPosts]?
}

struct GetUserInfo: Decodable {
        let userIdx: Int?
        let nickName: String?
        let name: String?
        let profileImgUrl: String?
        let website: String?
        let introduction: String?
        let followerCount: Int?
        let followeeCount: Int?
        let postCount: Int?
}

struct GetUserPosts: Decodable {
        let postIdx: Int?
        let postImgUrl: String?
}
