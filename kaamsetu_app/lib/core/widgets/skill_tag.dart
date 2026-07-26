import 'package:flutter/material.dart';

class SkillTag extends StatelessWidget {
  final String skill;
  final bool isSelected;
  final VoidCallback? onTap;

  const SkillTag({
    super.key,
    required this.skill,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(skill),
      backgroundColor: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : null,
      side: BorderSide(
        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
      ),
      labelStyle: TextStyle(
        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      onPressed: onTap,
    );
  }
}
