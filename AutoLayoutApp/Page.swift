//
//  Page.swift
//  AutoLayoutApp
//
//  Created by Даниил on 30.08.2023.
//

import UIKit

struct Page {
    
    let imageName: String
    let headerText: String
    let bodyText: String
    
}

enum Pages {
    static let pages = [
        Page(
            imageName: "bear_first",
            headerText: "Join us today in out fun and games!",
            bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."
        ),
        Page(
            imageName: "heart_second",
            headerText: "Subscribe and get coupons on out daily events",
            bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."
        ),
        Page(
            imageName: "leaf_third",
            headerText: "VIP members special services",
            bodyText: ""
        ),
        Page(
            imageName: "bear_first",
            headerText: "Join us today in out fun and games!",
            bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."
        ),
        Page(
            imageName: "heart_second",
            headerText: "Subscribe and get coupons on out daily events",
            bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."
        ),
        Page(
            imageName: "leaf_third",
            headerText: "VIP members special services",
            bodyText: ""
        ),
    ]
}
