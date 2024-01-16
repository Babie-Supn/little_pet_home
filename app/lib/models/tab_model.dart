import 'package:little_pet_home/index.dart';

class TabModel {
  const TabModel({
    required this.tabs,
    required this.views,
  }) : assert(tabs.length == views.length);

  final List<Tab> tabs;
  final List<Widget> views;

  int get length => tabs.length;
}
