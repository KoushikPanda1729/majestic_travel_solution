import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class HealthScoreForm extends StatefulWidget {
  const HealthScoreForm({super.key});

  @override
  State<HealthScoreForm> createState() => _HealthScoreFormState();
}

class _HealthScoreFormState extends State<HealthScoreForm> {
  int currentStep = 0;
  Map<String, String?> selectedAnswers = {};
  Map<String, List<String>> multipleSelectedAnswers = {};

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Are you a vegetarian?",
      "options": [
        "Non-Veg (4-6 times a week)",
        "Occasional Non-Veg (1-3 times a week)",
        "Veg but no dairy products",
        "Yes, Vegetarian"
      ]
    },
    {
      "question":
          "How many days per week do you exercise for 30 minutes or more?",
      "options": [
        "5 or more times a week",
        "3-4 times a week",
        "2 or less times a week",
        "No physical activity"
      ]
    },
    {
      "question": "How many times do you eat outside/junk food?",
      "options": [
        "Sometimes (Once or twice a month)",
        "Occasional (Once in two weeks)",
        "On every weekend",
        "2-3 times a week",
        "Almost everyday"
      ]
    },
    {
      "question": "How many hours of sleep do you get on average per night?",
      "options": ["7-9 hours", "6-7 hours", "5-6 hours", "Less than 5 hours"]
    },
    {
      "question": "Do you smoke or consume tobacco?",
      "options": ["No, never", "Occasionally", "Regularly", "Yes, daily"]
    },
    {
      "question": "How often do you consume alcohol?",
      "options": [
        "Never",
        "Occasionally (Once a month or less)",
        "Socially (1-2 times a week)",
        "Frequently (3+ times a week)"
      ]
    },
    {
      "question": "How much water do you drink daily?",
      "options": [
        "More than 2 liters",
        "1-2 liters",
        "Less than 1 liter",
        "Rarely drink water"
      ]
    },
    {
      "question":
          "Do you have a habit of consuming sugary drinks (soda, juice, etc.)?",
      "options": [
        "Never",
        "Occasionally (Once a month or less)",
        "Regularly (Few times a week)",
        "Daily"
      ]
    },
    {
      "question": "How often do you feel stressed or anxious?",
      "options": ["Rarely", "Sometimes", "Frequently", "Almost all the time"]
    },
    {
      "question": "Do you have a routine health check-up?",
      "options": ["Annually", "Once every 2-3 years", "Only when sick", "Never"]
    },
    {
      "question": "Do you have a family history of any disease?",
      "options": [
        "No",
        "Kidney diseases",
        "Hepatic/renal failures",
        "Gall stone/gall bladder problems",
        "Cancer",
        "Diabetes",
        "Hypertension",
        "High Cholesterol",
        "Heart diseases",
        "Thyroid"
      ],
      "multiple": true
    }
  ];

  void _onOptionSelected(String question, String option, bool multiple) {
    setState(() {
      if (multiple) {
        multipleSelectedAnswers.putIfAbsent(question, () => []);

        if (multipleSelectedAnswers[question]!.contains(option)) {
          multipleSelectedAnswers[question]!.remove(option);
          if (multipleSelectedAnswers[question]!.isEmpty) {
            multipleSelectedAnswers.remove(question); // Remove empty list
          }
        } else {
          multipleSelectedAnswers[question]!.add(option);
        }
      } else {
        selectedAnswers[question] = option;
      }

      // Recalculate progress bar
      currentStep = selectedAnswers.length + multipleSelectedAnswers.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () {
                context.pop();
              },
              iconPath: AppIcons.angleSmallRight,
              backgroundColor: AppColors.white,
              iconColor: AppColors.black,
              isDisabled: false,
              buttonSize: 42,
              iconSize: 20,
              isRotated: true,
            ),
            trailingIcon: const SizedBox(),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 11,
                    child: LinearProgressIndicator(
                      value: currentStep / questions.length,
                      backgroundColor: const Color(0xFFD1EDEB),
                      valueColor: const AlwaysStoppedAnimation(Colors.teal),
                      minHeight: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tell us about your lifestyle",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mulish",
                        )),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "$currentStep",
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mulish",
                        ),
                        children: [
                          TextSpan(
                            text: "/${questions.length}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Mulish",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: questions.map((question) {
                    bool isMultiple = question.containsKey("multiple") &&
                        question["multiple"] == true;
                    return _buildQuestion(
                        question["question"], question["options"], isMultiple);
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SolidButtonWidget(
              label: "Get Your Health Score",
              onPressed: () {
                context.push("/score_list");
              },
              isCircle: true,
            ),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _buildQuestion(String question, List<String> options, bool multiple) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish",
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 13),
        Column(
          children: options.map((option) {
            return GestureDetector(
              onTap: () => _onOptionSelected(question, option, multiple),
              child: Container(
                height: 34,
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: multiple
                      ? null
                      : Border.all(color: const Color(0xFFD1EDEB)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4), // Your custom padding
                  child: Row(
                    children: [
                      multiple
                          ? Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                      color: Color(0xFFD1EDEB),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              child: Checkbox(
                                side: const BorderSide(
                                  color: Color(0xFFD1EDEB),
                                  width: 2,
                                ),
                                value: multipleSelectedAnswers[question]
                                        ?.contains(option) ??
                                    false,
                                onChanged: (value) => _onOptionSelected(
                                    question, option, multiple),
                                activeColor: Colors.teal,
                              ),
                            )
                          : RadioTheme(
                              data: RadioThemeData(
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Colors
                                        .teal; // Change the fill color when selected
                                  }
                                  return const Color(0xFFD1EDEB);
                                }),
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Radio<String>(
                                value: option,
                                groupValue: selectedAnswers[question],
                                onChanged: (value) => _onOptionSelected(
                                    question, value!, multiple),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                      const SizedBox(
                          width: 8), // Space between checkbox/radio and text
                      Text(
                        option,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Mulish",
                          color: Color(0xFF727272),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
