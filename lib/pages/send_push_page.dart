import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_web/pages/push_input.dart';

import '../alerts.dart';
import '../firebase.dart';
import '../movie.dart';

class SendPushPage extends StatefulWidget {
  SendPushPage();

  @override
  _SendPushPageState createState() => _SendPushPageState();
}

class _SendPushPageState extends State<SendPushPage> {
  final _formKey = GlobalKey<FormState>();

  final tTitle = TextEditingController(text: "Teste");
  final tMsg = TextEditingController(text: "Firebase teste");
  final tToken = TextEditingController(text: "f2-_OALxkbg:APA91bE7LAO4yfGpTYTxhw9x2uoc0p4pkkrTTq0p0IJoMmRB-9jLPrtcfK_H5TWnhktkPeZVyNxuKQm8VNu9eEOf5Tpros-Gwcx8LvSQJ9UfQnvoZuPPtJBiMpr4t55v-FMM5XVO1JP2");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Push"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[

            TextFormField(
              controller: tTitle,
              decoration: InputDecoration(
                labelText: "Titulo",
              ),
            ),
            TextFormField(
              controller: tMsg,
              decoration: InputDecoration(
                labelText: "Mensagem",
              ),
            ),
            TextFormField(
              controller: tToken,
              decoration: InputDecoration(
                labelText: "Token",
              ),
            ),
            RaisedButton(
              child: Text("Send Push"),
              onPressed: _onClickPush,
            )
          ],
        ),
      ),
    );
  }

  _onClickPush() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final _input = PushInput();
    _input.title = tTitle.text;
    _input.msg = tMsg.text;
    _input.token = tToken.text;

    print("Login: ${_input.title}, senha: ${_input.msg}");

    PushApi.push(_input);

    alert(context, "Filmes", "Push Enviado");
  }
}