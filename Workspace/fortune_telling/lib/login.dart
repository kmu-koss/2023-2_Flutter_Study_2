import 'package:flutter/material.dart';
import 'components/circle_image.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
enum Gender { MAN, WOMAN }
enum Calendar { SOLAR, LUNAR }

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Gender? _gender = Gender.MAN;
    Calendar? _calendar = Calendar.SOLAR;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fortune Telling'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            constraints: const BoxConstraints.expand(width: 350, height: 600),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/background/moon_bg.jpg'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleImage(
                imageRadius: 100,
                imageProvider: AssetImage('icon/fortune-telling.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('오늘의 운세', style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge),
      ),
      //1.  남, 여 radio
      Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile<Gender>(
                    title: const Text('남자'),
                    value: Gender.MAN,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        // Update map value on tap
                        _gender = value;
                      });
                    },
                  ),
                ), Expanded(
                  child: RadioListTile<Gender>(
                    title: const Text('여자'),
                    value: Gender.WOMAN,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        // Update map value on tap
                        _gender = value;
                      });
                    },
                  ),
                ),

              ],
            ),
      ),
      // 2. 생년월일 입력란
      Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: '생년월일'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '생년월일을 입력해주세요';
                }
                return null;
              },
            ),
      ),
      //1.  남, 여 radio
      Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile<Calendar>(
                    title: const Text('양력'),
                    value: Calendar.SOLAR,
                    groupValue: _calendar,
                    onChanged: (value) {
                      setState(() {
                        // Update map value on tap
                        _calendar = value;
                        debugPrint(_calendar as String?);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<Calendar>(
                    title: const Text('음력'),
                    value: Calendar.LUNAR,
                    groupValue: _calendar,
                    onChanged: (value) {
                      setState(() {
                        // Update map value on tap
                        _calendar = value;
                      });
                    },
                  ),
                ),
              ],
            ),
      ),

      Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (emailController.text != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Invalid Credentials')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill input')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
      ),
      ],
    ),),
          ),
        )
    ,
    )
    ,
    );
  }
}