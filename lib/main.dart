import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:foliday_network_demo/networkAgent.dart' as networkAgent;
import 'dart:convert';
import 'package:foliday_network_demo/model/folidayLoginResponse.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foliday Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () async {
                  var response = await networkAgent.post(
                    'http://unitest.gofoliday.com/sys/crm/account/login',
                    body: jsonEncode({
                      'channel': 'Foliday_APP_IOS',
                      'mobile': '008613524697816',
                      'vercode': 123456
                    })
                  );
                  if (response.statusCode == 200) {
                    FolidayLoginResponse re = FolidayLoginResponse.fromJson(json.decode(response.body));
                    networkAgent.saveToken(re.token);
                  }
                  print(response.body);
                },
                child: Text('login and get token'),
              ),
              MaterialButton(
                onPressed: () async {
                  var response = await networkAgent.get(
                    'http://unitest.gofoliday.com/sys/crm/account/current',
                    isAuthorizationNeeded: true
                  );
                  print(response.body);
                },
                child: Text('request account Info'),
              )
            ],
          ),
        ),
      ),
    );
  }
}