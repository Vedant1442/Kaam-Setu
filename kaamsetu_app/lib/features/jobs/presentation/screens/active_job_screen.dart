import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class ActiveJobScreen extends StatelessWidget {
  final String jobId;
  const ActiveJobScreen({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Active Job'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Fix Leaking Kitchen Sink Pipe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 16),
                
                // Contact Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: const Icon(Icons.person, color: AppColors.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Priya Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('Household', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message, color: AppColors.primary),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.call, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                const Text('Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                const SizedBox(height: 16),
                
                Stepper(
                  currentStep: 1, // 0: Assigned, 1: In Progress, 2: Completed
                  controlsBuilder: (context, details) => const SizedBox.shrink(),
                  margin: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  steps: [
                    Step(
                      title: const Text('Assigned', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: const SizedBox.shrink(),
                      isActive: true,
                      state: StepState.complete,
                    ),
                    Step(
                      title: const Text('In Progress', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Started today at 10:00 AM', style: TextStyle(color: Colors.grey.shade600)),
                      content: const SizedBox.shrink(),
                      isActive: true,
                    ),
                    const Step(
                      title: Text('Completed'),
                      content: SizedBox.shrink(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacement('/jobs/$jobId/rate');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Green button
              ),
              child: const Text('Mark as Completed'),
            ),
          ),
        ],
      ),
    );
  }
}
