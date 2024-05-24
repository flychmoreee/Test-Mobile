import 'package:flutter/material.dart';
import 'login_page.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    ));

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late Size mediaSize;
  TextEditingController usernameController = TextEditingController();
  TextEditingController nisController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var usernameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(
            top: 80,
            child: _buildTop(),
          ),
          Positioned(
            bottom: 0,
            child: _buildBottom(),
          ),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Selamat Datang !",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Daftar Di Sini !",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        _buildBlackText("Masukkan Nama Lengkap Anda"),
        _buildInputField(usernameController),
        const SizedBox(
          height: 20,
        ),
        _buildBlackText("Masukkan NIS anda"),
        _buildInputField(nisController),
        const SizedBox(
          height: 20,
        ),
        _buildBlackText("Masukkan Password anda"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(
          height: 20,
        ),
        _buildLoginButton(),
        const SizedBox(
          height: 30,
        ),
        _buildLogin("Sudah Punya Akun ? Login Disini"),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

 Widget _buildBlackText(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ],
  );
}


  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username: ${usernameController.text}");
        debugPrint("No Nis: ${nisController.text}");
        debugPrint("Password: ${passwordController.text}");
         Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(40),
      ),
      child: const Text("Sign Up"),
    );
  }

 Widget _buildLogin(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Sudah Punya Akun ? ',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      GestureDetector(
        onTap: () {
          // Mencet pindah
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text(
          'Login Disini',
          style: TextStyle(
            color: Colors.blue[900],
          ),
        ),
      ),
    ],
  );
}

}
