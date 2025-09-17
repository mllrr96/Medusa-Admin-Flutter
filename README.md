# Medusa Admin Mobile
Manage your [MedusaJs](https://medusajs.com/) v2 ecommerce store from your mobile phone.


## Getting Started
Medusa Admin Mobile is built with [Flutter](https://flutter.dev/) with the aim to ease managing ecommerce store that are built using [MedusaJs](https://medusajs.com/). This version adds support for Medusa v2.
It's available for iOS and Android. This app is currently in beta, so expect to see some bugs and unimplemented features.

## Screenshots
<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/sign-in-1.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/sign-in-2.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/sign-in-3.png" width="220"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/order-1.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/order-2.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/search-1.png" width="220"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/product-1.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/product-2.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/product-3.png" width="220"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/region-1.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/region-2.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/region-3.png" width="220"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/promotion-1.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/promotion-2.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/promotion-3.png" width="220"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/search-2.png" width="220"/>
            </td>            
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/search-3.png" width="220"/>
            </td>
            <td style="text-align: center">
                <img src="https://github.com/mllrr96/Medusa-Admin-Flutter/blob/main/screenshots/draft-order-2.png" width="220"/>
            </td>
        </tr>
    </table>
</div>

## Known Issues & Not Implemented
This beta version has some limitations. The following features are not yet implemented or are known to have issues:
- **Creating:**
  - Orders
  - Products
  - Promotions
  - Campaigns
  - Price Lists
  - Regions
- **Viewing:**
  - Order details
  - Region details
  - Tax regions
  - Locations
  - Shipping details
  - Workflows
- **Other:**
  - Metadata (add/update/read)
  - Importing orders

## Installation

### Android
Download the latest apk file from [releases](https://github.com/mllrr96/Medusa-Admin-Flutter/releases) and install it on your phone.

### iOS
You need to sideload the latest ipa file found in [releases](https://github.com/mllrr96/Medusa-Admin-Flutter/releases) to your iPhone, checkout [Sideloadly](https://sideloadly.io/) or [AltStore](https://altstore.io/) for more info about sideloading.

### How to connect the app to your MedusaJs backend
- Open the app and click on set URL, then enter your MedusaJs backend URL (e.g. https://your-backend-url.com) and click on save
- Enter your email and password and click on sign in

**Note:** Currently, only the JWT (email and password) sign-in method is supported. Cookie-based authentication is not yet implemented.

##  Build it yourself
Add [Flutter](https://docs.flutter.dev/get-started/install) to your machine

Open this project folder with Terminal/CMD and run the following command
```
flutter packages get
```
then 
```
flutter pub run build_runner build
```
Optional: change the baseUrl (found in "lib/core/constant/strings.dart") to your backend URL, you can change baseUrl from inside the app

This project uses firebase analytics, so you need to connect your firebase to this project, check [Firebase documentation](https://firebase.google.com/docs/flutter/setup?platform=ios) & [Firebase Crashlytics](https://firebase.google.com/docs/crashlytics/get-started?platform=flutter) for more info

- To run the app on Android just run the following command in the root directory of the project:
```
flutter run
```
- or to build apk 
```
flutter build apk
```

- To run the app on iOS just run the following command in the root directory of the project: (macOS only)
```
flutter run
```
- or to build ipa
```
flutter build ipa
```

## Contributing
We welcome contributions from the community to make Medusa Admin even better. If you want to contribute, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch and make your changes.
3. Submit a pull request, explaining the purpose of your changes.


## License

All the code available under the MIT license. See [LICENSE](LICENSE).




    
