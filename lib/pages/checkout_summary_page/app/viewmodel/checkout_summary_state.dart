class CheckoutState {
  final int currentStep;
  final bool isLoading;
  final List<Map<String, String>> members;
  final Map<String, dynamic> checkoutData;

  CheckoutState({
    this.currentStep = 0,
    this.isLoading = false,
    this.members = const [
      {
        "name": "Asha Yadav",
        "gender": "Female",
        "age": "35",
        "selected": "true"
      },
      {
        "name": "Kunal Yadav",
        "gender": "Male",
        "age": "40",
        "selected": "false"
      },
      {
        "name": "Ayush Yadav",
        "gender": "Male",
        "age": "8",
        "selected": "false"
      },
      {
        "name": "Sunita Yadav",
        "gender": "Female",
        "age": "60",
        "selected": "false"
      },
      {
        "name": "Mohanlal Yadav",
        "gender": "Male",
        "age": "69",
        "selected": "false"
      },
    ],
    this.checkoutData = const {
      'selectedTests': [],
      'selectedMember': null,
      'schedule': {'date': null, 'time': null},
      'address': null,
      'couponCode': null,
      'subTotal': '₹1399',
      'discount': '-₹500',
      'totalPayable': '₹899',
    },
  });

  CheckoutState copyWith({
    int? currentStep,
    bool? isLoading,
    List<Map<String, String>>? members,
    Map<String, dynamic>? checkoutData,
  }) {
    return CheckoutState(
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      members: members ?? this.members,
      checkoutData: checkoutData ?? this.checkoutData,
    );
  }
}
