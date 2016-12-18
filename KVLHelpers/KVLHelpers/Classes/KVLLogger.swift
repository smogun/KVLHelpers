//
//  KVLLogger.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/14/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public typealias WHERE = String


/****************************************************************************************/
public func GetCodeLocation(_ file: String = #file, function: String = #function, line: Int = #line, col: Int = #column) -> WHERE!
{
    return String(format: "%@:%@:(%d,%d)", file.lastPathComponent!.stringByDeletingPathExtension!, function, line, col)
}


/*
IMPORTANT!  in order for this class to print, there is a need to add DEBUG flag in build settings for debug scheme.
If installed from pods, this has to be done in POD target:
(POD project -> Buld settings -> Swift compiler - Custom Flags -> other Swift Flags -> Debug -> add "-DDEBUG")
Since POD target is being assembled by pod install, pod file has to include "post_install" script (see example projects).
*/
@objc
open class KVLLogger: NSObject
{
    open class func printLogMessage(_ format: String, _ args: CVarArg...)
    {
        /* Enable DEBUG to make it be disabled for release scheme*/
        //#if DEBUG
            withVaList(args) { NSLogv(format, $0) }
        //#endif
    }
    open class func printErrorMessage(_ message: String?, location: WHERE?)
    {
        printLogMessage("⛔️ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    open class func printWarningMessage(_ message: String?, location: WHERE?)
    {
        printLogMessage("⚠️ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    open class func printSuccessMessage(_ message: String?, location: WHERE?)
    {
        printLogMessage("✅ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    open class func printNormalMessage(_ message: String?, location: WHERE?)
    {
        printLogMessage("➕ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    open class func printError(_ error: NSError?, location: WHERE?)
    {
        if (error == nil)
        {
            return;
        }
        
        let localizedRecoveryOptions:AnyObject? = error!.localizedRecoveryOptions as AnyObject?
        let userInfo:AnyObject? = error!.userInfo as AnyObject?
        
        printErrorMessage(String(format:"Description: %@\nFailureReason: %@\nRecoverySuggestion: %@\nRecoveryOptions: %@\nCode: %zd\nDomain: %@\nUserInfo: %@",
            error!.localizedDescription,
            error!.localizedFailureReason == nil ? "" : error!.localizedDescription,
            (error!.localizedRecoverySuggestion == nil ? "" : error!.localizedRecoverySuggestion)!,
            localizedRecoveryOptions == nil ? "" : localizedRecoveryOptions as! String,
            error!.code,
            error!.domain,
            userInfo == nil ? "" : userInfo as! NSDictionary), location: location == nil ? "" : location!);
    }
    
    open class func printException(_ exception: NSException?, location: WHERE?)
    {
        if (exception == nil)
        {
            return;
        }
        printErrorMessage(String(format:"Name: %@\nReason: %@, stackTrace:%@",
            exception!.name as CVarArg,
            exception!.reason!,
            exception!.callStackSymbols), location: location == nil ? "" : location!);
    }
}
