//
//  FeedUploadModel.swift
//  CatstaGram
//
//  Created by 김민규 on 9/11/24.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
