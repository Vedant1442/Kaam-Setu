import 'package:flutter/material.dart';

class AvatarUploader extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onUpload;

  const AvatarUploader({super.key, this.imageUrl, required this.onUpload});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUpload,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null
            ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
            : null,
      ),
    );
  }
}
