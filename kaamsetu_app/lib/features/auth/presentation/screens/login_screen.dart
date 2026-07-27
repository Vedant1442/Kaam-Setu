import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _phoneFocus.addListener(() {
      setState(() {
        _isFocused = _phoneFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  color: AppColors.surface,
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 32.0),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header / Logo Section
                        Column(
                          children: [
                            SizedBox(
                              height: 64,
                              child: Image.asset('assets/images/Kaam-setu.png', fit: BoxFit.contain),
                            ),
                            const SizedBox(height: 8), // gap-stack-sm
                            Text(
                              'कामसेतु - काम का पुल',
                              style: textTheme.headlineLarge?.copyWith(
                                fontSize: 26,
                                height: 32 / 26,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24), // mb-stack-lg
                        
                        // Illustration Section
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.outlineVariant),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/illustration.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24), // mb-stack-lg

                        // Identity / Welcome Text
                        Text(
                          'Welcome back',
                          style: textTheme.headlineMedium?.copyWith(
                            fontSize: 24,
                            height: 30 / 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          'Log in to find work or hire skilled workers.',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            height: 24 / 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 24), // mb-stack-lg

                        // Form Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  'Mobile Number',
                                  style: textTheme.labelLarge?.copyWith(
                                    fontSize: 16,
                                    height: 20 / 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8), // gap-stack-sm
                              
                              // Custom Phone Input Field
                              Container(
                                height: 48, // touch-target-min
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerLowest ?? AppColors.surface, // fallback since surfaceContainerLowest might not exist
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _isFocused ? AppColors.primary : AppColors.outlineVariant,
                                    width: _isFocused ? 3 : 2, // Focus ring 3px
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    const Text('🇮🇳', style: TextStyle(fontSize: 24)),
                                    const SizedBox(width: 8), // gap-2
                                    Text(
                                      '+91',
                                      style: textTheme.bodyLarge?.copyWith(
                                        fontSize: 18,
                                        height: 28 / 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(width: 12), // pr-3
                                    Container(width: 1, color: AppColors.outlineVariant, height: 24),
                                    const SizedBox(width: 12), // mr-3
                                    Expanded(
                                      child: TextField(
                                        controller: _phoneController,
                                        focusNode: _phoneFocus,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontSize: 18,
                                          height: 28 / 18,
                                          color: AppColors.onSurface,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Enter 10 digits',
                                          hintStyle: textTheme.bodyLarge?.copyWith(
                                            fontSize: 18,
                                            height: 28 / 18,
                                            color: AppColors.outlineVariant,
                                          ),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          counterText: '',
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 8), // mt-stack-sm
                              
                              // Action Button
                              SizedBox(
                                height: 48, // h-touch-target-min
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(RouteNames.otp);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.onPrimary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Send OTP',
                                    style: textTheme.labelLarge?.copyWith(
                                      fontSize: 18,
                                      height: 24 / 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Footer
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0), // pt-stack-lg
                          child: Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                    height: 24 / 16,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                  children: [
                                    const TextSpan(text: 'By continuing, you agree to our\n'),
                                    TextSpan(
                                      text: 'Terms',
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(text: ' & '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '© 2024 KaamSetu',
                                    style: textTheme.labelLarge?.copyWith(
                                      fontSize: 16,
                                      height: 20 / 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.onSurface.withAlpha(128), // Note: Avoiding withOpacity as requested, using withAlpha or just solid color
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
