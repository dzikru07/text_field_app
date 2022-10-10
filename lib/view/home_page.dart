import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _newPass;
  late TextEditingController _repPass;

  @override
  void initState() {
    super.initState();
    _newPass = TextEditingController();
    _repPass = TextEditingController();
  }

  @override
  void dispose() {
    _newPass.dispose();
    _repPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Colors.black,
          onPressed: (() {
            final snackBar = SnackBar(
              content: Text(_newPass.text == _repPass.text
                  ? 'Login Success'
                  : 'passwords are not the same'),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('images/login_accent.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/top_accent.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'NEW',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Image.asset(
                                  'images/text_accent.png',
                                  width: 200,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('PASSWORD',
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Color(0xffFF3E3E),
                                        fontWeight: FontWeight.w800))
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffF0F0F0),
                                    blurRadius: 40,
                                    offset: Offset(0, 20))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _newPass,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'New Password',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color(0xffF0F0F0),
                                    blurRadius: 40,
                                    offset: const Offset(0, 20))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _repPass,
                            style: TextStyle(
                              color: _newPass.text == _repPass.text
                                  ? Colors.black
                                  : Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Repeat New Password',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  'images/bottom_accent.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
