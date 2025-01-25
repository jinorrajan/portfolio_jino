
import '../models/assetsModel.dart';


class AssetController {
  // Singleton instance
  static final AssetController _instance = AssetController._internal();
  factory AssetController() => _instance;
  AssetController._internal();

  // List of assets
  final List<Asset> _assets = [
    Asset(category: 'images', name: 'profile', path: 'assets/images/jino.png'),
    Asset(category: 'images', name: 'home', path: 'assets/images/home.png'),
    Asset(category: 'images', name: 'flutter', path: 'assets/images/flutter.png'),
    Asset(category: 'images', name: 'dart', path: 'assets/images/dart.png'),
    Asset(category: 'images', name: 'firebase', path: 'assets/images/firebase.png'),
    Asset(category: 'images', name: 'hive', path: 'assets/images/hive.png'),
    Asset(category: 'images', name: 'getx', path: 'assets/images/getx.png'),
    Asset(category: 'images', name: 'figma', path: 'assets/images/figma.png'),
    Asset(category: 'images', name: 'bloc', path: 'assets/images/bloc.png'),
    Asset(category: 'icon', name: 'downloadIcon', path: 'assets/images/downloadIcon.png'),


  ];

  // Get asset path by category and name
  String getAsset(String category, String name) {
    final asset = _assets.firstWhere(
      (asset) => asset.category == category && asset.name == name,
      orElse: () => Asset(category: category, name: name, path: ''),
    );
    return asset.path;
  }
}
