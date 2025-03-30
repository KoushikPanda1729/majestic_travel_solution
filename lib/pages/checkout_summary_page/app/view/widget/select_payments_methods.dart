import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class SelectPaymentMethodWidget extends StatefulWidget {
  const SelectPaymentMethodWidget({super.key});

  @override
  _SelectPaymentMethodWidgetState createState() =>
      _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const Text(
                  "Select Payment Method",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish",
                  ),
                ),
                FloatingButton(
                  onPressed: () {
                    context.pop();
                  },
                  iconPath: AppIcons.crossSmall,
                  backgroundColor: AppColors.white,
                  iconColor: AppColors.teal,
                  isDisabled: false,
                  buttonSize: 42,
                  iconSize: 18,
                  isRotated: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Payment Methods List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                PaymentMethodItem(
                  image: AppIcons.phonePe,
                  title: "PhonePe",
                  value: "PhonePe",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value;
                    });
                  },
                ),
                PaymentMethodItem(
                  image: AppIcons.googlePay,
                  title: "Google Pay",
                  value: "Google Pay",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value;
                    });
                  },
                ),
                PaymentMethodItem(
                  image: AppIcons.paytm,
                  title: "Paytm",
                  value: "Paytm",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: SolidButtonWidget(
                    label: "Continue",
                    onPressed: selectedMethod != null
                        ? () {
                            context.push('/payment_success');
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const PaymentMethodItem({
    required this.image,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 23),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightTeal.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(image, width: 24, height: 24),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColors.teal,
          ),
        ],
      ),
    );
  }
}
