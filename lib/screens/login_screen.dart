import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('images/register-logo.png'),
                ),
                SizedBox(height: 30.0),
                _buildTextField("SỐ ĐIỆN THOẠI", "Nhập số điện thoại"),
                _buildPasswordTextField("MẬT KHẨU", "Nhập mật khẩu"),
                SizedBox(height: 16.0),
                _buildRegisterButton(context),
                SizedBox(height: 8.0),
                _buildAdditionalOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Color(0xFF073f84)),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField(String label, String hint) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Color(0xFF073f84)),
          ),
          TextField(
            obscureText: _isPasswordObscured,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
                icon: Icon(
                  _isPasswordObscured ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text("ĐĂNG NHẬP", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildAdditionalOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            // Xử lý sự kiện khi nhấn vào "Quên mật khẩu"
          },
          child: Text(
            "Quên mật khẩu",
            style: TextStyle(color: Color(0xFF073f84)),
          ),
        ),
        SizedBox(width: 8.0),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text("Đăng ký", style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
