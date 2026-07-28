import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _budgetController = TextEditingController();
  final _locationController = TextEditingController();
  final _specialController = TextEditingController();
  String _selectedCategory = 'Painting';
  String _budgetMode = 'fixed';
  bool _isPosting = false;
  bool _isSuccess = false;

  final List<String> _categories = [
    'Painting',
    'Plumbing',
    'Cleaning',
    'Electrical',
    'Carpentry'
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.onSurfaceVariant,
    );
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: AppColors.surfaceContainerLowest,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        toolbarHeight: 48,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Post a New Job',
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          SizedBox(width: 48), // Placeholder for symmetry
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 104,
              ),
              children: [
                // Job Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Job Title', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _titleController,
                      style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                      decoration: inputDecoration.copyWith(
                        hintText: 'e.g. Living Room Painting',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Category Selector
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category', style: labelStyle),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _categories.map((c) {
                        final isSelected = _selectedCategory == c;
                        return InkWell(
                          onTap: () => setState(() => _selectedCategory = c),
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.surfaceContainerLowest,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.outlineVariant,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              c,
                              style: textTheme.labelLarge?.copyWith(
                                color: isSelected
                                    ? AppColors.onPrimary
                                    : AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _descController,
                      maxLines: 4,
                      style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Describe the work in detail...',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Date & Time
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date', style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            readOnly: true,
                            style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                            decoration: inputDecoration.copyWith(
                              hintText: 'Select Date',
                              suffixIcon: const Icon(
                                Icons.calendar_today,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time', style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            readOnly: true,
                            style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                            decoration: inputDecoration.copyWith(
                              hintText: 'Select Time',
                              suffixIcon: const Icon(
                                Icons.schedule,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _locationController,
                      style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Street name, landmark...',
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.my_location,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Use current location',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Budget
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Budget', style: labelStyle),
                    const SizedBox(height: 8),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.outlineVariant),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => setState(() => _budgetMode = 'fixed'),
                              borderRadius: const BorderRadius.horizontal(left: Radius.circular(11)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _budgetMode == 'fixed'
                                      ? AppColors.primary
                                      : AppColors.surfaceContainerLowest,
                                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(11)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Fixed',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: _budgetMode == 'fixed'
                                        ? AppColors.onPrimary
                                        : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            color: AppColors.outlineVariant,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => setState(() => _budgetMode = 'negotiable'),
                              borderRadius: const BorderRadius.horizontal(right: Radius.circular(11)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _budgetMode == 'negotiable'
                                      ? AppColors.primary
                                      : AppColors.surfaceContainerLowest,
                                  borderRadius: const BorderRadius.horizontal(right: Radius.circular(11)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Negotiable',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: _budgetMode == 'negotiable'
                                        ? AppColors.onPrimary
                                        : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _budgetController,
                      keyboardType: TextInputType.number,
                      style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Enter amount',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8, top: 12, bottom: 12),
                          child: Text(
                            '₹',
                            style: textTheme.labelLarge?.copyWith(
                              color: AppColors.onSurface,
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Special Requirements
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Special Requirements (Optional)', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _specialController,
                      maxLines: 3,
                      style: textTheme.bodyMedium?.copyWith(color: AppColors.onSurface),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Any specific tools or materials needed?',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Image/Visual Anchor for Mood
                Container(
                  height: 192,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCqu311kwA54LtNDRfIFiHsx70C3FitbWdCgdJZD2Ve_jXW-AHJn4YwKQLWHL-vCVxWsfgjXzrLoK-D2_Sk9--US2Kzt2X1FsVugbfrAvWuwkgFxwfLYIUaRu_hKGKuldIiT1C_PyG6yPNnjjFe-QJ7RMZpso1wZvTYwb0ffZcQajES1LxGYB6BpSvKudjfajJVlZmL6qMKGf16MuS7vLvRlLro8YkpX3SDBoCLIn3dMtwx4jBI031AEDgAVbCqvTP2nlGvssNvAKg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white, // Replaced withAlpha with solid white
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: AppColors.outlineVariant, // Replaced withAlpha with solid outline color
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.verified,
                                color: AppColors.primary,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Verified Professionals only',
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  top: BorderSide(color: AppColors.outlineVariant),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_isPosting || _isSuccess) return;
                      setState(() => _isPosting = true);
                      await Future.delayed(const Duration(milliseconds: 1500));
                      setState(() {
                        _isPosting = false;
                        _isSuccess = true;
                      });
                      await Future.delayed(const Duration(milliseconds: 1000));
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Job Posted Successfully!')),
                        );
                        context.pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isSuccess
                          ? AppColors.secondaryContainer
                          : AppColors.primary,
                      foregroundColor: _isSuccess
                          ? AppColors.onSecondaryContainer
                          : AppColors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isSuccess
                              ? 'Success!'
                              : _isPosting
                                  ? 'Posting...'
                                  : 'Post Job',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _isSuccess
                              ? Icons.check_circle
                              : _isPosting
                                  ? Icons.sync
                                  : Icons.send,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

