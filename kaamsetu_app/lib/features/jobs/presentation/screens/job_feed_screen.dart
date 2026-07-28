import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/jobs_provider.dart';
import '../../../../core/theme/app_colors.dart';

class JobFeedScreen extends ConsumerStatefulWidget {
  const JobFeedScreen({super.key});

  @override
  ConsumerState<JobFeedScreen> createState() => _JobFeedScreenState();
}

class _JobFeedScreenState extends ConsumerState<JobFeedScreen> {
  int _selectedIndex = 0;
  bool _isAvailable = true;
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'Painting', 'Plumbing', 'Cleaning', 'Electrical'];

  @override
  Widget build(BuildContext context) {
    final jobFeedAsync = ref.watch(jobFeedProvider(const {'lat': 28.7, 'lng': 77.1, 'radius': 10}));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryContainer,
        elevation: 0,
        scrolledUnderElevation: 4, // Shadow when scrolling
        shadowColor: Colors.black.withOpacity(0.3),
        titleSpacing: 16,
        toolbarHeight: 64, // h-16
        title: Row(
          children: [
            // Mock logo since image URL is remote and might not be available as asset
            const Icon(Icons.handshake_rounded, color: AppColors.onPrimaryContainer, size: 40),
            const SizedBox(width: 12),
            Text(
              'KaamSetu',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    fontSize: 26, // headline-lg-mobile
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => context.push('/notifications'),
                    hoverColor: AppColors.surfaceContainerHighest.withOpacity(0.2),
                    child: Container(
                      height: 48,
                      width: 48,
                      alignment: Alignment.center,
                      child: const Icon(Icons.notifications_outlined, color: AppColors.onPrimaryContainer, size: 24),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    height: 16,
                    width: 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryContainer, width: 2),
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0), // mt-20 in HTML roughly matches top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting Card
                  Container(
                    padding: const EdgeInsets.all(16.0), // p-stack-md
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(12), // rounded-xl
                      border: Border.all(color: AppColors.outlineVariant),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning Ramesh',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: AppColors.onSurface,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Check out new work today!',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.onSurfaceVariant,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Switch(
                              value: _isAvailable,
                              onChanged: (val) => setState(() => _isAvailable = val),
                              activeColor: Colors.white,
                              activeTrackColor: AppColors.surfaceTint, // Used surfaceTint per HTML for toggle bg
                              inactiveThumbColor: AppColors.outline,
                              inactiveTrackColor: AppColors.surfaceContainerHighest,
                            ),
                            Text(
                              _isAvailable ? 'Available' : 'Offline',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: 12,
                                    color: _isAvailable ? AppColors.primary : AppColors.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24), // space-y-stack-lg
                  
                  // Nearby Jobs Header & Filters
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nearby Jobs (12)',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.onSurface,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.tune, size: 18, color: AppColors.primary),
                        label: Text(
                          'Filters',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // space-y-stack-md between header and list
                  
                  // Horizontal Filters
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: _filters.length,
                      itemBuilder: (context, index) {
                        final filter = _filters[index];
                        final isSelected = _selectedFilter == filter;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() => _selectedFilter = filter);
                            },
                            borderRadius: BorderRadius.circular(9999), // rounded-full
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh,
                                borderRadius: BorderRadius.circular(9999),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                filter,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16), // space-y-stack-md before job list
                ],
              ),
            ),
          ),
          
          // Job List
          jobFeedAsync.when(
            data: (jobs) {
              if (jobs.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No jobs found nearby.')),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final job = jobs[index];
                      // Determine icon based on index for variety to match mock
                      final isPainting = index % 2 == 0;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16), // space-y-stack-md
                        padding: const EdgeInsets.all(16.0), // p-stack-md
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(12), // rounded-xl
                          border: Border.all(color: AppColors.outlineVariant),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 56, // h-14
                                        width: 56, // w-14
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8), // rounded-lg
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          isPainting ? Icons.format_paint_outlined : Icons.plumbing_outlined, 
                                          color: AppColors.primary, 
                                          size: 30
                                        ),
                                      ),
                                      const SizedBox(width: 16), // gap-4
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              job.title,
                                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                    color: AppColors.onSurface,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const SizedBox(height: 4),
                                            RichText(
                                              text: TextSpan(
                                                text: isPainting ? 'Sharma Family ' : 'Verma Residence ',
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: AppColors.onSurfaceVariant,
                                                      fontSize: 16,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text: isPainting ? '(95% positive)' : '(92% positive)',
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                          color: AppColors.primary,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.bookmark_border, color: AppColors.onSurfaceVariant),
                              ],
                            ),
                            const SizedBox(height: 16), // implicitly via space-y-4
                            
                            // 2-column grid
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 5,
                              mainAxisSpacing: 12,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined, color: AppColors.onSurfaceVariant, size: 18),
                                    const SizedBox(width: 8), // gap-2
                                    Expanded(
                                      child: Text(
                                        isPainting ? 'Sector 15, Noida (2.3 km)' : 'Sector 18, Noida (1.5 km)',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              color: AppColors.onSurfaceVariant,
                                              fontSize: 16,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.schedule_outlined, color: AppColors.onSurfaceVariant, size: 18),
                                    const SizedBox(width: 8),
                                    Text(
                                      isPainting ? 'Today, 9 AM' : 'Today, 11 AM',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: AppColors.onSurfaceVariant,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(Icons.payments_outlined, color: AppColors.primary, size: 18),
                                const SizedBox(width: 8),
                                Text(
                                  isPainting ? 'Rs. 800 per day' : 'Rs. 500 fixed',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        color: AppColors.primary,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16), // implicitly space-y-4
                            
                            ElevatedButton(
                              onPressed: () => context.push('/jobs/${job.id}'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryContainer,
                                foregroundColor: AppColors.onSecondaryContainer,
                                minimumSize: const Size(double.infinity, 48), // py-3
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // rounded-lg
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'I am Interested',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.onSecondaryContainer,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18, // button-text
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: jobs.length,
                  ),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text('Error: $err')),
            ),
          ),
          
          // Stats/Promo Bento Area
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 140, // min-h-[140px]
                      padding: const EdgeInsets.all(16), // p-stack-md
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12), // rounded-xl
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            top: -8,
                            right: -8,
                            child: Icon(Icons.stars_rounded, color: Colors.white24, size: 64), // text-6xl opacity-20
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4.9/5',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: AppColors.onPrimary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Ramesh\'s Rating',
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.onPrimary.withOpacity(0.8), // opacity-80
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // gap-gutter
                  Expanded(
                    child: Container(
                      height: 140,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryFixed ?? Theme.of(context).colorScheme.tertiaryContainer, // fallback to Material 3 standard if missing
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.trending_up, 
                            color: AppColors.onTertiaryFixed ?? Theme.of(context).colorScheme.onTertiaryContainer, 
                            size: 30
                          ), // text-3xl
                          const SizedBox(height: 8), // mb-2
                          Text(
                            '15 Jobs',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: AppColors.onTertiaryFixed ?? Theme.of(context).colorScheme.onTertiaryContainer,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'This month',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.onTertiaryFixedVariant ?? Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48, // h-touch-target-min
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.outlineVariant, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_filled, 'Home', 0),
            _buildNavItem(Icons.work_rounded, 'Jobs', 1),
            _buildNavItem(Icons.person, 'Profile', 2),
            _buildNavItem(Icons.notifications, 'Alerts', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        if (index == 0) context.go('/home');
        if (index == 1) context.go('/home'); // Jobs tab not implemented separately yet
        if (index == 2) context.push('/worker_profile');
        if (index == 3) context.push('/notifications');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(9999), // rounded-full
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, 
              color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant, 
              size: 24
            ),
            const SizedBox(height: 2), // mt-0.5
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 10,
                    color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}


