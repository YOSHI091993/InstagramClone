//
//  CommentViewController.swift
//  Instagram
//
//  Created by 吉和　匠 on 2020/07/06.
//  Copyright © 2020 SHO Yoshiwa. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    var postId: String = ""
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func handleCommentButton(_ sender: Any) {

        let commentText = self.commentField.text!

        let name = Auth.auth().currentUser?.displayName
        
        let commenter = "\(name!) : \(commentText)"
        
        let updateValue = FieldValue.arrayUnion([commenter])
     
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postId)

//        var comment_text:String = ""
//        
//        // 配列
//      
//        // for文で取り出し
//        for value in commenter {
//          print(value)
//          comment_text += value
//        }
//         print(comment_text)
        
        postRef.updateData(["comments": updateValue])
        
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
                   
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    print("DEBUG_PRINT: \(postId)")
    }
    
 
    @IBAction func handleCommentCancelButton(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
