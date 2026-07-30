import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';

class RatingScreen extends StatefulWidget {
  final String jobId;
  const RatingScreen({super.key, required this.jobId});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool? _isPositive;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.primary, size: 24),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Rate Experience',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Completed Job Card
              Container(
                margin: const EdgeInsets.only(bottom: 24.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  border: Border.all(color: AppColors.outlineVariant),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryFixed,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.format_paint, color: AppColors.onPrimaryFixed, size: 28),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'House Painting (2 Rooms)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: const TextSpan(
                              text: 'Client: ',
                              style: TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant),
                              children: [
                                TextSpan(
                                  text: 'Sharma Family',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Completed on Aug 5, 2026',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Rating Content
              const Text(
                'How was your experience?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                  height: 1.23,
                ),
              ),
              const SizedBox(height: 24),
              
              // Interaction Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildRatingButton(
                      icon: Icons.thumb_up,
                      label: 'Good',
                      color: AppColors.primaryContainer,
                      isSelected: _isPositive == true,
                      onTap: () => setState(() => _isPositive = true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildRatingButton(
                      icon: Icons.thumb_down,
                      label: 'Not Good',
                      color: AppColors.error,
                      isSelected: _isPositive == false,
                      onTap: () => setState(() => _isPositive = false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Comment Area
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      'Write a comment (optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    children: [
                      TextField(
                        controller: _commentController,
                        maxLines: null,
                        minLines: 4,
                        maxLength: 150,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.onBackground,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Share details about your service experience...',
                          hintStyle: TextStyle(
                            color: AppColors.outline,
                          ),
                          counterText: '',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.outlineVariant),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 16,
                        child: Text(
                          '${_commentController.text.length} / 150',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _commentController.text.length >= 150 
                                ? AppColors.error 
                                : AppColors.outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              // Illustration placeholder
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Opacity(
                  opacity: 0.8,
                  child: Center(
                    child: Container(
                      width: 128,
                      height: 128,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [AppColors.primaryFixed, AppColors.secondaryFixed],
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuB6yRwXNnsRUHtOK0nWFWM9JfhzeJ1fP91X9TMnMoXn9tlpYdZuuzG9zWEQmaNOrdpluie0N5XQJ-Pli7QSJHZ_NIqEksjFGsksH_kh-O7Np211SVSFPloqBlNfp1i8HGgXbZqdMrwYLyd_4jY1TUIpZStPzNEmw6DIlU6OGUevmfTbltOb_2Z7b84wRKrn4OiHL3H7SGtvY3jzzB8QAInoFIvdURtJNxG7cOYVNcTv-MTCQdSQsAxz9drnLT3bUNSbTRIVdszXZR0',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Action Buttons
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isPositive == null
                    ? null
                    : () {
                        context.goNamed(RouteNames.home);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  disabledBackgroundColor: AppColors.primary.withAlpha(100),
                  disabledForegroundColor: AppColors.onPrimary.withAlpha(150),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Submit Rating',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => context.goNamed(RouteNames.home),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        constraints: const BoxConstraints(minHeight: 140),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? color.withAlpha(20) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : color.withAlpha(51),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
