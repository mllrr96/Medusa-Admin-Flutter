# Medusa Admin For Mobile
Manage your [MedusaJs](https://medusajs.com/) ecommerce store from your mobile phone.

![Alt text](/screenshots/Medusa-Admin-Mobile-Screenshot.png?raw=true)


## Getting Started
Medusa Admin Mobile is built with [Flutter](https://flutter.dev/) with the aim to ease managing ecommerce store that are built using [MedusaJs](https://medusajs.com/), it's available for iOS and Android, it's still in beta so expect to see some bugs/unimplemented features.

## NOTE
I am new to programming so expect to see some old spaghetti code or weird implemetation, I'm glad to take notes from expercined devs and fix my code


## How to use

Make sure to [install flutter](https://docs.flutter.dev/get-started/install) before trying build the app :)

### Building apk or ipa
Change the baseUrl (found in "lib/core/utils/strings.dart" ) to your backend URL
and run the command

For Android
    

    flutter build apk

    
For iOS
    

    flutter build ipa
Note: to build ipa file you need to have a mac

This will build (apk or ipa) file to install on your device
    
### Installing to device

#### For android 
Copy the generated apk file located in "build/app/outputs/flutter-apk/app-release.apk" to your device and install it 

#### For iOS 
TODO

## Features
- [x] View and update store settings ( Regions, Return reasons, sales channels etc)
- [x] View and add new products
- [x] View, add and update collection groups
- [x] View, add and update customers and customer groups
- [x] View, add and update discounts
- [ ] View and add/update pricing list
- [ ] View and add/update gift cards
- [ ] Update products
- [ ] Add and update order
- [ ] Add and update draft order
- [ ] App settings
- [x] Support for light/dark mode
      

## Contributing
TODO







    
