import 'package:anilove/pages/HomePage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/chooseRole': (context) => ChooseRolePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/signIn': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/donate': (context) => DonatePage(),
      },
    );
  }
}

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  late Razorpay _razorpay;
  TextEditingController _amountController = TextEditingController();
  int selectedAmount = 0;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    }
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      _razorpay.clear();
    }
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Successful");
    Navigator.pop(
        context); // Navigate back to HomePage after successful payment
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("External Wallet: ${response.walletName}");
  }

  void openCheckout(int amount) {
    if (kIsWeb) {
      // Handle web-specific payment logic or show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Razorpay is not supported on Web.')),
      );
      return;
    }

    var options = {
      'key': 'rzp_test_GcZZFDPP0jHtC4', // Replace with your Razorpay key
      'amount': amount * 100, // Amount in paise
      'name': 'AniLove Organization',
      'description': 'Donation',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _amountController.text = amount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Now'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donate Now',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You are donating to AniLove Organization',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                _buildAmountTile(100),
                _buildAmountTile(500),
                _buildAmountTile(1000),
                _buildAmountTile(2000),
              ],
            ),
            SizedBox(height: 20),
            Center(child: Text('or', style: TextStyle(fontSize: 16))),
            Divider(),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter the price Manually',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  selectedAmount = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAmount > 0) {
                    openCheckout(selectedAmount);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid amount')),
                    );
                  }
                },
                child: Text('Donate via Razorpay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountTile(int amount) {
    return GestureDetector(
      onTap: () => _selectAmount(amount),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedAmount == amount ? Colors.green : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          '₹$amount',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
