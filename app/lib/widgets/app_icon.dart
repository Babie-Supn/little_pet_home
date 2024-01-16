import 'package:little_pet_home/index.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.size = 72,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/icon.svg',
      width: size,
    );
  }
}
