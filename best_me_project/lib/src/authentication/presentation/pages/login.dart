import 'package:best_me_project/core/common/custom_button.dart';
import 'package:best_me_project/core/common/form_input.dart';
import 'package:best_me_project/src/authentication/domain/usecases/user_sign_in.dart';
import 'package:best_me_project/src/authentication/presentation/bloc/auth_bloc.dart';
import 'package:best_me_project/src/authentication/presentation/widgets/welcome_widget.dart';
import 'package:best_me_project/core/constants/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final String imgLink =
      "https://s3-alpha-sig.figma.com/img/873d/783a/f8cb09bfa0735f1b922bee0d07173270?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dLTE3VbrjeMARWobie2fOWAADjlkgL1S0fLWp3ueispJb8c2rqikDz92WRSFKXLoTry0MXXGGEWiwlEw8KaVsfYGHgUVfPJkFT6evwVn7UwPZ2x9JKePVVzJBE2qsR-D3dA4tB9yGEupDv7Qe14MK-qujVRl2qnMY9pblQphrRU4UMqvSPd0Uq1oaVliWx4Uw8~-q44-kfOBbRe17rgpgtTF4kkWuaSGrU87K5wIgIQugtwpZSGU2oMx-VarH8hrr-Uqv3bEKcKGl0ApodaN~fjUhDEWFLFClEY5QKKrsNm2gYcjQ8EZ7nRc~YAW0t91eeawCRsA9KpUmM~l4vsOKg__";
  @override
  void dispose() {
    _userController.dispose();
    _userFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imgLink,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const WelcomeWidget(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 46, right: 46, top: 78),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Đăng nhập'.toUpperCase(),
                        style: GoogleFonts.inter(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormInput(
                              textController: _userController,
                              textFocusNode: _userFocusNode,
                              hintText: 'Nhập Email/Số điện thoại',
                              icon: Icons.person,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FormInput(
                              textController: _passwordController,
                              textFocusNode: _passwordFocusNode,
                              hintText: 'Mật khẩu',
                              icon: Icons.lock,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Text(
                        'Quên mật khẩu?',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff1F26B4),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        // Remove constant because fnc is not constant
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignInEvent(
                                    username: _userController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
