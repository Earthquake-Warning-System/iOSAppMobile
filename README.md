# iOSAppMobile

This App is mobile version, it is used to receive push notification from indoor App when it detected shake.
If you want to receive notification on your mobile phone when indoor phone detect shake, please check  another our project [iOSAppIndoor](https://mwnlgit.ce.ncu.edu.tw/EarthquakeWarningSystem/iOSAppIndoor), you can click scan button on indoor App and QR code button on mobile App to pair these two Apps.

## Prerequisites

* Requires Swift 4/5 and Xcode 10.x
* iPhone required above [iOS10.0](https://support.apple.com/en-us/HT208011) and below iOS13.3.
* iOS10.0 [supported devices](https://en.wikipedia.org/wiki/IOS_10#Supported_devices)

## Installing

Download project from git :
```sh
git clone https://github.com/Earthquake-Warning-System/iOSAppIndoor.git
```
Notice that this project use Firebase to send notification, so you need to build a account in Firebase and create a project for this, basically, you need finish following things.
* put google-services.json into project

If you need tutorial please check  [FCM setup](https://firebase.google.com/docs/iOS/setup)
Open project in Xcode and click build  → make project, then you can run this project.

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

