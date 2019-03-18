//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Laert Xhumari on 3/9/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var reTweet: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted = false

    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func actionFavTweet(_ sender: Any) {
        let toBeFav = !favorited
        if(toBeFav){
            TwitterAPICaller .client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did nor succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Error unfavoring the tweet: \(error)")
            })
        }
        
    }
    
    @IBAction func actionRetweet(_ sender: Any) {
    
        let checkRetweeted = !retweeted
        if(checkRetweeted){
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(checkRetweeted)
            }, failure: { (error) in
                print("Error in retweet: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(checkRetweeted)
            }, failure: { (error) in
                print("Error in retweet: \(error)")
            })
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if (retweeted){
            reTweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else{
            reTweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
