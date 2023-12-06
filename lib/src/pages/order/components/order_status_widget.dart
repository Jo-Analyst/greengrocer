import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverDue;
  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOverDue,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _StatusDot(
          isActive: true,
          title: "Pedido Confirmado",
        ),
        _StatusDot(
          isActive: false,
          title: "Pedido Confirmado",
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  const _StatusDot({required this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        // Texto
        Expanded(child: Text(title))
      ],
    );
  }
}