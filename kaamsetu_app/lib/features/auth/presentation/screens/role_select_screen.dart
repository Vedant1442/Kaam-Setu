import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';

class RoleSelectScreen extends StatefulWidget {
  const RoleSelectScreen({super.key});

  @override
  State<RoleSelectScreen> createState() => _RoleSelectScreenState();
}

class _RoleSelectScreenState extends State<RoleSelectScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'KaamSetu',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: AppColors.primary,
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 24.0,
                  bottom: 128.0, 
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'I want to',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: AppColors.onSurface,
                            height: 32 / 26,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Select how you want to use KaamSetu today.',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                            height: 28 / 18,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildRoleCard(
                          title: 'Find Work',
                          subtitle: 'I am a skilled worker looking for daily jobs nearby',
                          icon: Icons.engineering,
                          role: 'worker',
                        ),
                        const SizedBox(height: 16),
                        _buildRoleCard(
                          title: 'Hire Help',
                          subtitle: 'I need to hire workers for tasks at my home',
                          icon: Icons.home,
                          role: 'employer',
                        ),
                        const SizedBox(height: 24),
                        Opacity(
                          opacity: 0.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0,      0,      0,      1, 0,
                              ]),
                              child: Image.network(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuBLGavhicgwPrMYrSQ9myZVSdMP65peo4Gf0uxoFDrsRhQH41K1xg_7DhlVjloyEAi1EqDMpLRRbBdfwpz95WrTyUCw4mu1Jn0oOLqVV0YTZUR0Y6KA-iEAUJhb6_mdAcNISa5cSjT5kQBTCWj8rv2CG_vwUAu6ygdA6EcfEDdLMrirEqFigNezxACc90wkiBWTTxjsQ2ftgOB3k3YeqhlT3cYNmgV76xRwnGIdk-Gu8fG9ilMT3yqwXMf8MMCY4szCzaVrppaRebA',
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  height: 160,
                                  color: AppColors.surfaceContainerHigh,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.surface,
              AppColors.surface.withOpacity(0.0),
            ],
            stops: const [0.8, 1.0],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryContainer,
                          disabledBackgroundColor: AppColors.primaryContainer.withOpacity(0.5),
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                          shadowColor: AppColors.primary.withOpacity(0.1),
                        ),
                        onPressed: _selectedRole == null
                            ? null
                            : () {
                                context.pushNamed(RouteNames.home);
                              },
                        child: Text(
                          'Continue',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 24 / 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '© 2024 KaamSetu. काम का पुल',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurfaceVariant,
                          height: 20 / 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Terms of Service',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurfaceVariant,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Privacy Policy',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurfaceVariant,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required String role,
  }) {
    final isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(minHeight: 160),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.04) : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryContainer,
            width: isSelected ? 3 : 2,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                            height: 30 / 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                            height: 24 / 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

