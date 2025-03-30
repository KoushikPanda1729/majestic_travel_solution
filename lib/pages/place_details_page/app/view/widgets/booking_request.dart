// import 'package:flutter/material.dart';
// import 'package:majestic_travel_solution/commons/constants/app_images.dart';

// class BookingRequestScreen extends StatelessWidget {
//   const BookingRequestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           'Request to book',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Hotel Card
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade200),
//                 ),
//                 child: Row(
//                   children: [
//                     // Hotel Image
//                     ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           bottomLeft: Radius.circular(12),
//                         ),
//                         child: Image.asset(AppImages.restaurant1)),
//                     // Hotel Details
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'BDT 8,562',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const Text(
//                               'Star Pacific Sylhet',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 const Text(
//                                   '4.0',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Row(
//                                   children: List.generate(
//                                     5,
//                                     (index) => Icon(
//                                       Icons.star,
//                                       size: 14,
//                                       color: index < 4
//                                           ? Colors.amber
//                                           : Colors.grey.shade300,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Your trip section
//               const Text(
//                 'Your trip',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Dates
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Dates',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Sun, 16 Aug to Wed, 19 Aug',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Edit',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Guests
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Guests',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         '2 guests',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Edit',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 24),

//               // Price details section
//               const Text(
//                 'Price details',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Price breakdown
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         '\$160 x 2 nights',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.info_outline,
//                         size: 16,
//                         color: Colors.grey.shade400,
//                       ),
//                     ],
//                   ),
//                   const Text(
//                     '\$320',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Cleaning fee',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.info_outline,
//                         size: 16,
//                         color: Colors.grey.shade400,
//                       ),
//                     ],
//                   ),
//                   const Text(
//                     '\$40',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Service fee',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.info_outline,
//                         size: 16,
//                         color: Colors.grey.shade400,
//                       ),
//                     ],
//                   ),
//                   const Text(
//                     '\$10',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Occupancy taxes & fees',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.info_outline,
//                         size: 16,
//                         color: Colors.grey.shade400,
//                       ),
//                     ],
//                   ),
//                   const Text(
//                     '\$25',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Divider
//               const Divider(thickness: 1),
//               const SizedBox(height: 16),

//               // Total
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total(USD)',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '\$450',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 24),

//               // Add Coupon
//               const Text(
//                 'Add Coupon',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 8),

//               // Coupon TextField
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter a coupon',
//                   hintStyle: TextStyle(color: Colors.grey.shade400),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 12,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Request to book button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Request to book',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/select_payments_methods.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBar(
                leadingIcon: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingButton(
                        onPressed: () {
                          context.pop();
                        },
                        iconPath: AppIcons.angleRight,
                        isRotated: true,
                        backgroundColor: Colors.black.withOpacity(0.1),
                        iconColor: Colors.black,
                        isDisabled: false,
                        buttonSize: 42,
                        iconSize: 18,
                        boxShadow: false,
                      ),
                      const Text(
                        "Request to book",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                trailingIcon: const SizedBox(),
              ),
              // Hotel Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    // Hotel Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        AppImages.restaurant1,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Hotel Details
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'BDT 8,562',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Star Pacific Sylhet',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Text(
                                  '4.0',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      size: 14,
                                      color: index < 4
                                          ? Colors.amber
                                          : Colors.grey.shade300,
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

              const SizedBox(height: 24),

              // Trip Details
              _buildDetailSection(title: 'Your trip'),
              _buildEditableRow(
                  title: 'Dates', value: 'Sun, 16 Aug to Wed, 19 Aug'),
              _buildEditableRow(title: 'Guests', value: '2 guests'),

              const SizedBox(height: 24),

              // Price Details
              _buildDetailSection(title: 'Price details'),
              _buildPriceRow('Price', '\$320'),
              _buildPriceRow('Cleaning fee', '\$40'),
              _buildPriceRow('Service fee', '\$10'),
              _buildPriceRow('Taxes & fees', '\$25'),

              const Divider(thickness: 1),
              const SizedBox(height: 16),
              _buildPriceRow('Total (USD)', '\$450', isBold: true),

              const SizedBox(height: 24),
              _buildDetailSection(title: 'Add Coupon'),
              AlphaNumericTextfieldWidget(
                onTextChanged: (value) {},
                labelText: "Enter coupon code",
              ),
              const SizedBox(height: 24),
              SolidButtonWidget(
                label: "Request to book",
                onPressed: () {
                  openCustomBottomSheet(
                    context: context,
                    child: const SelectPaymentMethodWidget(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEditableRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
