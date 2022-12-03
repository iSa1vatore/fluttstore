import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';

import 'button.dart';

class ErrorBlock extends StatelessWidget {
  final String desc;
  final VoidCallback onTryAgain;
  final bool inverseColorScheme;

  const ErrorBlock({
    required this.desc,
    required this.onTryAgain,
    this.inverseColorScheme = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Text(
              desc,
              style: context.textTheme.titleMedium?.copyWith(
                color: inverseColorScheme ? Colors.white : null,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 45,
              width: 100,
              child: Button(
                onPressed: onTryAgain,
                child: Text(
                  context.l10n.tryAgain,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                backgroundColor:
                    inverseColorScheme ? AppColors.accent : AppColors.accent2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
