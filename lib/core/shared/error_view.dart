import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onPress;
  const ErrorView({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 100,
              color: AppColors.hint,
            ),
            const Text(
              AppStrings.unexpectedError,
            ),
            ElevatedButton(
              child: Text("Reload Screen"),
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
