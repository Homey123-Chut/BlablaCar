import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isPrimary; 
  final bool enable;
  final VoidCallback onPressed;

  const BlaButton({
    super.key,
    required this.text,
    this.icon,
    this.isPrimary = true,
    this.enable = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    
    final Color textColor = isPrimary ? Colors.white : BlaColors.primary;
    final Color iconColor = textColor;

    return ElevatedButton(
      onPressed: enable? onPressed: null, 
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? BlaColors.primary : BlaColors.white,
        padding: EdgeInsets.all(25)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 20, color: iconColor),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: BlaTextStyles.button.fontSize,
              fontWeight: BlaTextStyles.button.fontWeight,
            ),
            ),
        ],
      ),
    );
  }
}