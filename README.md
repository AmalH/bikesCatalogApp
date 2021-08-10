## Bikes Catalog app

This project is a simple flutter app that displays a filterable and sortable list of objects where each list item routes to an item details page. It presents the following features:

- Performs network calls using the [http package](https://pub.dev/packages/http) to fetch bikes json data and maintain it.  
- Implements sorting and filtering features for the retrieved data list and display it accordingly.
- Uses the [Bloc library](https://bloclibrary.dev) and presents a cubit for the app state managment.
- Contains unit tests as well as widget and bloc tests.

 Below are screenshots for this basic filterable and sortable list in Flutter example: 

#### Sort and Filter features:
<p align="center">
<img src="https://raw.githubusercontent.com/AmalH/bikeCatalogApp/master/screenshots/sortFilterFeatures.gif" alt="sortFilterFeatures" width="300" height="600"/>
</p>

![sortFilterUI](https://raw.githubusercontent.com/AmalH/bikeCatalogApp/master/screenshots/sortFilterUI.png)



#### List item details UI:
<p align="center">
<img src="https://raw.githubusercontent.com/AmalH/bikeCatalogApp/master/screenshots/listItemDetails.gif" alt="listItemDetails" width="300" height="600"/>
</p>

![bikeDetailsUI](https://raw.githubusercontent.com/AmalH/bikeCatalogApp/master/screenshots/bikeDetailsUI.png)



#### Main UI:
![bikesListUI](https://raw.githubusercontent.com/AmalH/bikeCatalogApp/master/screenshots/mainUI.png)