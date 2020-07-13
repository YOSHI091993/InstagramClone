//
//  PostData.swift
//  Instagram
//
//  Created by 吉和　匠 on 2020/06/12.
//  Copyright © 2020 SHO Yoshiwa. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comments: [String] = []
//    var comments: String?
    var isCommented: Bool = false
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        
        let postDic = document.data()
        
        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        
        if let myid  = Auth.auth().currentUser?.uid {
            if self.likes.firstIndex(of: myid) != nil {
                self.isLiked = true
            }
        }
        
        if let comments = postDic["comments"] as? [String] {
            self.comments = comments
        }
        
//        self.comments = postDic["comments"] as? String
        
        if let myid = Auth.auth().currentUser?.uid {
            if self.comments.firstIndex(of: myid) != nil {
                self.isCommented = true
            }
        }
    }
}
