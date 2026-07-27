import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leadingWidth: 56,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.primary,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
        ),
        title: const Text(
          'Verify OTP',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 32 / 26,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 8,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Illustration
              Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: AppColors.tertiaryFixed,
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCPCHFS4sH1ohhxdCBj3Ckksld5pp0Bk4BMKCdScWeB8p4uUGUMlvx5BMCQ-1_uTRgxagZcQnx1MmheWiXM9Tf2S1cBtcCccTgmIjwznHNGbwYyUekDFOwuiBCWxMvPWu0y3J22es7ZyP9O2K2HiPhP-YwNVYp8JezJpI7LJPtgexQP_sgPh3-4LIr028Ti8VlGcWRd8joCyeJfpungjlBSg_jqviwGY_fvxOvc7pUPYr8IK_Gcvw1jIRFpfBWbPaND9qaRLZIT5X8',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Verification Context
              const Text(
                'Enter Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface,
                  height: 30 / 24,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'We sent a 6-digit code to ',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant,
                    height: 24 / 16,
                  ),
                  children: [
                    TextSpan(
                      text: '+91 98XXX XXXXX',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // OTP Input Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 48,
                    height: 56,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      onChanged: (val) => _onChanged(val, index),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onSurface,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.surface,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColors.outlineVariant,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColors.primaryContainer,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              
              // Timer Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.schedule,
                    size: 20,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '00:45',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.outline,
                      ),
                    ),
                  ),
                  Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.outline,
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Action Button
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteNames.roleSelect);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: AppColors.onPrimary,
                  elevation: 0, // match shadow-sm behavior (or small shadow)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 48), // touch-target-min
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 24 / 18,
                  ),
                ),
                child: const Text('Verify & Continue'),
              ),
              const SizedBox(height: 16), // mt-stack-md
              Text(
                "Didn't receive the code? Check your SMS or try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.onSurfaceVariant.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
