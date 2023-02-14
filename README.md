# Dungeons and Dragons Character Creator

A character creator for players of Dungeons and Dragons

##Features

* Users able to create accounts and login
* Characters are stored for the user to access and see the name, race, class, and alignment
* Users are able to create new characters

**Note**: Currently the only features available to users are creating and accessing the characters name, race, and alignment. Updates will be made in the future to hold full character sheets.

##Dependencies

The character creator relies on:
* Google Firebase
    * Firebase
    * Auth
    * Firestore
    
##Environment Set-up

###XCode Installation

From Apple Documentation: XCode is a continous integration and delivery service built into Xcode and designed expressly for Apple developers. 
XCode is available for free form the App Store

###Google Firebase

This project currently is registered with Firebase as an iOS App, so there is no need to create a new database. In order to use Firebase, the developer will need to use the GoogleService-Info.plist file associated with the project and save it to the root of the project (this contains secret keys and will not be available on github).

