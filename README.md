# Continuous Integration using Travis CI and Fastlane
This repository has a project example that has Unit and UI tests files that can be used to setup a continuous integration ambient, with a pass-by-pass commit section explaning how to integrate Travis CI and Fastlane platforms to your project.
------

### Initial Setup

First of all make sure you already created a XCode project that has Unit and UI tests, and that you added the UI Scheme to the project. If you haven't done that already, follow the instructions below, but if you already have created the project and the targets you can go to the step 2.

1. If you're creating a new project right now just select the `Include Unit Tests` and `Include UI Tests` when the options for a new project appear on the screen, althought, if you alredy have a project and wants to add the targets to it, you should do the steps below:
```
XCode -> File -> New -> Target -> iOS UI Testing Bundle
XCode -> File -> New -> Target -> iOS Unit Testing Bundle 
```

2. After you created the target for your project you need to add the `UI Test scheme` and configure it to `run`.
```
XCode -> Product -> Scheme -> New Scheme
```
3. Now you should select the target of your ```UI Test``` and a new scheme will be created in your project, you should do a similar path to edit this new scheme you just created
```
XCode -> Product -> Scheme -> Edit Scheme
```
4. The XCode should have openned a new window where you need to select the UI Target you just created, then you need to go to the `build tab` and check the `run` box, and after this your project will be ready for the upcomming steps.

-----

### Travis CI Setup

The praparation of this enviroment is quite simple, but there are a few things to remenber if you're using the free version of Travis. One of the most importants is that you can only use `public repositories` while using the free version, or you can use the `free trial` that offers you 100 builds for 2 projects at a time. If you want to know more about the this check this link: https://docs.travis-ci.com/user/travis-ci-for-private/.

1. You need to go to https://travis-ci.org and link you Travis account to your GitHub account, so you will be able to acces wall your repositories from there. 
#### (If you're using the free version the only repositories that will be displayed in your dashboard are the public ones.)

2. After creating your account you should be able to see in the `Settings` session all your GitHub repositories. Search for the one you wants to use and turn on the checkbox to enable Travis CI monitorament.

3. In the terminal, go to the projects folder and create a new file called `.travis.yml`, here is the command line i used
```
touch .travis.yml
```
after creating this file you need to cofigure this file with a script that is going to be read by the Travis CI server once you makes the push in the GitHub repo. Below is the configuration i used for this project, if anything is different in your setup you'll need to change the lines below. If you want to check Travis CI site for diferent ways to configure your file this is the link: https://docs.travis-ci.com/user/tutorial/

Now open the file (_i use sublime but you can use whatever text editor you want_)
```
sublime .travis.yml
```
and put this setup code inside it, remember to change the system and projects specification for the ones you are using.
```
os: osx
osx_image: xcode10.1
language: swift
script: 
  - xcodebuild clean build test -workspace ContinuousIntegrationProject.xcworkspace -scheme "ContinuousIntegrationProject" -sdk iphonesimulator
```
5. Now your project is ready to be commited, and once you make the push the Travis will be triggered and will start to run the Unit tests you created and the results will be displayed in your dashboard, where you can access various information about the `Builds History`, the `Branches` and a lot more.

### Fastlane Setup

The fastlane is where most of the "magic" happens. The setup is also quite simple, but we will need to do some "tricks" for it to work properly. So follow my steps bellow carefully to make sure everything is in place.

0. The zero step for this setup is to know if the path of your xcodebuild, because if it is in somewhere diferent than what i'm going to show, the fastlane init will not be able to run the UI Tests of your code. That being sad, go back to the terminal and run the line
```
xcode-select -p
```
if the printed path is different from _/Applications/Xcode.app/Contents/Developer_, you need to reconfigure this path using the command line below
```
xcode-select -s /Applications/Xcode.app/Contents/Developer
```
now if run this command line
```
xcode-select -p
```
the path should be _/Applications/Xcode.app/Contents/Developer_.

1. After this XCode setup, go to your terminal and install the fastlane with the command below using RubyGems
```
sudo gem install fastlane -NV
```
#### (in the fastline website you're goign to find out that the installation is also possible using HomeBrew, but i STRONGLY recomend you to use the RubyGem installation, since i've had some problems with the brew install)

1.1. This is just a little step that i end up adding to this tutorial since sometimes it was needed, and sometimes not, so it's better if you just do it anyway to ensure that everything is going to work properly. Still in the terminal run the following line to install fastlane again, just so you're making sure that the newest version is intalled in your system.
```
sudo gem install fastlane
```
2. Now that fastlane is intalled navigate to your project folder and run the commend below to initiate fastlane
```
fastlane init
```
a few options are going to appear in your screen, we want the first one _(screenshots)_, so just type `1` and hit `enter`
if anything goes wrong in this step and you can no longer access the screenshot option just by chosing the number, you can also run the line
```
fastlane snapshot init
```
3. When the initialization is complete a new folder will appear inside your project, and inside this folder you're going to find a file called `./SnapshotHelper.swift`. You need to copy this file to your UI Tests folder that is inside your XCode project, just like i did in my ContinuousIntegrationProject.

4. In your XCode project open up the `.swift` file created for your `UI Tests`, and inside the `setup` function add the following lines
```Swift
let app = XCUIApplication()
setupSnapshot(app)
app.launch()
```
5. Now you just need to record your own UI Tests and everytime you want to take a screenshot you just put the command line
```
snapshot("Name that you wana give to the image")
```
6. Once this is all done you can go to the terminal and run
```
fastline screenshot
```
this will atomatically run your UI tests and take the screenshots wherever you've put the command lines of step 5.

#### Obs.: A Good thing to do is to configure the `Snapfile`, so you will only do the necessary tests in the devices you have configured for your project. The `Snapfile` can be found inside the `fastlane` folder created in your project.

-----

### Finally thats it, after you've succeded in doing all these steps your project will be configured with Travis CI, where you can always keep track of your project functions with the Unit Tests, and fastlane that will be doing the UI Tests and taking all the screenshot you need for your app store submit. If you want to use fastlane to do automatic deploys for beta test and app store test you just need to do a process similar to the one made with the screenshots, you can find more details about this in the fastlane documentation in the links below.
### Beta deployment: https://docs.fastlane.tools/getting-started/ios/beta-deployment/
### AppStore deployment: https://docs.fastlane.tools/getting-started/ios/appstore-deployment/

# That's All Folks!
