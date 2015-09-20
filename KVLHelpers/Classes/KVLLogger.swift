//
//  KVLLogger.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/14/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

typealias WHERE = String


/****************************************************************************************/
func GetCodeLocation(file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, col: Int = __COLUMN__) -> WHERE!
{
    return String(format: "%@:%@:(%d,%d)", file.lastPathComponent.stringByDeletingPathExtension, function, line, col)
}


@objc
class KVLLogger
{
    class func printLogMessage(format: String, _ args: CVarArgType...)
    {
        #if DEBUG
            withVaList(args) { NSLogv(format, $0) }
        #endif
    }
    class func printErrorMessage(message: String!, location: WHERE)
    {
        printLogMessage("⛔️ %@ >>> %@", location, message)
    }
    
    class func printSuccessMessage(message: String, location: WHERE)
    {
        printLogMessage("✅ %@ >>> %@", location, message)
    }
    
    class func printNormalMessage(message: String, location: WHERE)
    {
        printLogMessage("➕ %@ >>> %@", location, message)
    }
    
    class func printError(error: NSError!, location: WHERE)
    {
        printErrorMessage(String(format:"Description: %@\nFailureReason: %@\nRecoverySuggestion: %@\nRecoveryOptions: %@\nCode: %zd\nDomain: %@\nUserInfo: %@",
            error.localizedDescription,
            error.localizedFailureReason!,
            error.localizedRecoveryOptions!,
            error.localizedRecoverySuggestion!,
            error.localizedRecoveryOptions!,
            error.code,
            error.domain,
            error.userInfo!), location: location);
    }
    
    class func printException(exception: NSException!, location: WHERE)
    {
        printErrorMessage(String(format:"Name: %@\nReason: %@, stackTrace:%@",
            exception.name,
            exception.reason!,
            exception.callStackSymbols), location: location);
    }
}