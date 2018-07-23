## To run "MovieSearch" project:

1. Download project from https://github.com/EvgSem/MovieSearch.git
2. Open the project in XCode
3. Add your Apple ID account to accounts like it is described in "Getting Set Up" section of article https://blog.ionicframework.com/deploying-to-a-device-without-an-apple-developer-account/
4. Set the Team name in Project Settings
5. Attach your device (make sure it is unlocked)
6. Select your device in XCode -> Device
7. Run the application
8. On your device verify the Developer App certificate for your account is trusted on your device. Open Settings on [Device name] and navigate to General -> Device Management, then select your Developer App certificate to trust it.
9. Open the application on your device.


## Architecture

I structures the code and classes according to MVVM architecture: 

- ViewModel folder contains all ViewModels classes
- View folder contains all classes responsible for UI
- Model layer represented by Service and API folders

## Implementation details:

I create API client "RestClient" to communicate with Server "Themoviedb".  All classes are stored in API folder. I used protocol first approach for abstarctions.
Also there is MovieService class which abstracts API client from ViewModels. 


## Thinks could be done to improve the porject

1. Extend API client by addding different type of requests (now there is only GET)
2. Add some animations
3. Add spinner while loading next page of movies
4. Improve UI design
5. Show more information about movies. 
6. Handle situation when User has no access to Server and when there is no Internet connection.
