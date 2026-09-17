import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Tombol lebar penuh dengan efek tekan (scale-down) seperti
/// `active:scale-[0.985]` di versi HTML.
class PrimaryCtaButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryCtaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.add,
  });

  @override
  State<PrimaryCtaButton> createState() => _PrimaryCtaButtonState();
}

class _PrimaryCtaButtonState extends State<PrimaryCtaButton> {
  bool _pressed = false;

  void _setPressed(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.985 : 1.0,
        duration: const Duration(milliseconds: 90),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 140, 98, 57),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: AppColors.onPrimary, size: 20),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.onPrimary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
