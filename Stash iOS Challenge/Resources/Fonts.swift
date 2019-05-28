//
//  Fonts.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import UIKit

extension UIFont {
    
    // Stash font from Brand Guide (source: https://media.quickframe.com/profile/assets/Stash/1480539403_BrandGuide_11.28.pdf)
    class func LatoLightFontOfSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Light", size: size)!
    }
    class func LatoRegularFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size)!
    }
    
    class func LatoBoldFontOfSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size)!
    }
    
    class func LatoBlackFontOfSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Black", size: size)!
    }
    
}

// Family: Lato Font names: ["Lato-Regular", "Lato-Hairline", "Lato-HairlineItalic", "Lato-LightItalic", "Lato-Italic", "Lato-Bold", "Lato-BoldItalic", "Lato-Black", "Lato-Light", "Lato-BlackItalic"]

// Get the list of fonts available to your app (source: Apple)
//    for family in UIFont.familyNames.sorted() {
//    let names = UIFont.fontNames(forFamilyName: family)
//    print("Family: \(family) Font names: \(names)")
//    }
