import 'package:flutter/material.dart';

class AvailabilityToggle extends StatelessWidget {
  final bool isAvailable;
  final ValueChanged<bool> onChanged;

  const AvailabilityToggle({
    super.key,
    required this.isAvailable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        'Available for Work',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        isAvailable 
          ? 'You are visible to households' 
          : 'You are currently hidden',
      ),
      value: isAvailable,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}
