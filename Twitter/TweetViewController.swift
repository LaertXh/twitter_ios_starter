//
//  TweetViewController.swift
//  Twitter
//
//  Created by Laert Xhumari on 3/17/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweetButton(_ sender: Any) {
        if(!tweetText.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
   
    @IBOutlet weak var tweetText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetText.becomeFirstResponder()

       
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
