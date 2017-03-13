# BuildIt Weather App

### How to build:
- Simply open the BuildIt.xcodeproj and hit run, there are no 3rd party libraries included so no need to worry about cocoapods or the likes.
- Unfortunately I didn't get around to testing in the allocated 4 hours, given more time I would have tried to get as much coverage as possible.

### About the project and the design
- Written in Swift 3
- The app makes one API call, I chose to build the API service from scratch as I wanted to keep the project as lightweight as possible. We could have used AlamoFire if we were doing a variation of network requests.
- I chose to stick with the standard MVC approach but seperated each view into it's own UIView subclass, I like to decouple everything as it makes testing and iteration alot easier.
- The model pattern follows the Open Weather Map JSON design
- The UI/UX is very minimal, I wanted to approach the design with something similar to the iOS weather app, a big block of real estate for the current day and then any future forcasts in a table view below.

### What would I have done given more time?
- Testing! I would use a range of tools in my day to day setup, OCMock, XCTest, Xcode UI testing etc
- More on UI, I would add alerts for the likes of error responses, also I would like to add a UIPageViewController so we could save a bunch of different cities which also brings on the need for an input to change the city.
- As the API requires both city name and country code, I would create a list or use some other API service to get a list of city names or country codes.
- I would localise the app to properly, to English
