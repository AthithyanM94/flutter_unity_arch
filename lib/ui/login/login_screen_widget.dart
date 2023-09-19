import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:lume_ox_app/bloc/auth/auth_bloc.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:validators/validators.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late AuthBloc _authBloc;

  final TextEditingController _textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // bool _visible = false;
  // bool _rememberMe = false;

  bool _isEmailCorrect = false;

  late double _containerHeight;
  late double _containerWidth;

  @override
  void initState() {
    _authBloc = BlocProvider.of(context);
    //_authBloc.add(NavigateToLoginEvent());

    super.initState();

    // Future<void>.delayed(
    //     const Duration(milliseconds: 100),
    //         () => setState(() {
    //       _visible = !_visible;
    //     }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _containerHeight = MediaQuery.of(context).size.height;
    _containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: _containerHeight,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  image: DecorationImage(
                      image: AssetImage(context.resources.drawable.appBG),
                      fit: BoxFit.cover,
                      opacity: 0.3)),
              child: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(context.resources.drawable.roboLottie,
                          height: _containerHeight * 0.3,
                          width: _containerWidth * 0.3),
                      Text(context.resources.strings!.signInSubText,
                          style: context.resources.style.bigHeadingTextStyle),
                      SizedBox(
                        height: _containerHeight * 0.05,
                      ),
                      signInPanel(),
                      SizedBox(
                        height: _containerHeight * 0.1,
                      ),
                      //loginButton(),
                      signUpFooter(),
                      // KeyboardVisibilityBuilder(builder: (context, visible) {
                      //   if (kDebugMode) {
                      //     setState(() {
                      //       _isKeyboardOn = visible;
                      //     });
                      //     print('Keyboard is : {$visible}');
                      //   }
                      //   return Container();
                      // }),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget signUpFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.resources.strings!.noAccountText,
          style: context.resources.style.bottomTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            context.resources.strings!.noAccountEmail,
            style: context.resources.style.linkTextStyle,
          ),
        )
      ],
    );
  }

  Widget loginButton() {
    //if (isEmailCorrect) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    context.resources.dimension.edgeDefaultMargin)),
            backgroundColor: context.resources.color.colorAccent,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5, vertical: 20)
            // padding: EdgeInsets.only(
            //     left: 120, right: 120, top: 20, bottom: 20),
            ),
        onPressed: _isEmailCorrect
            ? () {
                if (!_isEmailCorrect) return;

                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  _authBloc.add(AuthRequestedEvent("", ""));
                }
              }
            : null,
        child: Text(
          context.resources.strings!.signIn,
          style: context.resources.style.whiteTextStyle,
        ));
  }

  Widget signInPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: _containerHeight * 0.4,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: context.resources.dimension.bigMargin,
                    right: context.resources.dimension.bigMargin,
                    bottom: context.resources.dimension.bigMargin,
                    top: context.resources.dimension.bigMargin),
                child: TextFormField(
                  controller: _textEditingController,
                  onChanged: (val) {
                    setState(() {
                      _isEmailCorrect = isEmail(val);
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            context.resources.dimension.edgeDefaultMargin))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            context.resources.dimension.edgeDefaultMargin))),
                    prefixIcon: Icon(
                      Icons.person,
                      color: context.resources.color.colorAccent,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: context.resources.strings!.emailLabel,
                    hintText: context.resources.strings!.emailPlaceholder,
                    labelStyle: context.resources.style.headingTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.resources.dimension.bigMargin,
                    right: context.resources.dimension.bigMargin),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (val) {},
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(
                              context.resources.dimension.edgeDefaultMargin))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(
                              context.resources.dimension.edgeDefaultMargin))),
                      prefixIcon: Icon(
                        Icons.person,
                        color: context.resources.color.colorAccent,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: context.resources.strings!.passwordLabel,
                      hintText: context.resources.strings!.passwordPlaceholder,
                      labelStyle: context.resources.style.headingTextStyle,
                    ),
                    validator: (value) {
                      if (value!.isEmpty && value!.length < 5) {
                        return 'Enter a valid password';
                        {
                          return null;
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: _containerHeight * 0.05,
              ),
              loginButton()
            ],
          ),
        ),
      ],
    );
  }
}
