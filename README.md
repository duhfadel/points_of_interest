Points of Interest
Points of Interest is a Flutter app that consumes an API to display soccer stadiums in Spain, allowing users to filter and search for one or more stadiums.

Features
Displays a list of points of interest in a GridView.
Allows users to search and filter points of interest.
Loads data from an API if no data is stored locally.
Includes a "Swipe to refresh" button to make testing easier.
A details screen that shows the name, image, and coordinates of the points of interest.
How to Use
When the app is loaded, it will fetch data from the API and store it locally on your device.
Use the text field at the top of the screen, above the AppBar, to filter and search for one or more stadiums by typing a few letters.
Tap on any item to view details on the details screen.
At the bottom of the screen, there is a button to clear cached information about the points of interest. Press it to see how the app behaves when there is no data to display.
Testing Error Handling
You can test the error handling by going to the Services folder, opening the file poi_services.dart, and commenting out line 19, then uncommenting line 21. This will simulate an error, allowing you to see how error messages are displayed in the app.
