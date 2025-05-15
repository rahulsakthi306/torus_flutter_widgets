import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/checkbox_group.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/creditecardform.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/placepicker.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/qr_viewer.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/signature.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/slidable_listtile.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/toggleicon.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Inputs/textfield.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/scanner/scanner.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/timer/circular_time.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/timer/timer.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  // final GlobalKey<FormState> _form = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<CreditCardFormState> _creditCardFormKey = GlobalKey();
  late TabController _tabController;
   List<Map<String, String>> rawData = [
      {"name": "Amrish", "value": "6600"},
      {"name": "Dominic", "value": "4600"},
      {"name": "Parama", "value": "3600"},
      {"name": "Mari", "value": "3600"},
    ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final formState = _creditCardFormKey.currentState;
    if (formState != null && formState.validate()) {
      final formData = formState.getFormData();
      debugPrint('Form Data: $formData');
      // showDialog(
      //   context: context,
      //   builder: (_) => AlertDialog(
      //     title: const Text('Form Submitted'),
      //     content: Text('Card Number: ${formData['card_number']}\n'
      //         'Expiry Date: ${formData['expiry_date']}\n'
      //         'CVV: ${formData['cvv']}'),
      //   ),
      // );
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
         body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TTextField(),
            // CreditCardForm(key: _creditCardFormKey),
            // const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: _submitForm,
            //   child: const Text('Submit'),
            // ),
          ],
        ),
      ),
        
        
        //  Column(
        //   children: [
        //     CreditCardForm(),
        //     ElevatedButton(onPressed: () => {
        //       if(_form.currentState!.validate()){
        //         print('form validation')
        //       }
        //     } ,
        //      child: 
        //     Text('text')
        //     )
        //   ],
        // )
        
        );
    
  }
}
