import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/presentation/pages/profile/cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..updateUser(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('My profile'),
              ),
              body: Center(
                child: CustomPaint(
                  painter: ProfilePainter(),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'FIO: ${state.user?.fullname}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: ${state.user?.email} ',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Date:  ${state.user?.dateOfBirth.toString()} ',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Цвет фона
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.35)
      ..quadraticBezierTo(size.width / 2, size.height * 0.5, size.width, size.height * 0.35)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
