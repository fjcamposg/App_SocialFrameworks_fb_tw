//
//  APIUTILS.swift
//  App_SocialFrameworks_fb_tw
//
//  Created by cice on 27/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

func muestraAlerVC(_ titleData: String, messageData : String, titleAction: String) -> UIAlertController{
    let alert = UIAlertController(title: titleData, message:  messageData, preferredStyle : .alert)
    alert.addAction(UIAlertAction(title: titleAction, style: .default, handler: nil))
    return alert
}
