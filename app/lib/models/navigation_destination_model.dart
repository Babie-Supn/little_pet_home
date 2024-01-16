import 'package:little_pet_home/index.dart';

class NavigationDestinationModel {
  const NavigationDestinationModel({
    required this.destinations,
    required this.bodies,
  });
  final List<NavigationDestination> destinations;
  final List<Widget> bodies;
}
