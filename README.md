# Chethan 

Flutter app for Digital Search Assignment

## Requirements/ Dependencies
    * http package - communicating with REST api

## Project Description
  * State Management used for this project is BLOC.
  * Architecture implemented in this project its Clean Architecture.
  * Backend Api - https://api.seatgeek.com/2/events?client_id=Mjc2NjI2Mjd8MTY1NjU5MjQ2Ni44MDM3MjQ4&q= as provided to me from Digital14 team.

# scope of the digital search assignment
   * Two UI screens

  
## Instruction
  * On  start of the app we are displaying a search input field
  * After entering a text it will display the results by matching text from the search field and the results from the api and display them in a listview.
  * If a text matches or contains any text from the result it will display the particular data in a list tile format along with the respective image.
  * If a text does not match any result then we will display no items found.
  * When a users tap's on particular list tile, the user will be redirected to the result description screen.


* Supported devices

    * Any android above API level 16
    * Any iOS device above iOS 8
    
* Naming Convention

    * Class names: PascalCase or UpperCamelCase | Eg: HomeScreen
    * File names (Dart or assets): snake_case or pothole_case | Eg: home_screen.dart
    * File names (Native Android or iOS): Follow native development conventions
    * Variable names: lowerCamelCase | Eg: String userFullName
    * Constant object names: lowerCamelCase starting with k | Eg: kCanvasBackgroundColor
    * ENUM values: lowerCamelCase | Eg: firstSelection
