//
//  ErrorHandling.swift
//  Makestagram
//
//  Created by Benjamin Encz on 4/10/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import ConvenienceKit
import Parse

/**
 This struct provides basic Error handling functionality.
 */
struct ErrorHandling {
    
    static let ErrorTitle           = "Error"
    static let ErrorOKButtonTitle   = "Ok"
    static let ErrorDefaultMessage  = "Something unexpected happened, sorry for that!"
    
    /**
     This default error handler presents an Alert View on the topmost View Controller
     */
    static func defaultErrorHandler(_ error: NSError) {
        if error.code != 209 {
            ErrorHandling.defaultAlert()
        }
    }
    
    static func defaultAlert() {
        let alert = UIAlertController(title: ErrorTitle, message: ErrorDefaultMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: ErrorOKButtonTitle, style: UIAlertActionStyle.default, handler: nil))
        
        let window = UIApplication.shared.windows[0]
        window.rootViewController?.presentViewControllerFromTopViewController(alert, animated: true, completion: nil)
    }
    

    /**
     A PFBooleanResult callback block that only handles error cases. You can pass this to completion blocks of Parse Requests
     */
    static func errorHandlingCallback(_ success: Bool, error: NSError?) -> Void {
        if let error = error {
            ErrorHandling.defaultErrorHandler(error)
        }
    }
    
}
