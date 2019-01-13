# Ocean | Supercharge Sileo
![alt text](https://img.shields.io/badge/iOS-11.0--11.4b3-blue.svg)
![alt text](https://img.shields.io/badge/Version-0.1.0-yellow.svg)
![alt text](https://img.shields.io/badge/Build-Beta-brightgreen.svg)
#### Created by [TeamOcean](https://twitter.com/OceanForSileo) ([@maxbridgland](https://twitter.com/maxbridgland), [simalary_ch](https://twitter.com/simalary_ch), [@midnightchip](https://twitter.com/MidnightChip), [@Muirey03](https://twitter.com/Muirey03), [@EasyZ](/https://twitter.com/_Easy_Z_))
<p align='center'>
 <a href=""><img width="300px" height="398px" src="https://oceantweak.tk/assets/app/iphone_cover_dark.png" "Preview"></a>
</p>

*This Source Code may be more updated than the current stable release*

# What is Ocean?

Ocean is an attempt to bring features we felt were missing from Sileo. Some features in Ocean may make it into Sileo eventually so if you like any features we add make sure to send feedback to the Sileo team as well. 

Ocean takes an amazing package manager and adds functionality that isn't available with any other tweaks. With Ocean you have the ability to:

## Customize The Color Scheme Of Sileo
<p align='center'>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/WoIIPbg.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/5EZdVQ9.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/KkvZj3O.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/7bPrWEL.png"></a>
</p>

## Export Your Tweaks Easier Than Ever
<p align='center'>
 <a href=""><img width="300px" height="243px" src="https://oceantweak.tk/repo/depictions/Ocean/assets/app/export.jpg"></a>
</p>

## Plus
- Fix Adding Multiple Repos At Once
- Add Unsupported Repositories*
- Get Rid Of That Pesky Deprecated Webview Banner
and more to come!

# How To Install Ocean


## Through Cydia or Sileo

To install Ocean add our repository to Cydia or Sileo by going to Sources > Edit > Add and typing `https://oceantweak.tk/repo`. Once you add our repository you will be able to search in either package manager and download it!

After installing and respringing make sure to close the Sileo application if it was running in the background. Go to your Settings app and check out some of the configuration settings there. Like any other tweak you'll be able to change your preferences from Settings. Close Sileo after saving settings to ensure things are working (*functionality to close from the Settings pane coming in future builds*).

## Building From Source w/ Theos

To build Ocean from source you will need libCSPreferences and libCSColorPicker libraries to compile. You can get these at CreatureSurvive's repository.

Once you have required libraries clone this repository and run `make package`. This will compile the deb as long as you have your Theos working correctly. If you'd like to install directly to the device be sure to have a correctly configured shell profile with your `THEOS_DEVICE_IP` and `THEOS_DEVICE_PORT` set accordingly. You can then run `make package install` and it will install directly to your device with SSH.

# Support

Either contact us through Twitter [here](https://twitter.com/OceanForSileo) or open up a GH Issue. Any Issues on the GitHub will most likely be dealt with first and focused on.

# Contributing

If you would like to add features to Ocean feel free to do so by making a fork and creating a Pull Request. If they are good features we will accept them and add them into the next version. 

# Donating

At the moment we have no way of allowing you to donate equally to all of us. If you would like to donate contact one of the developers of the team and we will all split it. Anything is appreciated we could all use some coffee ☕ 🍩
