import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.resources.strings!.activityHeaderText,
          style: context.resources.style.subHeadingTextStyle,
        ),
        Row(
          children: [
            Text(
              context.resources.strings!.dayText,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              context.resources.strings!.weekText,
              style: const TextStyle(color: Colors.blueAccent),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              context.resources.strings!.monthText,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
