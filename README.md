
# TransferMoney
Swift sample app demonstrating TransferMoney module using View Interactor Presenter architecture for iOS. See [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture/) for more info.

### Description

The app downloads transaction Status from [API](https://api.myjson.com/bins/ijot2) and presents result on a TransactionStatusViewController.
Step1.On InputAmountViewController enter valid amount to enable Submit button.
Step2.On click of Submit button,[API](https://api.myjson.com/bins/ijot2) will call with get method using Alomofire POD.Just for sample I am  also sending parameters.
Step3.After returning of JSON is serializing using objectMapper POD and Passing the object of MoneyTransferResponse to the TransactionStatusViewController to present the result.


I started by using the excellent VIP templates from Raymond Law via [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture/) .


### Demo

<image src="documentation/demo.gif" width=316 height=590/>
<image src="documentation/EnterAmount.png" width=316 height=590/>
<image src="documentation/StatusScreen.png" width=316 height=590/>

### Requirements

* [Xcode 9.3](http://adcdownload.apple.com/Developer_Tools/Xcode_9/Xcode_9.zip)
* [CocoaPods v1.1.0rc2](https://github.com/CocoaPods/CocoaPods/releases/tag/1.1.0.rc.2)


### Environment

iOS 9.0+

### Libraries & submodules

PODS
* [Alomofire v4.4](https://cocoapods.org/pods/Alamofire) "Alamofire is an HTTP networking library written in Swift."

* [ObjectMapper v2.3](https://cocoapods.org/pods/Alamofire)"ObjectMapper is a framework written in Swift that makes it easy for you to convert your model objects (classes and structs) to and from JSON."

* [PKHUD v5.5](https://cocoapods.org/pods/Alamofire) "A Swift based reimplementation of the Apple HUD"


### Usage

You won't need [CocoaPods](https://cocoapods.org) to run the project but if you do run into issues you can install dependencies as follows:

    pod install

**Note.** If you get don't have CocoaPods installed you can install it using Ruby Gems as follows:

	gem install cocoapods --version 1.1.0rc2


### Configuration

The `TransferMoney` target should be used for running the project.


### Documentation

The source code files are documented using Xcode 9.3's built in code documentation support for Swift.

## Contributing

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

### Maintainers

* [Vishal Singh](ivishalsingh1986@gmail.com)

## Contact
* [Vishal Singh](ivishalsingh1986@gmail.com)

## License

`TransferMoney` is released under the MIT License.

