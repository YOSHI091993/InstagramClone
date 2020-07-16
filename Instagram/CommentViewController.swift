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
//        let commentRef = Firestore.firestore().collection(Const.PostPath).document(postId)
//        SVProgressHUD.show()
//
//      let name = Auth.auth().currentUser?.displayName
//
        let commentText = self.commentField.text!
//        let commentData = "\(name!) : \(commentText)"
        
//        let commentData = commentText
        
//        var commentos:String = name + commenter
        
       // 空の文字列型の変数を用意
//       var comment_text:String = ""
//       // 配列
//       let commenter = ["name!", "commentText"]
//       // for文で取り出し
//       for value in commenter {
//         print(value)
//         comment_text += value
//       }
//        print(comment_text)
        
        let updateValue = FieldValue.arrayUnion([commentText])
     
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postId)
//        commentRef?
        postRef.updateData(["comments": updateValue])
//        SVProgressHUD.show()
        
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

    
//    var id:Int?
//    var delegate: touchCellDelegate?
//    var titleLabel = UILabel();
//    
//    func handleTap(gestureRecognizer: UIGestureRecognizer) {
//        self.delegate?.getNo(self.id!)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
