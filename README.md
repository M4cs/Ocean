# Ocean | Supercharge Sileo
#### Created by TeamOcean ( [@maxbridgland](https://twitter.com/maxbridgland), [simalary_ch)](https://twitter.com/simalary_ch), [@midnightchip](https://twitter.com/MidnightChip), [@Muirey03](https://twitter.com/Muirey03), [@EasyZ](/https://twitter.com/_Easy_Z_) )
<p align='center'>
 <a href=""><img width="300px" height="398px" src="https://oceantweak.tk/assets/app/iphone_cover_dark.png" "Preview"></a>
</p>

## What is Ocean?

Ocean is an attempt to bring features we felt were missing from Sileo. **It is not in any way trying to make Sileo better because it's not good. It's simply testing out features that the Sileo team either didn't think of or decided to leave out.** Some features in Ocean may make it into Sileo eventually so if you like any features we add make sure to send feedback to the Sileo team as well. 

Ocean takes an amazing package manager and adds functionality that isn't available with any other tweaks. With Ocean you have the ability to:

### Customize The Color Scheme Of Sileo
<p align='center'>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/WoIIPbg.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/5EZdVQ9.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/KkvZj3O.png"></a>
 <a href=""><img width="182px" height="323.75px" src="https://i.imgur.com/7bPrWEL.png"></a>
</p>

### Export Your Tweaks Easier Than Ever
<p align='center'>
 <a href=""><img width="300px" height="243px" src="https://oceantweak.tk/repo/depictions/Ocean/assets/app/export.jpg"></a>
</p>

### Fix Adding Multiple Repos At Once, Add Unsupported Repositories, and Get Rid Of That Pesky Deprecated Webview Banner!

# How To Install Ocean


### Through Cydia

To install Ocean add our repository to Cydia or Sileo by going to Sources > Edit > Add and typing `https://oceantweak.tk/repo`. Once you add our repository you will be able to search in either package manager and download it! **It is reccommended to install Ocean through Cydia since it tweaks Sileo.**

After installing and respringing make sure to close the Sileo application if it was running in the background. Go to your Settings app and check out some of the configuration settings there. Like any other tweak you'll be able to change your preferences from Settings. Close Sileo after saving settings to ensure things are working (*functionality to close from the Settings pane coming in future builds*).

### Building From Source w/ Theos

To build Ocean from source you will need libCSPreferences and libCSColorPicker libraries to compile. You can get these at CreatureSurvive's repository.

Once you have required libraries clone this repository and run `make package`. This will compile the deb as long as you have your Theos working correctly. If you'd like to install directly to the device be sure to have a correctly configured shell profile with your `THEOS_DEVICE_IP` and `THEOS_DEVICE_PORT` set accordingly. You can then run `make package install` and it will install directly to your device with SSH.
