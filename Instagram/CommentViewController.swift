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
//        _ = Auth.auth().currentUser?.displayName
//        let commentDic = [
//            "name": name!,
//            "comments": "",
//            ] as [String : Any]
//            commentRef.updateData(commentDic)
//
        let commentData: String = "name: comments"
        let updateValue = FieldValue.arrayUnion([commentData])
     
        
        let commentRef = Firestore.firestore().collection(Const.PostPath).document(postId)
        commentRef.updateData(["comments": updateValue])
        SVProgressHUD.show()
        
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
