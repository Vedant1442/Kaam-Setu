import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class InterestedWorkersScreen extends StatelessWidget {
  final String jobId;
  const InterestedWorkersScreen({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back, color: AppColors.onSurface),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Interested Workers (5)',
                          style: textTheme.headlineMedium?.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          'House Painting (2 Rooms)',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Filter / Sort Section
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                border: Border.all(color: AppColors.outlineVariant),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sort by: Rating',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.expand_more, color: AppColors.onSurfaceVariant),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Workers List
            _buildWorkerCard(
              context: context,
              imageUrl: 'https://lh3.googleusercontent.com/aida/AP1WRLuGwB67AK8bzpswewPe_W8PWOra8PN7sRoyMzrlZFJw4iCye-_oud8HsGqwzZ-l9xKqXQpepJj4lv93edOTre6CCsaOSnnUInRHseBTb_A-YAci9rrbtYBZRO3Mk_TaA7GLUcnn46llIYRE-QgMNl9KbnRa4Cee6zPFhJG7ahaHz6sGux9ce9DPCqjmX_p4l8N7iCHvBHYe7oskUYfjTDdmwcJFmOe8EXTWJP2myhQyZinP81JLEhqYyw',
              name: 'Ramesh Kumar',
              ratingText: '92% positive • 50 ratings',
              skills: ['Painting', 'Texturing'],
              price: '₹800',
              borderColor: AppColors.primaryFixed,
              ratingColor: AppColors.primary,
            ),
            const SizedBox(height: 16),
            _buildWorkerCard(
              context: context,
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC4p2vvI7WZHBAhuP2LdKsdLssOwqeuOXOaJP_wKywk15RcUW3J7YnH3g5ezAhL67PtgonabTNKuBoGYe22zOqDKcwK3b-j_0aN6KcmMOaG6pcOK-WAs5iTDHzwlsla_d2PSIGytJIfYUWhY6oJF2pkWH1_vTucPBev1ECj5OlkL4tchuulUhbdBFHaEUyhYGy2pnzh8yJtKXQ8Q4aTv93QvhL-ErfrGXx_nfN7BIqK9NEy4scpZFPAaocUKcv2XFwkVfGTqjdZprs',
              name: 'Sunil Verma',
              ratingText: '88% positive • 35 ratings',
              skills: ['Painting', 'Waterproofing'],
              price: '₹850',
              borderColor: AppColors.outlineVariant,
              ratingColor: AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            _buildWorkerCard(
              context: context,
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCxdVNUp4dxlLVGt9Xg_DBQuYKqD09WpHbRsCSTO8rPiyJzmtocP1U7QOKKvtcuKwdketJg1k2wU8tFxRKXp9zXKqJEpa5flmJMF0d2SpGe215kOTQAlm46nzsx1jD-ouJ605QQl7H1_2-AQFvONIvv2DfUtnT3FLlrUV8t7H7Z_cMlultnYn_HTWHkT_YRGA9muwLTtoO-P9U31EYEP-XJZ0owwCVCy3Fb4z9Fp2NuC_tLdjfSxwfFmmCGpiFGWdbWcuk5x0GlVss',
              name: 'Amit Singh',
              ratingText: '95% positive • 12 ratings',
              skills: ['Painting', 'Polishing'],
              price: '₹750',
              borderColor: AppColors.outlineVariant,
              ratingColor: AppColors.onSurfaceVariant,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 64, // Based on touch target + padding
        decoration: const BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          border: Border(top: BorderSide(color: AppColors.outlineVariant)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 'Home', false),
            _buildNavItem(context, Icons.work_outline, 'My Jobs', true),
            _buildNavItem(context, Icons.payments, 'Earnings', false),
            _buildNavItem(context, Icons.person, 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkerCard({
    required BuildContext context,
    required String imageUrl,
    required String name,
    required String ratingText,
    required List<String> skills,
    required String price,
    required Color borderColor,
    required Color ratingColor,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                  boxShadow: const [
                    BoxShadow(color: Color(0x0D000000), blurRadius: 2, offset: Offset(0, 1)),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: textTheme.headlineMedium?.copyWith(
                              color: AppColors.onSurface,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0x3391D78A), // bg-primary-fixed/20
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Available',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.onPrimaryFixedVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ratingText,
                      style: textTheme.bodyMedium?.copyWith(
                        color: ratingColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: skills.map((s) => _buildSkillChip(s, textTheme)).toList(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          price,
                          style: textTheme.headlineMedium?.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'per day',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Select'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.onSurfaceVariant,
                    side: const BorderSide(color: AppColors.outlineVariant, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  child: const Text('Reject'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label.toUpperCase(),
        style: textTheme.labelSmall?.copyWith(
          color: AppColors.onSurfaceVariant,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isSelected) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
