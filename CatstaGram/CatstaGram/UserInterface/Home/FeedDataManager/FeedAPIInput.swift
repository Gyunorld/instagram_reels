//
//  FeedAPIInput.swift
//  CatstaGram
//
//  Created by 김민규 on 9/11/24.
//

struct FeedAPIInput : Encodable { // Encodable --> 데이터를 바꿔서 보내주겠다
    var limit : Int?
    var page : Int?
}
