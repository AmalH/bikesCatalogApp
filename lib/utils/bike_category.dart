enum BikeCategory {
  AllTerrain,
  MointainBike,
  Race,
  Enduro,
  Downhill,
  Dirt,
  BMX,
  FatBike,
  EBike,
  None,
}

BikeCategory? fromString(String category) {
  switch (category) {
    case "All-terrain":
      return BikeCategory.AllTerrain;
    case "Mointain-bike":
      return BikeCategory.MointainBike;
    case "Race":
      return BikeCategory.Race;
    case "Enduro":
      return BikeCategory.Enduro;
    case "Downhill":
      return BikeCategory.Downhill;
    case "Dirt":
      return BikeCategory.Dirt;
    case "BMX":
      return BikeCategory.BMX;
    case "Fat-bike":
      return BikeCategory.FatBike;
    case "E-Bike":
      return BikeCategory.EBike;
  }
}

extension ParseToString on BikeCategory {
  String toShortString() {
    switch (this) {
      case BikeCategory.AllTerrain:
        return "All-terrain";
      case BikeCategory.MointainBike:
        return "Mointain-bike";
      case BikeCategory.Race:
        return "Race";
      case BikeCategory.Enduro:
        return "Enduro";
      case BikeCategory.Downhill:
        return "Downhill";
      case BikeCategory.Dirt:
        return "Dirt";
      case BikeCategory.BMX:
        return "BMX";
      case BikeCategory.FatBike:
        return "Fat-bike";
      case BikeCategory.EBike:
        return "E-Bike";
      default:
        return "-";
    }
  }
}
