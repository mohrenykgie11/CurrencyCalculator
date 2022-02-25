//
//  Readme.md
//  CurrencyConverter
//
//  Created by Morenikeji on 2/25/22.
//  Copyright © 2022 Morenikeji. All rights reserved.
//

ABOUT THE PROJECT
Currency Calculator converts a base currency value against any selected currency. For this project, EUR is the only accessible base currency as other currencies have been restricted. 

INSTALLATION
For the third party framework, I installed SwiftyJSON(reading and parsing JSON data from API/Server), Alamofire(HTTP Networking Library), RealmSwift(For managing core data), IQKeyboardManagerSwift(Prevents keyboard sliding up and covering UITextField/UITextView), SVProgressHUD(Loader/Progress) and Chart(Chart modelling with saved data). All these with pod init and install.

FOLDERS
I used MVP(Model-View-Presenter) architecture.

Model folder contains object and data structure used by the presenter.

Presenter folder contains Converter View Controller, Cell Controller and PickerView Controller where all the logics happen.
 
View folder contains all the .xib files for the above controllers.

SupportingFiles folder contains other folders like Alert, Network, Extension, and assets
    -Network folder contains network/http calls and error handling.

    -Alert folder contains reusable alert.
    
    -Extension folder contains reusable alert and functions.

