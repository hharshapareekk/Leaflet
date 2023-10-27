import 'package:books/pages/loginSeller.dart';
import 'package:flutter/material.dart';

class loginCustomer extends StatefulWidget {
  const loginCustomer({super.key});

  @override
  State<loginCustomer> createState() => _loginCustomerState();
}

class _loginCustomerState extends State<loginCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/assets/bg.jpg'),
          fit: BoxFit.cover, //NOT WORKING AS REQUIRED
        )),
        child: Scaffold(
          backgroundColor: Colors.green[100],
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                  child: Text(
                'LEAFLET',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
            ),
            Container(
              color: Colors.transparent,
              child: Image.asset(
                "assets/appLogo.png",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green[900],
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Flexible(child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return loginSeller();                                         //return homepage
                }));
              },
            )),
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green[900],
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Flexible(child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return loginSeller();                                         //return homepage
                }));
              },
            )),
            Container(
              child: Text(
                'Login As Seller',
                style: TextStyle(fontSize: 20, color: Colors.green[900]),
              ),
            ),
            Flexible(child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return loginSeller();
                }));
              },
            )),
          ]),
        ),
      ),
    );

    ;
  }
}
