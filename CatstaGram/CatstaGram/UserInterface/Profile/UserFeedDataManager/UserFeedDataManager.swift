//
//  UserFeedDataManager.swift
//  CatstaGram
//
//  Created by 김민규 on 9/11/24.
//

import Alamofire

class UserFeedDataManager {
    // MARK: User 피드 조회 API
    func getUserFeed(_ userID: Int = 2,
                     _ viewController : ProfileViewController){
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil).validate().responseDecodable(of: UserFeedModel.self) { response in
            switch response.result {
            case .success(let result):
//                print(result.count)
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: 게시물 삭제 API
    func deleteUserFeed(_ postIdx: Int,
                     _ viewController : ProfileViewController){
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil).validate().responseDecodable(of: UserFeedModel.self) { response in
            switch response.result {
            case .success(let result):
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
