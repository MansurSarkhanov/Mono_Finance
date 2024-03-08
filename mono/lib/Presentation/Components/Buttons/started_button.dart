import 'package:flutter/material.dart';
import 'package:mono/Presentation/Components/Buttons/primary_button.dart';

import '../../../Core/Constants/strings.dart';

class StartedButton extends StatelessWidget {
  const StartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: PrimaryButton(
        onPress: () {},
        child: const Center(
            child: Text(
          AppStrings.startButton,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
