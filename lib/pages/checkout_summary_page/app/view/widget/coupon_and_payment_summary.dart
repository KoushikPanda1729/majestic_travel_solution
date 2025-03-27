import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class CouponAndPaymentSummary extends StatelessWidget {
  final VoidCallback onViewCoupons;
  final String subTotal;
  final String discount;
  final String totalPayable;

  const CouponAndPaymentSummary({
    super.key,
    required this.onViewCoupons,
    required this.subTotal,
    required this.discount,
    required this.totalPayable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Coupon',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish",
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.coupon,
                colorFilter: const ColorFilter.mode(
                  AppColors.orange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: AlphaNumericTextfieldWidget(
                  hintText: "Enter Coupon Code",
                  borderNone: true,
                  onTextChanged: (value) {},
                ),
              ),
              SizedBox(
                width: 110,
                height: 35,
                child: SolidButtonWidget(
                  label: "View Coupons",
                  onPressed: onViewCoupons,
                  isCircle: true,
                ),
              ),
            ],
          ),
          _buildDottedDivider(),
          const SizedBox(height: 14),
          const Row(
            children: [
              Text(
                'Payment',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Mulish",
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Mulish",
                  fontSize: 16,
                  color: AppColors.teal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildPaymentRow('Sub Total', subTotal),
          const SizedBox(height: 4),
          _buildPaymentRow('Discount', discount, isDiscount: true),
          const SizedBox(height: 11),
          _buildDottedDivider(),
          const SizedBox(height: 5),
          _buildPaymentRow('Total Payable', totalPayable, isBold: true),
        ],
      ),
    );
  }

  Widget _buildDottedDivider() {
    return DottedBorder(
      color: Colors.grey,
      dashPattern: const [6, 4],
      strokeWidth: 1.5,
      padding: EdgeInsets.zero,
      customPath: (size) {
        return Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width, size.height);
      },
      child: const SizedBox(width: double.infinity),
    );
  }

  Widget _buildPaymentRow(String label, String amount,
      {bool isBold = false, bool isDiscount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 16 : 12,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            color: isDiscount ? Colors.teal : Colors.black,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isBold ? 16 : 12,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.teal : Colors.black,
            fontFamily: "Mulish",
          ),
        ),
      ],
    );
  }
}
