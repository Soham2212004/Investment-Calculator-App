// ignore_for_file: sdk_version_since

import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final String githubUrl = 'https://github.com/Soham2212004';
final String linkedinUrl = 'https://www.linkedin.com/in/soham-soni-2342b4239';
final String credlyUrl = 'https://www.credly.com/users/soni-soham';
final String instagramUrl = 'https://www.instagram.com/_soham_soni_';
final String cloudUrl =
    'https://www.cloudskillsboost.google/public_profiles/6ebb4fad-af6b-4520-8d47-8a16a23a0df4';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static ThemeData currentTheme = ThemeData.dark(); // Default light theme

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment Calculator App',
      theme: currentTheme, // Use the current theme
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
      routes: {
        '/sipCalculator': (context) => SIPCalculator(),
        '/emiCalculator': (context) => EMICalculator(),
        '/gstCalculator': (context) => GSTCalculator(),
        '/ageCalculator': (context) => AgeCalculator(),
        '/bmiCalculator': (context) => BmiCalculator(),
        '/conversionCalculator': (context) => ConversionCalculator(),
        '/gpaCalculator': (context) => GpaCalculatorScreen(),
        '/percentageCalculator': (context) => PercentageCalculator(),
        '/SI/CICalculator': (context) => SiCiCalculator(),
        'factorialCalculator': (context) => FactorialCalculator(),
        'pcCalculator': (context) => PCCalculator(),
        'exponentCalculator': (context) => ExponentCalculator(),
        'probabilityCalculator': (context) => ProbabilityCalculator(),
        '/monthlyCalculator': (context) => MonthlyCalculator(),
        '/fdCalculator': (context) => FDCalculator(),
        '/logCalculator': (context) => LogCalculator(),
        '/currencyCalculator': (context) => CurrencyCalculator(),
        '/averageCalculator': (context) => AverageCalculator(),
        '/calenderCalculator': (context) => CalendarCalculator(),
        '/simpleCalculator': (context) => MyCalculator(),
      },
    );
  }

  static void setAppTheme(ThemeData theme) {
    currentTheme = theme; // Set the new theme
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1; // Index 0 for "History" tab initially
  bool _isDarkMode = true; // Define _isDarkMode variable

  final List<Widget> _children = [
    Mathspage(),
    CalculatorsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Calculator App'),
        actions: [],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: _isDarkMode
              ? Colors.grey[900]
              : Colors.white, // Adjust background color based on theme
        ),
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            // width: 30, // Define the width of the image
            // height: 30, // Define the height of the image
            // child: Image.asset('assets/maths.png'),
            label: 'Maths',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class CalculatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 20,
      children: [
        Column(
          children: [
            CalculatorItem(
              label: "SIP Calculator", //done
              image: AssetImage('assets/SIP.jpg'),
              onTap: () {
                Navigator.pushNamed(context, '/sipCalculator');
              },
            ),
            Text(
              'SIP Calculator',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "Lumpsum Calculator", //done
              image: AssetImage('assets/lumpsum.png'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LumpsumCalculator()),
                );
              },
            ),
            Text(
              'Lumpsum Calculator',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "Monthly Savings Calculator", //done
              image: AssetImage('assets/savings.png'),
              onTap: () {
                Navigator.pushNamed(context, '/monthlyCalculator');
              },
            ),
            Text('Savings Calculator',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                )),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "FD Calculator",
              image: AssetImage('assets/fd.jpg'),
              onTap: () {
                Navigator.pushNamed(context, '/fdCalculator');
              },
            ),
            Text('FD Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "EMI Calculator", //done
              image: AssetImage('assets/emi.png'),
              onTap: () {
                Navigator.pushNamed(context, '/emiCalculator');
              },
            ),
            Text('EMI Calculator', //done
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "GST Calculator", //done
              image: AssetImage('assets/gst.jpg'),
              onTap: () {
                Navigator.pushNamed(context, '/gstCalculator');
              },
            ),
            Text('GST Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            CalculatorItem(
              label: "Currency Calculator", //done
              image: AssetImage('assets/currency.png'),
              onTap: () {
                Navigator.pushNamed(context, '/currencyCalculator');
              },
            ),
            Text('Currency Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
      ],
    );
  }
}

class CalculatorItem extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;
  final String label;

  const CalculatorItem({
    Key? key,
    required this.image,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(6), // Add margin for spacing between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90, // Adjust the width of the image container
              height: 90, // Adjust the height of the image container
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mathsitem extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;
  final String label;

  const Mathsitem({
    Key? key,
    required this.image,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(6), // Add margin for spacing between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90, // Adjust the width of the image container
              height: 90, // Adjust the height of the image container
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mathspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 20,
      children: [
        Column(
          children: [
            Mathsitem(
              label: "Simple Calculator", //done
              image: AssetImage('assets/scientific.png'),
              onTap: () {
                Navigator.pushNamed(context, '/simpleCalculator');
              },
            ),
            Text(
              'Simple Calculator',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Age Calculator", //done
              image: AssetImage('assets/age.png'),
              onTap: () {
                Navigator.pushNamed(context, '/ageCalculator');
              },
            ),
            Text(
              'Age Calculator',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Bmi Calculator", //done
              image: AssetImage('assets/bmi.png'),
              onTap: () {
                Navigator.pushNamed(context, '/bmiCalculator');
              },
            ),
            Text('Bmi Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Percentage Calculator",
              image: AssetImage('assets/percentage.png'),
              onTap: () {
                Navigator.pushNamed(context, '/percentageCalculator');
              },
            ),
            Text('Percentage Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Conversion Calculator",
              image: AssetImage('assets/conversion.png'),
              onTap: () {
                Navigator.pushNamed(context, '/conversionCalculator');
              },
            ),
            Text('Conversion Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "GPA Calculator", //done
              image: AssetImage('assets/gpa.png'),
              onTap: () {
                Navigator.pushNamed(context, '/gpaCalculator');
              },
            ),
            Text('GPA Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "SI/CI Calculator",
              image: AssetImage('assets/si.png'),
              onTap: () {
                Navigator.pushNamed(context, '/SI/CICalculator');
              },
            ),
            Text('SI/CI Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Factorial Calculator",
              image: AssetImage('assets/factorial.png'),
              onTap: () {
                Navigator.pushNamed(context, 'factorialCalculator');
              },
            ),
            Text('Factorial Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "PC Calculator",
              image: AssetImage('assets/pc.png'),
              onTap: () {
                Navigator.pushNamed(context, 'pcCalculator');
              },
            ),
            Text('PC Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Exponent Calculator",
              image: AssetImage('assets/exponent.png'),
              onTap: () {
                Navigator.pushNamed(context, 'exponentCalculator');
              },
            ),
            Text('Exponent Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Probability Calculator",
              image: AssetImage('assets/probability.png'),
              onTap: () {
                Navigator.pushNamed(context, 'probabilityCalculator');
              },
            ),
            Text('Probability Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Log Calculator",
              image: AssetImage('assets/log.png'),
              onTap: () {
                Navigator.pushNamed(context, '/logCalculator');
              },
            ),
            Text('Log Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Average Calculator",
              image: AssetImage('assets/average.png'),
              onTap: () {
                Navigator.pushNamed(context, '/averageCalculator');
              },
            ),
            Text('Average Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
        Column(
          children: [
            Mathsitem(
              label: "Calender Calculator",
              image: AssetImage('assets/calender.png'),
              onTap: () {
                Navigator.pushNamed(context, '/calenderCalculator');
              },
            ),
            Text('Calender Calculator',
                style: TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SettingState(),
    );
  }
}

class _SettingState extends StatelessWidget {
  int versionTapCount = 0;
  TextEditingController versionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            _showProfile(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Model Info'),
          onTap: () {
            _modelInfo(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.phone_android),
          title: Text('Version'),
          onTap: () {
            versionTapCount++;
            if (versionTapCount == 3) {
              _showVersionInfo(context);
              versionTapCount = 0;
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.feedback),
          title: Text('Feedback'),
          onTap: () {
            _feedback(context);
          },
        ),
      ],
    );
  }

  void _showVersionInfo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Version: v1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void _modelInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ModelInfoScreen()),
    );
  }

  void _feedback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FeedbackScreen()),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRatingSection(),
          SizedBox(height: 16.0),
          _buildFeedbackTextBox(),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Text(
            'Rating:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 16.0),
          _buildStarRating(),
        ],
      ),
    );
  }

  Widget _buildStarRating() {
    // You can use a package like flutter_rating_bar for star ratings
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: 32.0,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // Handle rating update here
      },
    );
  }

  Widget _buildFeedbackTextBox() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              maxLines: 5,
              maxLength: 150,
              decoration: InputDecoration(
                hintText: 'Write your feedback',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
              onSaved: (value) {
                // Save feedback here
              },
            ),
            SizedBox(
                height: 16.0), // Add space between TextFormField and button
            Center(
              // Center the button horizontally
              child: ElevatedButton(
                onPressed: () {
                  // Implement save functionality here
                },
                child: Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email ID'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Occupation'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Income'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                  height: 16.0), // Add space between text fields and button
              ElevatedButton(
                onPressed: () {
                  // Implement save functionality here
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModelInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Info'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildModelInfoItem('Name', 'Investment Calculator App'),
          _buildModelInfoItem('Version', '1'),
          _buildModelInfoItem('Country', 'India'),
          _buildModelInfoItem('Application Type', 'Mobile Application'),
          _buildModelInfoItem('Release Date', 'March 2024'),
          _buildModelInfoItem('Features', 'All Types Of Calculators'),
          _buildModelInfoItem('Technology', 'Flutter'),
          _buildModelInfoItem('Supported Platforms', 'Android'),
          _buildModelInfoItem('Language', 'Dart'),
          _buildModelInfoItem('Developer', 'SOHAM SONI', context),
        ],
      ),
    );
  }

  Widget _buildModelInfoItem(String title, String value,
      [BuildContext? context]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: value == 'SOHAM SONI' && context != null
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SocialMediaScreen()),
                    );
                  }
                : null,
            child: Text(
              value,
              style: value == 'SOHAM SONI'
                  ? TextStyle(color: Colors.blue)
                  : TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soham Soni'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/soham.gif'),
          ),
          SizedBox(height: 20),
          Text(
            'Soham Soni',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialMediaIcon(
                'assets/github.png',
                'https://github.com/sohamsoni',
              ),
              _buildSocialMediaIcon(
                'assets/linkedin.png',
                'https://www.linkedin.com/in/soham-soni',
              ),
              _buildSocialMediaIcon(
                'assets/credly.png',
                'https://www.credly.com/users/soni-soham',
              ),
              _buildSocialMediaIcon(
                'assets/instagram.png',
                'https://www.instagram.com/_soham_soni_',
              ),
              _buildSocialMediaIcon(
                'assets/cloud.png',
                'https://www.cloudskillsboost.google/public_profiles/6ebb4fad-af6b-4520-8d47-8a16a23a0df4',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcon(String assetPath, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset(
          assetPath,
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(
        uri.toString(),
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'Chrome': 'android.chrome'},
      );
    } else {
      print('Could not launch $url');
    }
  }
}

class SIPCalculator extends StatefulWidget {
  @override
  _SIPCalculatorState createState() => _SIPCalculatorState();
}

class _SIPCalculatorState extends State<SIPCalculator> {
  double _monthlyInvestment = 1000; // Default monthly investment value
  double _timePeriod = 5; // Default time period value
  double _expectedReturnRate = 12; // Default expected return rate in percentage
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  void openPdf(String pdfPath) async {
    if (pdfPath != '') {
      await OpenFile.open(pdfPath);
    }
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      // Handle the case when the user denies the permission
      if (await Permission.storage.shouldShowRequestRationale) {
        // Show a rationale to the user and request permission again
      } else {
        // Handle the case where the user has permanently denied the permission
        openAppSettings(); // Opens the app settings for the user to grant the permission manually
      }
    }
  }

  Future<void> _generatePdf() async {
    try {
      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String downloadsPath = downloadsDirectory.path;

        double totalInvestment = _monthlyInvestment * (_timePeriod * 12);
        double estimatedReturns = _calculateEstimatedReturns();
        double totalValue = totalInvestment + estimatedReturns;

        final ralewayFont = await pw.Font.ttf(
            await rootBundle.load('assets/fonts/Raleway-Regular.ttf'));
        final pdf = pw.Document(
          theme: pw.ThemeData.withFont(
            base: ralewayFont,
          ),
        );

        final image = pw.MemoryImage(
            (await rootBundle.load('assets/SIP.jpg')).buffer.asUint8List());
        final githubImage = pw.MemoryImage(
            (await rootBundle.load('assets/github.png')).buffer.asUint8List());
        final credlyImage = pw.MemoryImage(
            (await rootBundle.load('assets/credly.png')).buffer.asUint8List());
        final instagramImage = pw.MemoryImage(
            (await rootBundle.load('assets/instagram.png'))
                .buffer
                .asUint8List());
        final cloudImage = pw.MemoryImage(
            (await rootBundle.load('assets/cloud.png')).buffer.asUint8List());
        final linkedinImage = pw.MemoryImage(
            (await rootBundle.load('assets/linkedin.png'))
                .buffer
                .asUint8List());

        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return _buildPdfContent(
                context,
                image,
                githubImage,
                linkedinImage,
                credlyImage,
                instagramImage,
                cloudImage,
                _monthlyInvestment,
                _timePeriod,
                _expectedReturnRate,
                totalInvestment,
                estimatedReturns,
                totalValue,
                ralewayFont,
                githubUrl,
                linkedinUrl,
                credlyUrl,
                instagramUrl,
                cloudUrl,
              );
            },
          ),
        );

        final pdfBytes = await pdf.save();
        final pdfFile = File("$downloadsPath/sip_calculator.pdf");
        await pdfFile.writeAsBytes(pdfBytes);

        print("PDF generated successfully at ${pdfFile.path}");
        OpenFile.open(pdfFile.path);
      }
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }

  pw.Widget _buildPdfContent(
    pw.Context context,
    pw.MemoryImage image,
    pw.MemoryImage githubImage,
    pw.MemoryImage linkedinImage,
    pw.MemoryImage credlyImage,
    pw.MemoryImage instagramImage,
    pw.MemoryImage cloudImage,
    double monthlyInvestment,
    double timePeriod,
    double expectedReturnRate,
    double totalInvestment,
    double estimatedReturns,
    double totalValue,
    pw.Font ralewayFont,
    String githubUrl,
    String linkedinUrl,
    String credlyUrl,
    String instagramUrl,
    String cloudUrl,
  ) {
    return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(width: 1.0 // Border width
              ),
        ),
        child: pw.Padding(
            padding: pw.EdgeInsets.all(05), // Padding inside the border
            child: pw.Column(
              children: [
                pw.Text('SIP Calculator', style: pw.TextStyle(fontSize: 50)),
                pw.Divider(),
                pw.SizedBox(height: 20),
                pw.Center(
                    child: pw.SizedBox(
                  width: 100,
                  height: 100,
                  child: pw.Image(image),
                )),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.Text(
                  'Monthly Investment: ₹${_currencyFormatter.format(monthlyInvestment)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Time Period: ${timePeriod.toInt()} years',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Expected Return Rate(P.a): ${expectedReturnRate.toStringAsFixed(2)}%',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.Text(
                  'Total Investment: ${_currencyFormatter.format(totalInvestment)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Est. Returns: ₹${_currencyFormatter.format(estimatedReturns)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Total Value: ₹${_currencyFormatter.format(totalValue)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.SizedBox(height: 100),
                pw.UrlLink(
                  destination:
                      'https://groww.in/p/sip-systematic-investment-plan',
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'INVEST NOW',
                        style: pw.TextStyle(
                          font: ralewayFont,
                          fontSize: 45,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red900,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 100),
                pw.Divider(),
                pw.Text(
                  'This PDF is generated by Investment Calculator App Made by Soham Soni',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.UrlLink(
                      destination: githubUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(githubImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: linkedinUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(linkedinImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: credlyUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(credlyImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: instagramUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(instagramImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: cloudUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(cloudImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    double totalInvestment = _monthlyInvestment * (_timePeriod * 12);
    double estimatedReturns = _calculateEstimatedReturns();
    double totalValue = totalInvestment + estimatedReturns;

    return Scaffold(
      appBar: AppBar(
        title: Text('SIP Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Monthly Investment: ${_currencyFormatter.format(_monthlyInvestment)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _monthlyInvestment,
              min: 500,
              max: 500000,
              divisions: 999,
              label:
                  'Monthly Investment: ${_monthlyInvestment.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() {
                  _monthlyInvestment = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Time Period: ${_timePeriod.toInt()} years',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _timePeriod,
              min: 1,
              max: 30,
              divisions: 29,
              label: 'Time Period: ${_timePeriod.toInt()} years',
              onChanged: (value) {
                setState(() {
                  _timePeriod = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Expected Return Rate(P.a): ${_expectedReturnRate.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _expectedReturnRate,
              min: 1,
              max: 30,
              divisions: 290,
              label:
                  'Expected Return Rate: ${_expectedReturnRate.toStringAsFixed(2)}%',
              onChanged: (value) {
                setState(() {
                  _expectedReturnRate = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Total Investment: ${_currencyFormatter.format(totalInvestment)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Est. Returns: ${_currencyFormatter.format(estimatedReturns)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Value: ${_currencyFormatter.format(totalValue)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePdf,
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateEstimatedReturns() {
    double monthlyRateOfReturn = _expectedReturnRate / 12 / 100;
    int numberOfMonths = (_timePeriod * 12).toInt();

    double futureValueOfSIP = _monthlyInvestment *
        (pow(1 + monthlyRateOfReturn, numberOfMonths) - 1) /
        monthlyRateOfReturn *
        (1 + monthlyRateOfReturn);

    double totalInvestment = _monthlyInvestment * numberOfMonths;
    double estimatedReturns = futureValueOfSIP - totalInvestment;

    return estimatedReturns;
  }
}

class LumpsumCalculator extends StatefulWidget {
  @override
  _LumpsumCalculatorState createState() => _LumpsumCalculatorState();
}

class _LumpsumCalculatorState extends State<LumpsumCalculator> {
  double _totalInvestment = 100000; // Example total investment
  double _expectedReturnRate = 10; // Example expected return rate
  double _timePeriod = 5; // Example time period
  double _compoundedInterests = 1; // Example compounded interests
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  void openPdf(String pdfPath) async {
    if (pdfPath != '') {
      await OpenFile.open(pdfPath);
    }
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      // Handle the case when the user denies the permission
      if (await Permission.storage.shouldShowRequestRationale) {
        // Show a rationale to the user and request permission again
      } else {
        // Handle the case where the user has permanently denied the permission
        openAppSettings(); // Opens the app settings for the user to grant the permission manually
      }
    }
  }

  Future<void> _generatePdf() async {
    try {
      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String downloadsPath = downloadsDirectory.path;

        double monthlyRate = _expectedReturnRate / 100 / _compoundedInterests;
        double periods = _timePeriod * _compoundedInterests;

        double futureValue = _totalInvestment * pow((1 + monthlyRate), periods);

        final ralewayFont = await pw.Font.ttf(
            await rootBundle.load('assets/fonts/Raleway-Regular.ttf'));
        final pdf = pw.Document(
          theme: pw.ThemeData.withFont(
            base: ralewayFont,
          ),
        );

        final image = pw.MemoryImage(
            (await rootBundle.load('assets/lumpsum.png')).buffer.asUint8List());
        final githubImage = pw.MemoryImage(
            (await rootBundle.load('assets/github.png')).buffer.asUint8List());
        final credlyImage = pw.MemoryImage(
            (await rootBundle.load('assets/credly.png')).buffer.asUint8List());
        final cloudImage = pw.MemoryImage(
            (await rootBundle.load('assets/cloud.png')).buffer.asUint8List());
        final instagramImage = pw.MemoryImage(
            (await rootBundle.load('assets/instagram.png'))
                .buffer
                .asUint8List());
        final linkedinImage = pw.MemoryImage(
            (await rootBundle.load('assets/linkedin.png'))
                .buffer
                .asUint8List());
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return _buildPdfContent(
                context,
                image,
                githubImage,
                linkedinImage,
                credlyImage,
                instagramImage,
                cloudImage,
                _totalInvestment,
                _timePeriod,
                _expectedReturnRate,
                monthlyRate,
                periods,
                futureValue,
                _compoundedInterests,
                ralewayFont,
                githubUrl,
                linkedinUrl,
                credlyUrl,
                instagramUrl,
                cloudUrl,
              );
            },
          ),
        );
        final pdfBytes = await pdf.save();
        final pdfFile = File("$downloadsPath/lumpsum_calculator.pdf");
        await pdfFile.writeAsBytes(pdfBytes);

        print("PDF generated successfully at ${pdfFile.path}");
        OpenFile.open(pdfFile.path);
      }
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }

  pw.Widget _buildPdfContent(
    pw.Context context,
    pw.MemoryImage image,
    pw.MemoryImage githubImage,
    pw.MemoryImage linkedinImage,
    pw.MemoryImage credlyImage,
    pw.MemoryImage instagramImage,
    pw.MemoryImage cloudImage,
    double _totalInvestment,
    double _timePeriod,
    double _expectedReturnRate,
    double monthlyRate,
    double periods,
    double futureValue,
    double _compoundedInterests,
    pw.Font ralewayFont,
    String githubUrl,
    String linkedinUrl,
    String credlyUrl,
    String instagramUrl,
    String cloudUrl,
  ) {
    return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(width: 1.0 // Border width
              ),
        ),
        child: pw.Padding(
            padding: pw.EdgeInsets.all(05), // Padding inside the border
            child: pw.Column(
              children: [
                pw.Text('Lumpsum Calculator',
                    style: pw.TextStyle(fontSize: 40)),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Center(
                    child: pw.SizedBox(
                  width: 100,
                  height: 100,
                  child: pw.Image(image),
                )),
                pw.SizedBox(height: 10),
                pw.Divider(),
                pw.Text(
                  'Total Investment: ₹${_currencyFormatter.format(_totalInvestment)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Time Period: ${_timePeriod.toInt()} years',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Expected Return Rate(P.a): ${_expectedReturnRate.toStringAsFixed(2)}%',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.Text(
                  'Invested Amount: ${_currencyFormatter.format(_totalInvestment)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Est. Returns: ${_currencyFormatter.format(futureValue - _totalInvestment)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Total Value: ${_currencyFormatter.format(futureValue)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.SizedBox(height: 100),
                pw.UrlLink(
                  destination:
                      'https://groww.in/p/sip-systematic-investment-plan',
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'INVEST NOW',
                        style: pw.TextStyle(
                          font: ralewayFont,
                          fontSize: 45,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red900,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 100),
                pw.Divider(),
                pw.Text(
                  'This PDF is generated by Investment Calculator App Made by Soham Soni',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.SizedBox(height: 5),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.UrlLink(
                      destination: githubUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(githubImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: linkedinUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(linkedinImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: credlyUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(credlyImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: instagramUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(instagramImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: cloudUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(cloudImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  double calculateEstimatedReturns(
      double totalInvestment,
      double expectedReturnRate,
      double timePeriod,
      double compoundedInterests) {
    double monthlyRate = expectedReturnRate / 100 / compoundedInterests;
    double periods = timePeriod * compoundedInterests;

    double futureValue = totalInvestment * pow((1 + monthlyRate), periods);

    return futureValue - totalInvestment;
  }

  @override
  Widget build(BuildContext context) {
    double estimatedReturns = _calculateEstimatedReturns();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lumpsum Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Total Investment: ${_currencyFormatter.format(_totalInvestment)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _totalInvestment,
              min: 100000,
              max: 10000000,
              divisions: 990,
              label:
                  'Total Investment: ${_currencyFormatter.format(_totalInvestment)}',
              onChanged: (value) {
                setState(() {
                  _totalInvestment = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Expected Return Rate: ${_expectedReturnRate.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _expectedReturnRate,
              min: 1.0,
              max: 30.0,
              divisions: 290,
              label:
                  'Expected Return Rate: ${_expectedReturnRate.toStringAsFixed(2)}%',
              onChanged: (value) {
                setState(() {
                  _expectedReturnRate = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Time Period: ${_timePeriod.toStringAsFixed(2)} years',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _timePeriod,
              min: 1,
              max: 30,
              divisions: 29,
              label: 'Time Period: ${_timePeriod.toStringAsFixed(2)} years',
              onChanged: (value) {
                setState(() {
                  _timePeriod = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Invested Amount: ${_currencyFormatter.format(_totalInvestment)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Est. Returns: ${_currencyFormatter.format(estimatedReturns)}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Total Value: ${_currencyFormatter.format(_totalInvestment + estimatedReturns)}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePdf,
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateEstimatedReturns() {
    double monthlyRate = _expectedReturnRate / 100 / _compoundedInterests;
    double periods = _timePeriod * _compoundedInterests;

    double futureValue = _totalInvestment * pow((1 + monthlyRate), periods);

    return futureValue - _totalInvestment;
  }

  void main() {
    double totalInvestment = 100000;
    double expectedReturnRate = 10;
    double timePeriod = 5;
    double compoundedInterests = 1; // Assuming compounded yearly for simplicity

    double estimatedReturns = calculateEstimatedReturns(
        totalInvestment, expectedReturnRate, timePeriod, compoundedInterests);

    double totalValue = totalInvestment + estimatedReturns;

    print('Estimated Returns: ₹${estimatedReturns.toStringAsFixed(2)}');
    print('Total Value: ₹${totalValue.toStringAsFixed(2)}');
  }
}

class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  double _loanAmount = 100000; // Example loan amount
  double _rateOfInterest = 10; // Example rate of interest
  double _loanTenure = 5; // Example loan tenure
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  void openPdf(String pdfPath) async {
    if (pdfPath != '') {
      await OpenFile.open(pdfPath);
    }
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      // Handle the case when the user denies the permission
      if (await Permission.storage.shouldShowRequestRationale) {
        // Show a rationale to the user and request permission again
      } else {
        // Handle the case where the user has permanently denied the permission
        openAppSettings(); // Opens the app settings for the user to grant the permission manually
      }
    }
  }

  Future<void> _generatePdf() async {
    try {
      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String downloadsPath = downloadsDirectory.path;
        double monthlyInterest = _rateOfInterest / 100 / 12;
        double months = _loanTenure * 12;

        _monthlyEMI =
            (_loanAmount * monthlyInterest * pow(1 + monthlyInterest, months)) /
                (pow(1 + monthlyInterest, months) - 1);
        _principalAmount = _loanAmount;
        _totalInterest = (_monthlyEMI * months) - _loanAmount;
        _totalAmount = _principalAmount + _totalInterest;

        final ralewayFont = await pw.Font.ttf(
            await rootBundle.load('assets/fonts/Raleway-Regular.ttf'));
        final pdf = pw.Document(
          theme: pw.ThemeData.withFont(
            base: ralewayFont,
          ),
        );

        final image = pw.MemoryImage(
            (await rootBundle.load('assets/emi.png')).buffer.asUint8List());
        final githubImage = pw.MemoryImage(
            (await rootBundle.load('assets/github.png')).buffer.asUint8List());
        final credlyImage = pw.MemoryImage(
            (await rootBundle.load('assets/credly.png')).buffer.asUint8List());
        final instagramImage = pw.MemoryImage(
            (await rootBundle.load('assets/instagram.png'))
                .buffer
                .asUint8List());
        final cloudImage = pw.MemoryImage(
            (await rootBundle.load('assets/cloud.png')).buffer.asUint8List());
        final linkedinImage = pw.MemoryImage(
            (await rootBundle.load('assets/linkedin.png'))
                .buffer
                .asUint8List());
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return _buildPdfContent(
                context,
                image,
                githubImage,
                linkedinImage,
                credlyImage,
                instagramImage,
                cloudImage,
                _loanAmount,
                _rateOfInterest,
                _loanTenure,
                _monthlyEMI,
                _principalAmount,
                _totalInterest,
                _totalAmount,
                months,
                monthlyInterest,
                ralewayFont,
                githubUrl,
                linkedinUrl,
                credlyUrl,
                instagramUrl,
                cloudUrl,
              );
            },
          ),
        );
        final pdfBytes = await pdf.save();
        final pdfFile = File("$downloadsPath/emi_calculator.pdf");
        await pdfFile.writeAsBytes(pdfBytes);

        print("PDF generated successfully at ${pdfFile.path}");
        OpenFile.open(pdfFile.path);
      }
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }

  pw.Widget _buildPdfContent(
    pw.Context context,
    pw.MemoryImage image,
    pw.MemoryImage githubImage,
    pw.MemoryImage linkedinImage,
    pw.MemoryImage credlyImage,
    pw.MemoryImage instagramImage,
    pw.MemoryImage cloudImage,
    double _loanAmount,
    double _rateOfInterest,
    double _loanTenure,
    double _monthlyEMI,
    double _principalAmount,
    double _totalInterest,
    double _totalAmount,
    double monthlyInterest,
    double months,
    pw.Font ralewayFont,
    String githubUrl,
    String linkedinUrl,
    String credlyUrl,
    String instagramUrl,
    String cloudUrl,
  ) {
    return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(width: 1.0 // Border width
              ),
        ),
        child: pw.Padding(
            padding: pw.EdgeInsets.all(05), // Padding inside the border
            child: pw.Column(
              children: [
                pw.Text('EMI Calculator', style: pw.TextStyle(fontSize: 40)),
                pw.Divider(),
                pw.Center(
                    child: pw.SizedBox(
                  width: 100,
                  height: 100,
                  child: pw.Image(image),
                )),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.Text(
                  'Loan Amount: ${_currencyFormatter.format(_loanAmount)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Rate Of Interest: ${_rateOfInterest.toInt()} years',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Loan Tenure: ${_loanTenure.toStringAsFixed(2)}%',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.Text(
                  'Monthly EMI: ${_currencyFormatter.format(_monthlyEMI)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Principal Amount: ${_currencyFormatter.format(_principalAmount)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Total Interest: ${_currencyFormatter.format(_totalInterest)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Total Amount: ${_currencyFormatter.format(_totalAmount)}',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.SizedBox(height: 100),
                pw.UrlLink(
                  destination:
                      'https://groww.in/p/sip-systematic-investment-plan',
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'INVEST NOW',
                        style: pw.TextStyle(
                          font: ralewayFont,
                          fontSize: 45,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red900,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 100),
                pw.Divider(),
                pw.Text(
                  'This PDF is generated by Investment Calculator App Made by Soham Soni',
                  style: pw.TextStyle(
                      font: ralewayFont,
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(),
                pw.SizedBox(height: 5),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.UrlLink(
                      destination: githubUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(githubImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: linkedinUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(linkedinImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: credlyUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(credlyImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: instagramUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(instagramImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: cloudUrl,
                      child: pw.Column(
                        children: [
                          pw.Image(cloudImage, width: 30, height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  double _monthlyEMI = 0;
  double _principalAmount = 0;
  double _totalInterest = 0;
  double _totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    _calculateEMI();

    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Loan Amount: ${_currencyFormatter.format(_loanAmount)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _loanAmount,
              min: 100000,
              max: 10000000,
              divisions: 990,
              label: 'Loan Amount: ${_currencyFormatter.format(_loanAmount)}',
              onChanged: (value) {
                setState(() {
                  _loanAmount = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Rate Of Interest: ${_currencyFormatter.format(_rateOfInterest)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _rateOfInterest,
              min: 1.0,
              max: 30.0,
              divisions: 290,
              label:
                  'Rate Of Interest:  ${_currencyFormatter.format(_rateOfInterest)}',
              onChanged: (value) {
                setState(() {
                  _rateOfInterest = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            Text(
              'Loan Tenure: ${_currencyFormatter.format(_loanTenure)} years',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _loanTenure,
              min: 1,
              max: 30,
              divisions: 29,
              label:
                  'Loan Tenure: ${_currencyFormatter.format(_loanTenure)} years',
              onChanged: (value) {
                setState(() {
                  _loanTenure = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            // Similar sliders for Rate of Interest and Loan Tenure
            // Display calculated values below
            Text('Monthly EMI: ${_currencyFormatter.format(_monthlyEMI)}'),
            Text(
                'Principal Amount: ${_currencyFormatter.format(_principalAmount)}'),
            Text(
                'Total Interest: ${_currencyFormatter.format(_totalInterest)}'),
            Text(
              'Total Amount: ${_currencyFormatter.format(_totalAmount)}',
            ),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePdf,
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateEMI() {
    double monthlyInterest = _rateOfInterest / 100 / 12;
    double months = _loanTenure * 12;

    _monthlyEMI =
        (_loanAmount * monthlyInterest * pow(1 + monthlyInterest, months)) /
            (pow(1 + monthlyInterest, months) - 1);
    _principalAmount = _loanAmount;
    _totalInterest = (_monthlyEMI * months) - _loanAmount;
    _totalAmount = _principalAmount + _totalInterest;
  }
}

class GSTCalculator extends StatefulWidget {
  @override
  _GSTCalculatorState createState() => _GSTCalculatorState();
}

class _GSTCalculatorState extends State<GSTCalculator> {
  bool _isInclusive = true;
  double _originalAmount = 0.0;
  double _gstRate = 5.0;
  double _gstAmount = 0.0;
  double _netPrice = 0.0;
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  void _calculateGST() {
    if (_isInclusive) {
      _gstAmount =
          _originalAmount - (_originalAmount * (100 / (100 + _gstRate)));
      _netPrice = _originalAmount - _gstAmount;
    } else {
      _gstAmount = (_originalAmount * _gstRate) / 100;
      _netPrice = _originalAmount + _gstAmount;
    }
    setState(() {
      _gstAmount = double.parse(_gstAmount.toStringAsFixed(2));
      _netPrice = double.parse(_netPrice.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GST Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('GST Exclusive'),
                Radio(
                  value: false,
                  groupValue: _isInclusive,
                  onChanged: (value) {
                    setState(() {
                      _isInclusive = value as bool;
                    });
                  },
                ),
                Text('GST Inclusive'),
                Radio(
                  value: true,
                  groupValue: _isInclusive,
                  onChanged: (value) {
                    setState(() {
                      _isInclusive = value as bool;
                    });
                  },
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _originalAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<double>(
              value: _gstRate,
              items: [5, 12, 18, 28].map<DropdownMenuItem<double>>((value) {
                return DropdownMenuItem<double>(
                  value: value.toDouble(),
                  child: Text('$value%'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _gstRate = value ?? 0.0;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateGST,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Total GST: ${_currencyFormatter.format(_gstAmount)}'),
            _isInclusive
                ? Text(
                    'Pre GST Amount: ${_currencyFormatter.format(_netPrice)}')
                : Text(
                    'Post GST Amount: ${_currencyFormatter.format(_netPrice)}'),
          ],
        ),
      ),
    );
  }
}

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _currentDateController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Age Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _birthDateController,
                  decoration: InputDecoration(
                      labelText: 'Enter Birth Date (dd-mm-yyyy)'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _currentDateController,
                  decoration: InputDecoration(
                      labelText: 'Enter Current Date (dd-mm-yyyy)'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    calculateAge();
                  },
                  child: Text('Calculate Age'),
                ),
                SizedBox(height: 16.0),
                Text(
                  _result,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }

  void calculateAge() {
    String birthDate = _birthDateController.text.trim();
    String currentDate = _currentDateController.text.trim();

    if (birthDate.isNotEmpty && currentDate.isNotEmpty) {
      List<String> birthDateParts = birthDate.split('-').reversed.toList();
      List<String> currentDateParts = currentDate.split('-').reversed.toList();

      DateTime birthDateTime = DateTime(
        int.parse(birthDateParts[0]),
        int.parse(birthDateParts[1]),
        int.parse(birthDateParts[2]),
      );
      DateTime currentDateTime = DateTime(
        int.parse(currentDateParts[0]),
        int.parse(currentDateParts[1]),
        int.parse(currentDateParts[2]),
      );

      int years = currentDateTime.year - birthDateTime.year;
      int months = currentDateTime.month - birthDateTime.month;
      int days = currentDateTime.day - birthDateTime.day;

      if (days < 0) {
        int daysInPreviousMonth =
            DateTime(currentDateTime.year, currentDateTime.month, 0).day;
        days += daysInPreviousMonth;
        months--;
      }
      if (months < 0) {
        months += 12;
        years--;
      }

      int totalMonths = years * 12 + months;
      int totalWeeks = currentDateTime.difference(birthDateTime).inDays ~/ 7;
      int totalHours = currentDateTime.difference(birthDateTime).inHours;
      int totalMinutes = currentDateTime.difference(birthDateTime).inMinutes;
      int totalSeconds = currentDateTime.difference(birthDateTime).inSeconds;

      setState(() {
        _result = 'Age:\n$years years $months months $days days\n'
            'or $totalMonths months $days days\n'
            'or $totalWeeks weeks $days days\n'
            'or ${currentDateTime.difference(birthDateTime).inDays} days\n'
            'or $totalHours hours\n'
            'or $totalMinutes minutes\n'
            'or $totalSeconds seconds';
      });
    } else {
      setState(() {
        _result = 'Please enter valid dates';
      });
    }
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int age = 20;
  double heightCm = 170.0; // Default height in centimeters
  double weight = 70.0; // Default weight in kilograms
  String bmiResult = '';
  String conversionResult = '';
  String selectedParameter = 'Meters';
  double inputValue = 0.0;

  void calculateBmi() {
    double heightM =
        heightCm / 100; // Convert height from centimeters to meters
    double bmi = weight / (heightM * heightM);
    setState(() {
      if (bmi < 16) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Severe Thinness)';
      } else if (bmi >= 16 && bmi < 17) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Moderate Thinness)';
      } else if (bmi >= 17 && bmi < 18.5) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Mild Thinness)';
      } else if (bmi >= 18.5 && bmi < 25) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Normal)';
      } else if (bmi >= 25 && bmi < 30) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Overweight)';
      } else if (bmi >= 30 && bmi < 35) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Obese Class I)';
      } else if (bmi >= 35 && bmi < 40) {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Obese Class II)';
      } else {
        bmiResult = 'BMI: ${bmi.toStringAsFixed(1)} kg/m2 (Obese Class III)';
      }
    });
  }

  void convertToCm() {
    double result = 0.0;
    if (selectedParameter == 'Meters') {
      result = inputValue * 100;
    } else if (selectedParameter == 'Feet') {
      result = inputValue * 30.48;
    } else if (selectedParameter == 'Inches') {
      result = inputValue * 2.54;
    }
    setState(() {
      conversionResult =
          '${inputValue.toStringAsFixed(2)} $selectedParameter = ${result.toStringAsFixed(2)} cm';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('AGE'),
            Slider(
              value: age.toDouble(),
              min: 1,
              max: 100,
              divisions: 99,
              label: age.toString(),
              onChanged: (value) {
                setState(() {
                  age = value.round();
                });
              },
            ),
            Text('HEIGHT (cm)'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter height in centimeters',
              ),
              onChanged: (value) {
                heightCm = double.tryParse(value) ?? 0.0;
              },
            ),
            Text('WEIGHT (kg)'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter weight in kilograms',
              ),
              onChanged: (value) {
                weight = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateBmi,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            Text(
              bmiResult,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2.0),
            Text(
              'Unit Conversion',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedParameter,
              items: <String>['Meters', 'Feet', 'Inches'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedParameter = value!;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter value in $selectedParameter',
              ),
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertToCm,
              child: Text('Convert to cm'),
            ),
            SizedBox(height: 16.0),
            Text(
              conversionResult,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ConversionCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversion Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversionHomePage(),
    );
  }
}

class ConversionHomePage extends StatefulWidget {
  @override
  _ConversionHomePageState createState() => _ConversionHomePageState();
}

class _ConversionHomePageState extends State<ConversionHomePage> {
  String _selectedFromUnit = 'Meter';
  String _selectedToUnit = 'Meter';
  final List<String> _lengthUnits = [
    'Meter',
    'Kilometer',
    'Centimeter',
    'Millimeter',
    'Micrometer',
    'Nanometer',
    'Mile',
    'Yard',
    'Foot',
    'Inch',
    'Light Year'
  ];
  final List<String> _temperatureUnits = ['Celsius', 'Kelvin', 'Fahrenheit'];
  final List<String> _areaUnits = [
    'Square Meter',
    'Square Kilometer',
    'Square Centimeter',
    'Square Millimeter',
    'Square Micrometer',
    'Hectare',
    'Square Mile',
    'Square Yard',
    'Square Foot',
    'Square Inch',
    'Acre'
  ];

  final List<String> _weightunits = [
    'Kilogram',
    'Gram',
    'Milligram',
    'Matric Ton',
    'Pound',
    'Ounce'
  ];
  String _selectedTab = 'Length';
  TextEditingController _fromController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion Calculator'),
      ),
      body: Column(
        children: <Widget>[
          _buildTabBar(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildTabButton('Length'),
          _buildTabButton('Temperature'),
          _buildTabButton('Area'),
          _buildTabButton('Weight'),
        ],
      ),
    );
  }

  Widget _buildTabButton(String tabName) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTab = tabName;
          _updateSelectedUnits(tabName);
        });
      },
      child: Text(
        tabName,
        style: TextStyle(
          color: _selectedTab == tabName ? Colors.white : Colors.white70,
        ),
      ),
    );
  }

  void _updateSelectedUnits(String tabName) {
    switch (tabName) {
      case 'Length':
        _selectedFromUnit = _lengthUnits.first;
        _selectedToUnit = _lengthUnits.first;
        break;
      case 'Temperature':
        _selectedFromUnit = _temperatureUnits.first;
        _selectedToUnit = _temperatureUnits.first;
        break;
      case 'Area':
        _selectedFromUnit = _areaUnits.first;
        _selectedToUnit = _areaUnits.first;
        break;
      case 'Weight':
        _selectedFromUnit = _weightunits.first;
        _selectedToUnit = _weightunits.first;
        break;
      default:
        _selectedFromUnit = '';
        _selectedToUnit = '';
    }
  }

  Widget _buildTabContent() {
    List<String> units;
    switch (_selectedTab) {
      case 'Temperature':
        units = _temperatureUnits;
        break;
      case 'Area':
        units = _areaUnits;
        break;
      case 'Volume':
      case 'Weight':
        units = _weightunits;
        break;
      case 'Length':
      default:
        units = _lengthUnits;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('From:'),
                    DropdownButton<String>(
                      value: _selectedFromUnit,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedFromUnit = newValue!;
                        });
                      },
                      items:
                          units.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('To:'),
                    DropdownButton<String>(
                      value: _selectedToUnit,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedToUnit = newValue!;
                        });
                      },
                      items:
                          units.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _fromController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter value',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _result = _convert();
              });
            },
            child: Text('Convert'),
          ),
          SizedBox(height: 16.0),
          Text(
            _result,
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  String _convert() {
    double value = double.tryParse(_fromController.text) ?? 0.0;

    switch (_selectedTab) {
      case 'Length':
        return _convertLength(value);
      case 'Temperature':
        return _convertTemperature(value);
      case 'Area':
        return _convertArea(value);
      case 'Weight':
        return _convertWeight(value);
      default:
        return 'Conversion not supported';
    }
  }

  String _convertLength(double value) {
    Map<String, double> conversionFactors = {
      'Meter': 1.0,
      'Kilometer': 0.001,
      'Centimeter': 100.0,
      'Millimeter': 1000.0,
      'Micrometer': 1000000.0,
      'Nanometer': 1000000000.0,
      'Mile': 0.000621371,
      'Yard': 1.09361,
      'Foot': 3.28084,
      'Inch': 39.3701,
      'Light Year': 1.057e-16
    };

    double convertedValue = value *
        (conversionFactors[_selectedToUnit]! /
            conversionFactors[_selectedFromUnit]!);
    return convertedValue.toString();
  }

  String _convertTemperature(double value) {
    if (_selectedFromUnit == 'Celsius') {
      if (_selectedToUnit == 'Kelvin') {
        return (value + 273.15).toString();
      } else if (_selectedToUnit == 'Fahrenheit') {
        return ((value * 9 / 5) + 32).toString();
      }
    } else if (_selectedFromUnit == 'Kelvin') {
      if (_selectedToUnit == 'Celsius') {
        return (value - 273.15).toString();
      } else if (_selectedToUnit == 'Fahrenheit') {
        return ((value - 273.15) * 9 / 5 + 32).toString();
      }
    } else if (_selectedFromUnit == 'Fahrenheit') {
      if (_selectedToUnit == 'Celsius') {
        return ((value - 32) * 5 / 9).toString();
      } else if (_selectedToUnit == 'Kelvin') {
        return ((value - 32) * 5 / 9 + 273.15).toString();
      }
    }
    return value.toString();
  }

  String _convertArea(double value) {
    Map<String, double> conversionFactors = {
      'Square Meter': 1.0,
      'Square Kilometer': 1e-6,
      'Square Centimeter': 10000.0,
      'Square Millimeter': 1000000.0,
      'Square Micrometer': 1e12,
      'Hectare': 1e-4,
      'Square Mile': 3.861e-7,
      'Square Yard': 1.19599,
      'Square Foot': 10.7639,
      'Square Inch': 1550.0,
      'Acre': 0.000247105
    };

    double convertedValue = value *
        (conversionFactors[_selectedToUnit]! /
            conversionFactors[_selectedFromUnit]!);
    return convertedValue.toString();
  }

  String _convertWeight(double value) {
    Map<String, double> conversionFactors = {
      'Kilogram': 1.0,
      'Gram': 1000.0,
      'Milligram': 1000000.0,
      'Metric Ton': 0.001,
      'Pound': 2.20462,
      'Ounce': 35.274,
    };

    double convertedValue = value *
        (conversionFactors[_selectedToUnit]! /
            conversionFactors[_selectedFromUnit]!);
    return convertedValue.toString();
  }
}

class GpaCalculatorScreen extends StatefulWidget {
  @override
  _GpaCalculatorScreenState createState() => _GpaCalculatorScreenState();
}

class _GpaCalculatorScreenState extends State<GpaCalculatorScreen> {
  List<int> credits = [0];
  List<String> grades = ['O'];
  List<int> semesters = [1, 2]; // Default two rows
  List<double?> sgpas = [null, null];
  double gpa = 0.0;
  double cgpa = 0.0;

  Map<String, int> gradePoints = {
    'O': 10,
    'A+': 9,
    'A': 8,
    'B+': 7,
    'B': 6,
    'P': 5,
    'F': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: DataTable(
                  columnSpacing: 20,
                  columns: [
                    DataColumn(label: Text('Credits')),
                    DataColumn(label: Text('Grades')),
                    DataColumn(label: Text('')),
                  ],
                  rows: List.generate(
                    credits.length,
                    (index) => DataRow(cells: [
                      DataCell(
                        TextFormField(
                          initialValue: credits[index].toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              credits[index] = int.tryParse(value) ?? 1;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        DropdownButtonFormField<String>(
                          value: grades[index],
                          items: gradePoints.keys.map((String grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(grade),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              grades[index] = value ?? 'O';
                            });
                          },
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              credits.removeAt(index);
                              grades.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    credits.add(0);
                    grades.add('O');
                  });
                },
                child: Text('Add Row'),
              ),
              SizedBox(height: 20), // Added spacing between the buttons
              ElevatedButton(
                onPressed: calculateCgpa,
                child: Text('Calculate CGPA'),
              ),
              Text('CGPA: $cgpa'),
              SizedBox(height: 40),
              Divider(
                color: Colors.white,
                height: 1,
                thickness: 5,
              ),
              SizedBox(height: 5),
              Card(
                child: Column(
                  children: [
                    Card(
                      child: DataTable(
                        columnSpacing: 20,
                        columns: [
                          DataColumn(label: Text('Semester')),
                          DataColumn(label: Text('SGPA')),
                          DataColumn(label: Text('')),
                        ],
                        rows: List.generate(
                          semesters.length,
                          (index) => DataRow(cells: [
                            DataCell(TextFormField(
                              initialValue: semesters[index].toString(),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  semesters[index] = int.tryParse(value) ?? 1;
                                });
                              },
                            )),
                            DataCell(TextFormField(
                              initialValue: sgpas[index]?.toString() ?? '',
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  sgpas[index] = double.tryParse(value) ?? 0.0;
                                });
                              },
                            )),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    semesters.removeAt(index);
                                    sgpas.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          semesters.add(1);
                          sgpas.add(null);
                        });
                      },
                      child: Text('Add Row'),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: calculateCgpa,
                      child: Text('Calculate CGPA'),
                    ),
                    Text('CGPA: $cgpa'),
                    SizedBox(height: 40),
                    Divider(
                      color: Colors.white, // Set the divider color to white
                      height: 1, // Set the divider height
                      thickness: 5, // Set the divider thickness
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: Colors.white, // Set the text color to dark
                      ),
                ),
                child: Text(
                  'Grading Table',
                  style: TextStyle(
                      fontWeight:
                          FontWeight.w900), // Set the font weight to bold
                ),
              ),
              Card(
                child: DataTable(
                  columnSpacing: 80,
                  columns: [
                    DataColumn(label: Text('Grade')),
                    DataColumn(label: Text('Value')),
                  ],
                  rows: gradePoints.entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text(entry.key)),
                      DataCell(Text(entry.value.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calculate GPA based on user input
  void calculateGpa() {
    double totalCredits = credits.reduce((a, b) => a + b).toDouble();
    double totalGradePoints = 0.0;

    for (int i = 0; i < credits.length; i++) {
      totalGradePoints += credits[i] * gradePoints[grades[i]]!;
    }

    setState(() {
      gpa = totalCredits > 0 ? totalGradePoints / totalCredits : 0.0;
    });
  }

  void calculateCgpa() {
    double totalCredits = 0;
    double totalSgpas = 0;

    for (int i = 0; i < semesters.length; i++) {
      if (semesters[i] > 0 && sgpas[i] != null) {
        totalCredits += semesters[i];
        totalSgpas += (sgpas[i] ?? 0.0) * semesters[i];
      }
    }
    if (totalCredits > 0) {
      setState(() {
        cgpa = totalSgpas / totalCredits;
      });
    }
  }
}

class PercentageCalculator extends StatefulWidget {
  @override
  _PercentageCalculatorState createState() => _PercentageCalculatorState();
}

class _PercentageCalculatorState extends State<PercentageCalculator> {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();
  final TextEditingController input5Controller = TextEditingController();
  final TextEditingController input6Controller = TextEditingController();

  String result1 = '';
  String result2 = '';
  String result3 = '';

  void calculateSection1() {
    final double input1 = double.tryParse(input1Controller.text) ?? 0;
    final double input2 = double.tryParse(input2Controller.text) ?? 0;
    final double answer = (input1 / 100) * input2;
    setState(() {
      result1 = '$input1% of $input2 = $answer';
    });
  }

  void calculateSection2() {
    final double input3 = double.tryParse(input3Controller.text) ?? 0;
    final double input4 = double.tryParse(input4Controller.text) ?? 0;
    final double answer = (input3 / input4) * 100;
    setState(() {
      result2 = '$input3 is ${answer.toStringAsFixed(2)}% of $input4';
    });
  }

  void calculateSection3() {
    final double input5 = double.tryParse(input5Controller.text) ?? 0;
    final double input6 = double.tryParse(input6Controller.text) ?? 0;
    final double difference =
        ((input5 - input6).abs() / ((input5 + input6) / 2)) * 100;
    final double percentageChange = ((input6 - input5) / input5) * 100;
    setState(() {
      result3 =
          'Difference of $input5 and $input6 is ${difference.toStringAsFixed(2)}%.\n';
      if (percentageChange > 0) {
        result3 +=
            '$input6 is ${percentageChange.toStringAsFixed(2)}% increase of $input5.';
      } else {
        result3 +=
            '$input6 is ${percentageChange.abs().toStringAsFixed(2)}% decrease of $input5.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percentage Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section 1
              Text(
                'Section 1: Calculate Percentage of a Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: input1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Input 1'),
                    ),
                  ),
                  Text('% of'),
                  Expanded(
                    child: TextField(
                      controller: input2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Input 2'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: calculateSection1,
                child: Text('Calculate'),
              ),
              Text(result1),
              Divider(),

              // Section 2
              Text(
                'Section 2: Calculate What Percentage One Number is of Another',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: input3Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Input 1'),
                    ),
                  ),
                  Text('is what % of'),
                  Expanded(
                    child: TextField(
                      controller: input4Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Input 2'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: calculateSection2,
                child: Text('Calculate'),
              ),
              Text(result2),
              Divider(),

              // Section 3
              Text(
                'Section 3: Calculate Percentage Increase or Decrease',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: input5Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Value 1'),
              ),
              TextField(
                controller: input6Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Value 2'),
              ),
              ElevatedButton(
                onPressed: calculateSection3,
                child: Text('Calculate'),
              ),
              Text(result3),
            ],
          ),
        ),
      ),
    );
  }
}

class SiCiCalculator extends StatefulWidget {
  @override
  _SiCiCalculatorState createState() => _SiCiCalculatorState();
}

class _SiCiCalculatorState extends State<SiCiCalculator> {
  bool isSimpleInterest = true;
  double principal = 0.0;
  double rateOfInterest = 0.0;
  double timePeriod = 0.0;
  String compoundFrequency = 'Annually';
  String result = '';
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  void calculateInterest() {
    if (isSimpleInterest) {
      double totalAmount =
          principal * (1 + (rateOfInterest / 100) * timePeriod);
      double interest = totalAmount - principal;
      setState(() {
        result =
            'Simple Interest: Rs ${_currencyFormatter.format(interest)}\nTotal Amount: Rs ${_currencyFormatter.format(totalAmount)}';
      });
    } else {
      int n;
      switch (compoundFrequency) {
        case 'Daily':
          n = 365;
          break;
        case 'Weekly':
          n = 52;
          break;
        case 'Monthly':
          n = 12;
          break;
        case 'Quarterly':
          n = 4;
          break;
        case 'Half-Annually':
          n = 2;
          break;
        case 'Annually':
          n = 1;
          break;
        default:
          n = 1;
      }
      double totalAmount =
          principal * pow((1 + (rateOfInterest / 100) / n), n * timePeriod);
      double interest = totalAmount - principal;
      setState(() {
        result =
            'Compound Interest: Rs ${_currencyFormatter.format(interest)}\nTotal Amount: Rs ${_currencyFormatter.format(totalAmount)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SI/CI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isSimpleInterest,
                  onChanged: (value) {
                    setState(() {
                      isSimpleInterest = value!;
                    });
                  },
                ),
                Text('SI'),
                SizedBox(width: 20),
                Checkbox(
                  value: !isSimpleInterest,
                  onChanged: (value) {
                    setState(() {
                      isSimpleInterest = !value!;
                    });
                  },
                ),
                Text('CI'),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Principal Amount',
              ),
              onChanged: (value) {
                principal = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Rate of Interest (%)',
              ),
              onChanged: (value) {
                rateOfInterest = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Time Period (years)',
              ),
              onChanged: (value) {
                timePeriod = double.tryParse(value) ?? 0.0;
              },
            ),
            if (!isSimpleInterest)
              DropdownButton<String>(
                value: compoundFrequency,
                onChanged: (String? newValue) {
                  setState(() {
                    compoundFrequency = newValue!;
                  });
                },
                items: <String>[
                  'Daily',
                  'Weekly',
                  'Monthly',
                  'Quarterly',
                  'Half-Annually',
                  'Annually'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateInterest,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class FactorialCalculator extends StatefulWidget {
  @override
  _FactorialCalculatorState createState() => _FactorialCalculatorState();
}

class _FactorialCalculatorState extends State<FactorialCalculator> {
  int number = 0;
  String result = '';

  void calculateFactorial() {
    if (number < 0) {
      setState(() {
        result = 'Invalid input, please enter a non-negative number.';
      });
      return;
    }

    int factorial = 1;
    for (int i = 1; i <= number; i++) {
      factorial *= i;
    }

    setState(() {
      result = '$number! = $factorial';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factorial Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter a number',
              ),
              onChanged: (value) {
                number = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFactorial,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class PCCalculator extends StatefulWidget {
  @override
  _PCCalculatorState createState() => _PCCalculatorState();
}

class _PCCalculatorState extends State<PCCalculator> {
  int n = 0;
  int r = 0;
  String result = '';

  int factorial(int num) {
    if (num <= 1) return 1;
    return num * factorial(num - 1);
  }

  void calculatePermutation() {
    if (n >= r) {
      int permutation = factorial(n) ~/ factorial(n - r);
      setState(() {
        result = 'Permutation (P): $permutation';
      });
    } else {
      setState(() {
        result = 'Invalid input: n should be greater than or equal to r';
      });
    }
  }

  void calculateCombination() {
    if (n >= r) {
      int combination = factorial(n) ~/ (factorial(r) * factorial(n - r));
      setState(() {
        result = 'Combination (C): $combination';
      });
    } else {
      setState(() {
        result = 'Invalid input: n should be greater than or equal to r';
      });
    }
  }

  void calculateBoth() {
    if (n >= r) {
      int permutation = factorial(n) ~/ factorial(n - r);
      int combination = factorial(n) ~/ (factorial(r) * factorial(n - r));
      setState(() {
        result = 'Permutation (P): $permutation\nCombination (C): $combination';
      });
    } else {
      setState(() {
        result = 'Invalid input: n should be greater than or equal to r';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permutation and Combination Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter total number in set (n)',
              ),
              onChanged: (value) {
                n = int.tryParse(value) ?? 0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter number in each subset (r)',
              ),
              onChanged: (value) {
                r = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBoth,
              child: Text('Calculate Permutations and Combinations'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ExponentCalculator extends StatefulWidget {
  @override
  _ExponentCalculatorState createState() => _ExponentCalculatorState();
}

class _ExponentCalculatorState extends State<ExponentCalculator> {
  double base = 0;
  double exponent = 0;
  String result = '';

  void calculateExponent() {
    num calculatedValue = pow(base, exponent);
    setState(() {
      result = 'Result: $calculatedValue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exponent Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter base (a)',
              ),
              onChanged: (value) {
                setState(() {
                  base = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter exponent (n)',
              ),
              onChanged: (value) {
                setState(() {
                  exponent = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateExponent,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ProbabilityCalculator extends StatefulWidget {
  @override
  _ProbabilityCalculatorState createState() => _ProbabilityCalculatorState();
}

class _ProbabilityCalculatorState extends State<ProbabilityCalculator> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final TextEditingController _paController = TextEditingController();
  final TextEditingController _pbController = TextEditingController();

  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();

  String _input1Type = 'P(A)';
  String _input2Type = 'P(A)';

  double? _pa;
  double? _pb;
  double? _paComplement;
  double? _pbComplement;
  double? _paAndPb;
  double? _paOrPb;
  double? _paXorPb;
  double? _paUbComplement;
  double? _paNotB;
  double? _pbNotA;

  double? _section2Pa;
  double? _section2Pb;
  double? _section2PaComplement;
  double? _section2PbComplement;
  double? _section2PaAndPb;
  double? _section2PaOrPb;
  double? _section2PaXorPb;
  double? _section2PaUbComplement;

  void _calculateSection1() {
    if (_formKey1.currentState!.validate()) {
      setState(() {
        _pa = double.parse(_paController.text);
        _pb = double.parse(_pbController.text);
        _paComplement = 1 - _pa!;
        _pbComplement = 1 - _pb!;
        _paAndPb = _pa! * _pb!;
        _paOrPb = _pa! + _pb! - _paAndPb!;
        _paXorPb = _pa! + _pb! - 2 * _paAndPb!;
        _paUbComplement = 1 - _paOrPb!;
        _paNotB = _pa! * (1 - _pb!);
        _pbNotA = (1 - _pa!) * _pb!;
      });
    }
  }

  void _calculateSection2() {
    if (_formKey2.currentState!.validate()) {
      double input1 = double.parse(_input1Controller.text);
      double input2 = double.parse(_input2Controller.text);

      double? pa,
          pb,
          paComplement,
          pbComplement,
          paAndPb,
          paOrPb,
          paXorPb,
          paUbComplement;

      if (_input1Type == 'P(A\')') {
        paComplement = input1;
        pa = 1 - paComplement;
      } else if (_input1Type == 'P(B\')') {
        pbComplement = input1;
        pb = 1 - pbComplement;
      } else if (_input1Type == 'P(A∩B)') {
        paAndPb = input1;
      } else if (_input1Type == 'P(A∪B)') {
        paOrPb = input1;
      } else if (_input1Type == 'P(AΔB)') {
        paXorPb = input1;
      } else if (_input1Type == 'P((A∪B)\')') {
        paUbComplement = input1;
      } else if (_input1Type == 'P(A)') {
        pa = input1;
      } else if (_input1Type == 'P(B)') {
        pb = input1;
      }

      if (_input2Type == 'P(A\')') {
        paComplement = input2;
        pa = 1 - paComplement;
      } else if (_input2Type == 'P(B\')') {
        pbComplement = input2;
        pb = 1 - pbComplement;
      } else if (_input2Type == 'P(A∩B)') {
        paAndPb = input2;
      } else if (_input2Type == 'P(A∪B)') {
        paOrPb = input2;
      } else if (_input2Type == 'P(AΔB)') {
        paXorPb = input2;
      } else if (_input2Type == 'P((A∪B)\')') {
        paUbComplement = input2;
      } else if (_input2Type == 'P(A)') {
        pa = input2;
      } else if (_input2Type == 'P(B)') {
        pb = input2;
      }

      // Calculate other probabilities based on input
      pa ??= paComplement != null ? 1 - paComplement : null;
      pb ??= pbComplement != null ? 1 - pbComplement : null;

      if (pa != null && pb != null) {
        paAndPb = paAndPb ?? (pa * pb);
        paOrPb = paOrPb ?? (pa + pb - paAndPb!);
        paXorPb = paXorPb ?? (pa + pb - 2 * paAndPb);
        paUbComplement = paUbComplement ?? (1 - paOrPb!);
      }

      setState(() {
        _section2Pa = pa;
        _section2Pb = pb;
        _section2PaComplement = pa != null ? 1 - pa : null;
        _section2PbComplement = pb != null ? 1 - pb : null;
        _section2PaAndPb = paAndPb;
        _section2PaOrPb = paOrPb;
        _section2PaXorPb = paXorPb;
        _section2PaUbComplement = paUbComplement;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Probability Calculator')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Section 1: Calculate Basic Probabilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  TextFormField(
                    controller: _paController,
                    decoration: InputDecoration(labelText: 'P(A)'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value for P(A)';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pbController,
                    decoration: InputDecoration(labelText: 'P(B)'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value for P(B)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _calculateSection1,
                    child: Text('Calculate'),
                  ),
                ],
              ),
            ),
            if (_pa != null && _pb != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('P(A\') = 1 - P(A) = 1 - $_pa = $_paComplement'),
                  Text('P(B\') = 1 - P(B) = 1 - $_pb = $_pbComplement'),
                  Text('P(A∩B) = P(A) × P(B) = $_pa × $_pb = $_paAndPb'),
                  Text(
                      'P(A∪B) = P(A) + P(B) - P(A∩B) = $_pa + $_pb - $_paAndPb = $_paOrPb'),
                  Text(
                      'P(AΔB) = P(A) + P(B) - 2P(A∩B) = $_pa + $_pb - 2 × $_paAndPb = $_paXorPb'),
                  Text(
                      'P((A∪B)\') = 1 - P(A∪B) = 1 - $_paOrPb = $_paUbComplement'),
                  Text(
                      'P(A occur but NOT B) = P(A) × (1 - P(B)) = $_pa × (1 - $_pb) = $_paNotB'),
                  Text(
                      'P(B occur but NOT A) = (1 - P(A)) × P(B) = (1 - $_pa) × $_pb = $_pbNotA'),
                ],
              ),
            SizedBox(height: 32.0),
            Text('Section 2: Probability Solver for Two Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey2,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _input1Type,
                    decoration:
                        InputDecoration(labelText: 'Select first input type'),
                    items: [
                      'P(A)',
                      'P(B)',
                      'P(A\')',
                      'P(B\')',
                      'P(A∩B)',
                      'P(A∪B)',
                      'P(AΔB)',
                      'P((A∪B)\')'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _input1Type = newValue!;
                      });
                    },
                  ),
                  TextFormField(
                    controller: _input1Controller,
                    decoration: InputDecoration(labelText: 'First input value'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value for the first input';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _input2Type,
                    decoration:
                        InputDecoration(labelText: 'Select second input type'),
                    items: [
                      'P(A)',
                      'P(B)',
                      'P(A\')',
                      'P(B\')',
                      'P(A∩B)',
                      'P(A∪B)',
                      'P(AΔB)',
                      'P((A∪B)\')'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _input2Type = newValue!;
                      });
                    },
                  ),
                  TextFormField(
                    controller: _input2Controller,
                    decoration:
                        InputDecoration(labelText: 'Second input value'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value for the second input';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _calculateSection2,
                    child: Text('Calculate'),
                  ),
                ],
              ),
            ),
            if (_section2Pa != null && _section2Pb != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_section2Pa != null) Text('P(A) = $_section2Pa'),
                  if (_section2Pb != null) Text('P(B) = $_section2Pb'),
                  if (_section2PaComplement != null)
                    Text('P(A\') = $_section2PaComplement'),
                  if (_section2PbComplement != null)
                    Text('P(B\') = $_section2PbComplement'),
                  if (_section2PaAndPb != null)
                    Text('P(A∩B) = $_section2PaAndPb'),
                  if (_section2PaOrPb != null)
                    Text('P(A∪B) = $_section2PaOrPb'),
                  if (_section2PaXorPb != null)
                    Text('P(AΔB) = $_section2PaXorPb'),
                  if (_section2PaUbComplement != null)
                    Text('P((A∪B)\') = $_section2PaUbComplement'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class MonthlyCalculator extends StatefulWidget {
  @override
  _MonthlyCalculatorState createState() => _MonthlyCalculatorState();
}

enum CompoundingFrequency {
  Monthly,
  Quarterly,
  HalfYearly,
  Yearly,
}

class _MonthlyCalculatorState extends State<MonthlyCalculator> {
  double _amountOnMaturity = 500000;
  int _tenure = 5;
  double _rateOfInterest = 10;
  CompoundingFrequency _compoundingFrequency = CompoundingFrequency.Monthly;

  double _monthlyInvestment = 0;
  double _totalInterestEarned = 0;
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  void calculate() {
    // Calculate logic based on compounding frequency
    switch (_compoundingFrequency) {
      case CompoundingFrequency.Monthly:
        // Calculate Monthly Investment and Total Interest Earned for monthly compounding
        double monthlyRate = _rateOfInterest / 100 / 12;
        int totalMonths = _tenure * 12;

        _monthlyInvestment = (_amountOnMaturity * monthlyRate) /
            (pow(1 + monthlyRate, totalMonths) - 1);

        _totalInterestEarned =
            _amountOnMaturity - (_monthlyInvestment * totalMonths);
        break;

      case CompoundingFrequency.Quarterly:
        // Calculate Monthly Investment and Total Interest Earned for quarterly compounding
        _monthlyInvestment = (_amountOnMaturity /
                pow(1 + _rateOfInterest / 100 / 4, _tenure * 4)) /
            3;
        _totalInterestEarned =
            _amountOnMaturity - _monthlyInvestment * _tenure * 4 * 3;
        break;
      case CompoundingFrequency.HalfYearly:
        // Calculate Monthly Investment and Total Interest Earned for half-yearly compounding
        _monthlyInvestment = (_amountOnMaturity /
                pow(1 + _rateOfInterest / 100 / 2, _tenure * 2)) /
            6;
        _totalInterestEarned =
            _amountOnMaturity - _monthlyInvestment * _tenure * 2 * 6;
        break;
      case CompoundingFrequency.Yearly:
        // Calculate Monthly Investment and Total Interest Earned for yearly compounding
        _monthlyInvestment =
            (_amountOnMaturity / pow(1 + _rateOfInterest / 100, _tenure)) / 12;
        _totalInterestEarned =
            _amountOnMaturity - _monthlyInvestment * _tenure * 12;
        break;
    }
    setState(() {}); // Update UI with calculated values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Savings Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widgets for sliders and dropdowns to get user inputs
            Text(
              'Amount on Maturity: ${_currencyFormatter.format(_amountOnMaturity.round())}',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _amountOnMaturity,
              min: 500000,
              max: 50000000,
              divisions: 495,
              onChanged: (value) {
                setState(() {
                  _amountOnMaturity = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Tenure: ${_tenure} years',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _tenure.toDouble(),
              min: 1,
              max: 30,
              onChanged: (value) {
                setState(() {
                  _tenure = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Rate of Interest: ${_rateOfInterest}%',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _rateOfInterest,
              min: 1.0,
              max: 20.0,
              divisions: 19,
              onChanged: (value) {
                setState(() {
                  _rateOfInterest = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Compounding Frequency: ${_compoundingFrequency.name}',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<CompoundingFrequency>(
              value: _compoundingFrequency,
              onChanged: (value) {
                setState(() {
                  _compoundingFrequency = value!;
                });
              },
              items: CompoundingFrequency.values
                  .map<DropdownMenuItem<CompoundingFrequency>>(
                (CompoundingFrequency value) {
                  return DropdownMenuItem<CompoundingFrequency>(
                    value: value,
                    child: Text(value.name),
                  );
                },
              ).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                calculate();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Monthly Investment: ${_currencyFormatter.format(_monthlyInvestment.round())}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Interest Earned: ${_currencyFormatter.format(_totalInterestEarned.round())}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class FDCalculator extends StatefulWidget {
  @override
  _FDCalculatorState createState() => _FDCalculatorState();
}

class _FDCalculatorState extends State<FDCalculator> {
  double principal = 100000;
  double rateOfInterest = 1;
  double tenure = 1;
  String investmentType = 'Simple Interest';
  double investedAmount = 0;
  double estReturns = 0;
  double totalValue = 0;
  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  void calculateFD() {
    setState(() {
      investedAmount = principal;
      if (investmentType == 'Simple Interest') {
        totalValue = principal + (principal * rateOfInterest * tenure / 100);
        estReturns = totalValue - investedAmount;
      } else {
        totalValue = principal * pow((1 + rateOfInterest / 100), tenure);
        estReturns = totalValue - investedAmount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FD Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Principal Amount: ${_currencyFormatter.format(principal.round())}',
                style: TextStyle(fontSize: 18.0),
              ),
              Slider(
                value: principal,
                min: 100000,
                max: 10000000,
                divisions: 990,
                label: principal.round().toString(),
                onChanged: (value) {
                  setState(() {
                    principal = value;
                  });
                },
              ),
              Text(
                'Rate of Interest: ${_currencyFormatter.format(rateOfInterest)}%',
                style: TextStyle(fontSize: 18.0),
              ),
              Slider(
                value: rateOfInterest,
                min: 1,
                max: 30,
                divisions: 290,
                label: rateOfInterest.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    rateOfInterest = value;
                  });
                },
              ),
              Text(
                'Tenure (years): ${tenure.round()}',
                style: TextStyle(fontSize: 18.0),
              ),
              Slider(
                value: tenure,
                min: 1,
                max: 50,
                divisions: 49,
                label: tenure.round().toString(),
                onChanged: (value) {
                  setState(() {
                    tenure = value;
                  });
                },
              ),
              DropdownButton<String>(
                value: investmentType,
                items: <String>['Simple Interest', 'Compound Interest']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    investmentType = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calculateFD,
                child: Text('Calculate'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Invested Amount: ${_currencyFormatter.format(investedAmount)}',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Est. Returns: ${_currencyFormatter.format(estReturns)}',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Total Value: ${_currencyFormatter.format(totalValue)}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogCalculator extends StatefulWidget {
  @override
  _LogCalculatorState createState() => _LogCalculatorState();
}

class _LogCalculatorState extends State<LogCalculator> {
  final TextEditingController logBaseController = TextEditingController();
  final TextEditingController logValueController = TextEditingController();
  final TextEditingController antilogBaseController = TextEditingController();
  final TextEditingController antilogValueController = TextEditingController();
  String logResult = '';
  String antilogResult = '';

  void calculateLog() {
    final String baseInput = logBaseController.text;
    final double base = baseInput == 'e' ? e : double.tryParse(baseInput) ?? 0;
    final double value = double.tryParse(logValueController.text) ?? 0;

    if (base <= 0 || base == 1) {
      setState(() {
        logResult =
            'Invalid base. Base must be greater than 0 and not equal to 1.';
      });
      return;
    }

    if (value <= 0) {
      setState(() {
        logResult = 'Invalid value. Value must be greater than 0.';
      });
      return;
    }

    final calculatedLog = log(value) / log(base);
    setState(() {
      logResult = 'log_$base($value) = $calculatedLog';
    });
  }

  void calculateAntilog() {
    final double base = double.tryParse(antilogBaseController.text) ?? 0;
    final double value = double.tryParse(antilogValueController.text) ?? 0;

    if (base <= 0) {
      setState(() {
        antilogResult = 'Invalid base. Base must be greater than 0.';
      });
      return;
    }

    final calculatedAntilog = pow(base, value);
    setState(() {
      antilogResult = 'Antilog of $value with base $base is $calculatedAntilog';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log and Antilog Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Logarithm Calculator',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: logValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Input Value',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'log',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '=',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    logResult,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: logBaseController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Input Base',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateLog,
                child: Text('Calculate Log'),
              ),
              Divider(thickness: 2, height: 40),
              Text(
                'Antilogarithm Calculator',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: antilogValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Antilog Value',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: antilogBaseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Antilog Base',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateAntilog,
                child: Text('Calculate Antilog'),
              ),
              SizedBox(height: 20),
              Text(
                antilogResult,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyCalculator extends StatefulWidget {
  @override
  _CurrencyCalculatorState createState() => _CurrencyCalculatorState();
}

class _CurrencyCalculatorState extends State<CurrencyCalculator> {
  final List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'INR',
    'JPY',
    'CAD',
    'CHF',
    'AUD',
    'HKD',
    'SEK',
    'NOK',
    'DKK',
    'CNY',
    'SGD',
    'THB',
    'TRY',
    'RUB',
    'MYR',
    'PHP',
    'IDR',
  ];

  final Map<String, double> _currencyRates = {
    'USD': 1.0,
    'EUR': 0.92,
    'GBP': 0.71,
    'INR': 83.30,
    'JPY': 115.60,
    'CAD': 1.36,
    'CHF': 0.91,
    'AUD': 1.50,
    'HKD': 7.85,
    'SEK': 8.75,
    'NOK': 8.54,
    'DKK': 6.12,
    'CNY': 6.37,
    'SGD': 1.35,
    'THB': 32.44,
    'TRY': 14.67,
    'RUB': 63.31,
    'MYR': 4.17,
    'PHP': 50.83,
    'IDR': 14642.50,
  };

  String _inputCurrency = 'USD';
  String _outputCurrency = 'INR';
  double _inputValue = 0.0;
  double _outputValue = 0.0;

  final NumberFormat _numberFormat = NumberFormat('#,###.00', 'en_US');

  void _convertCurrency() {
    setState(() {
      _outputValue = (_inputValue * _currencyRates[_outputCurrency]!) /
          (_currencyRates[_inputCurrency]!);
    });
  }

  void _swapCurrencies() {
    setState(() {
      String temp = _inputCurrency;
      _inputCurrency = _outputCurrency;
      _outputCurrency = temp;
      _convertCurrency();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _inputCurrency,
                    items: _currencies
                        .map((currency) => DropdownMenuItem<String>(
                              child: Text(currency),
                              value: currency,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _inputCurrency = value!;
                        _convertCurrency();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Input Currency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      setState(() {
                        _inputValue = double.parse(value);
                        _convertCurrency();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Input Value',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _outputCurrency,
                    items: _currencies
                        .map((currency) => DropdownMenuItem<String>(
                              child: Text(currency),
                              value: currency,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _outputCurrency = value!;
                        _convertCurrency();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Output Currency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: TextEditingController(
                      text: _numberFormat.format(_outputValue),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Output Value',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _swapCurrencies,
                  child: Text('Swap'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: _numberFormat.format(_outputValue)));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Output Value Copied to Clipboard'),
                      ),
                    );
                  },
                  child: Text('Copy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AverageCalculator extends StatefulWidget {
  @override
  _AverageCalculatorState createState() => _AverageCalculatorState();
}

class _AverageCalculatorState extends State<AverageCalculator> {
  final TextEditingController _numbersController = TextEditingController();
  final TextEditingController _numbersXController = TextEditingController();
  final TextEditingController _averageValueController = TextEditingController();

  double? _average;
  double? _calculatedX;
  String? _averageCalculation;
  String? _xCalculation;

  void _calculateAverage() {
    final numbersString = _numbersController.text;
    final List<double> numbers = numbersString
        .split(',')
        .map((e) => double.tryParse(e.trim()) ?? 0)
        .toList();

    final double sum = numbers.fold(0, (prev, element) => prev + element);
    final count = numbers.length;
    final average = sum / count;

    setState(() {
      _average = average;
      _averageCalculation = '''
Average: $average
Average = Sum / Count
= $sum / $count
= $average
''';
    });
  }

  void _calculateX() {
    final numbersString = _numbersXController.text;
    final averageValue = double.tryParse(_averageValueController.text) ?? 0;
    final List<String> numbers =
        numbersString.split(',').map((e) => e.trim()).toList();
    final double sumWithoutX = numbers
        .where((e) => e != 'X')
        .map((e) => double.tryParse(e) ?? 0)
        .fold(0, (prev, element) => prev + element);
    final count = numbers.length;
    final double calculatedX = (averageValue * count) - sumWithoutX;

    setState(() {
      _calculatedX = calculatedX;
      _xCalculation = '''
Average Value = Sum of Numbers / Count
Sum of Numbers + X = Average Value * Count
X = (Average Value * Count) - Sum of Numbers
X = $calculatedX
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Average Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 1: Calculate Average
            Text(
              '=> Calculate Average',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _numbersController,
              decoration: InputDecoration(
                labelText: 'Enter numbers (comma separated)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateAverage,
              child: Text('Calculate Average'),
            ),
            if (_averageCalculation != null)
              Text(
                _averageCalculation!,
                style: TextStyle(fontSize: 16),
              ),
            Divider(),
            // Section 2: Calculate X
            Text(
              '=> Calculate X',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _numbersXController,
              decoration: InputDecoration(
                labelText: 'Enter numbers with X (comma separated)',
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _averageValueController,
              decoration: InputDecoration(
                labelText: 'Enter average value',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateX,
              child: Text('Calculate X'),
            ),
            if (_xCalculation != null)
              Text(
                _xCalculation!,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class CalendarCalculator extends StatefulWidget {
  @override
  _CalendarCalculatorState createState() => _CalendarCalculatorState();
}

class _CalendarCalculatorState extends State<CalendarCalculator> {
  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _yearController2 = TextEditingController();
  TextEditingController _daysController3 = TextEditingController();
  TextEditingController _yearController4 = TextEditingController();
  TextEditingController _monthController4 = TextEditingController();
  TextEditingController _dayController4 = TextEditingController();

  String _result1 = "";
  String _result2 = "";
  // String _result3 = "";
  String _result4 = "";

  @override
  void dispose() {
    _dateController1.dispose();
    _yearController2.dispose();
    _daysController3.dispose();
    _yearController4.dispose();
    _monthController4.dispose();
    super.dispose();
  }

  void _calculateDayOfWeek() {
    try {
      DateTime date = DateFormat('dd-MM-yyyy').parse(_dateController1.text);
      String dayOfWeek = DateFormat('EEEE').format(date);
      setState(() {
        _result1 = 'Day on ${_dateController1.text} was $dayOfWeek';
      });
    } catch (e) {
      setState(() {
        _result1 = 'Invalid date format. Please enter in dd-MM-yyyy format.';
      });
    }
  }

  void _calculateSimilarYear() {
    try {
      int year = int.parse(_yearController2.text);
      int similarYear = _findSimilarYear(year);
      setState(() {
        _result2 = '$year calendar is similar to $similarYear calendar';
      });
    } catch (e) {
      setState(() {
        _result2 = 'Invalid year. Please enter a valid year.';
      });
    }
  }

  int _findSimilarYear(int year) {
    bool isLeapYear(int y) {
      return (y % 4 == 0 && (y % 100 != 0 || y % 400 == 0));
    }

    int similarYear = year;
    bool isLeap = isLeapYear(year);
    while (true) {
      similarYear++;
      if (isLeap == isLeapYear(similarYear)) {
        break;
      }
    }
    return similarYear;
  }

  void _calculateSpecificDayDates() {
    try {
      int year = int.parse(_yearController4.text);
      int month = int.parse(_monthController4.text);
      String day = _dayController4.text.trim();
      List<int> dates = _findSpecificDayDates(year, month, day);
      setState(() {
        _result4 = '$day in $month/$year are on dates: ${dates.join(', ')}';
      });
    } catch (e) {
      setState(() {
        _result4 = 'Invalid input. Please enter valid values.';
      });
    }
  }

  List<int> _findSpecificDayDates(int year, int month, String day) {
    List<int> dates = [];
    DateTime date = DateTime(year, month, 1);
    while (date.month == month) {
      if (DateFormat('EEEE').format(date).toLowerCase() == day.toLowerCase()) {
        dates.add(date.day);
      }
      date = date.add(Duration(days: 1));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection1(),
            _buildSection2(),
            // _buildSection3(),
            _buildSection4(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('1. What day was on:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextField(
          controller: _dateController1,
          decoration: InputDecoration(hintText: 'Enter date (dd-MM-yyyy)'),
          keyboardType: TextInputType.datetime,
        ),
        ElevatedButton(
          onPressed: _calculateDayOfWeek,
          child: Text('Calculate'),
        ),
        Text(_result1, style: TextStyle(fontSize: 16)),
        Divider(),
      ],
    );
  }

  Widget _buildSection2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('2. Year\'s calendar similarity:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextField(
          controller: _yearController2,
          decoration: InputDecoration(hintText: 'Enter year'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: _calculateSimilarYear,
          child: Text('Calculate'),
        ),
        Text(_result2, style: TextStyle(fontSize: 16)),
        Divider(),
      ],
    );
  }

  Widget _buildSection4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('3. Dates of specific weekday:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextField(
          controller: _yearController4,
          decoration: InputDecoration(hintText: 'Enter year'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _monthController4,
          decoration: InputDecoration(hintText: 'Enter month'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _dayController4,
          decoration:
              InputDecoration(hintText: 'Enter day of week (e.g., Monday)'),
        ),
        ElevatedButton(
          onPressed: _calculateSpecificDayDates,
          child: Text('Calculate'),
        ),
        Text(_result4, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  var input = '';
  var output = '';
  List<String> history = [];
  bool showScientificButtons = false;

  _onButtonClicked(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "A") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = userinput.replaceAll('×', '*');
        userinput = userinput.replaceAll('÷', '/');
        userinput = userinput.replaceAll('π', '3.1415926535897932');
        userinput = userinput.replaceAll('e', '2.718281828459045');

        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        history.add('$input = $output');
        if (history.length > 5) {
          history.removeAt(0);
        }
      }
      input = output;
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: history
                        .map((e) => ListTile(
                              title: Text(e),
                            ))
                        .toList(),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    output,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    input,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          if (showScientificButtons)
            Column(
              children: [
                Row(
                  children: [
                    button("sin", Colors.black, Colors.blue),
                    button("cos", Colors.black, Colors.blue),
                    button("tan", Colors.black, Colors.blue),
                    button("√", Colors.black, Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    button("ln", Colors.black, Colors.blue),
                    button("log", Colors.black, Colors.blue),
                    button("π", Colors.black, Colors.blue),
                    button("e", Colors.black, Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    button("x^y", Colors.black, Colors.blue),
                    button("x!", Colors.black, Colors.blue),
                    button("(", Colors.black, Colors.blue),
                    button(")", Colors.black, Colors.blue),
                  ],
                ),
              ],
            ),
          Row(
            children: [
              button("Sci", Colors.black, Colors.orangeAccent),
              button("AC", Colors.black, Colors.orangeAccent),
              button("A", Colors.black, Colors.orangeAccent),
              button("÷", Colors.black, Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button("7", Colors.black, Colors.white),
              button("8", Colors.black, Colors.white),
              button("9", Colors.black, Colors.white),
              button("×", Colors.black, Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button("4", Colors.black, Colors.white),
              button("5", Colors.black, Colors.white),
              button("6", Colors.black, Colors.white),
              button("-", Colors.black, Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button("1", Colors.black, Colors.white),
              button("2", Colors.black, Colors.white),
              button("3", Colors.black, Colors.white),
              button("+", Colors.black, Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button("%", Colors.black, Colors.orangeAccent),
              button("0", Colors.black, Colors.white),
              button(".", Colors.black, Colors.white),
              button("=", Colors.orangeAccent, Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget button(text, color, tcolor, [bool isHistory = false]) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          if (isHistory) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: history
                      .map((e) => ListTile(
                            title: Text(e),
                          ))
                      .toList(),
                );
              },
            );
          } else if (text == "Sci") {
            setState(() {
              showScientificButtons = !showScientificButtons;
            });
          } else {
            _onButtonClicked(text);
          }
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: tcolor),
        ),
      ),
    );
  }
}
