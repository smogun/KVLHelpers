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
public func GetCodeLocation(file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, col: Int = __COLUMN__) -> WHERE!
{
    return String(format: "%@:%@:(%d,%d)", file.lastPathComponent.stringByDeletingPathExtension, function, line, col)
}


/*
IMPORTANT! in order for this class to print there is a need to add DEBUG flag:
           POD project -> Buld settings -> Seift compiler - Custom Flags -> other Swift Flags -> Debug -> add "-DDEBUG"
           See example projects for help.
*/
@objc
public class KVLLogger
{
    public class func printLogMessage(format: String, _ args: CVarArgType...)
    {
        #if DEBUG
            withVaList(args) { NSLogv(format, $0) }
        #endif
    }
    public class func printErrorMessage(message: String!, location: WHERE)
    {
        printLogMessage("⛔️ %@ >>> %@", location, message)
    }
    
    public class func printSuccessMessage(message: String, location: WHERE)
    {
        printLogMessage("✅ %@ >>> %@", location, message)
    }
    
    public class func printNormalMessage(message: String, location: WHERE)
    {
        printLogMessage("➕ %@ >>> %@", location, message)
    }
    
    public class func printError(error: NSError!, location: WHERE)
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
    
    public class func printException(exception: NSException!, location: WHERE)
    {
        printErrorMessage(String(format:"Name: %@\nReason: %@, stackTrace:%@",
            exception.name,
            exception.reason!,
            exception.callStackSymbols), location: location);
    }
}