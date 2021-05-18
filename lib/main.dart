import 'package:app_04/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'presentation/my_flutter_app_icons.dart';

// Caio Henrique   RA: 2920481911022
// Luiz Augusto    RA: 2920481911013
// Thales Shinji   RA: 2920481911017
// Tiago Oliveira  RA: 2920481911032
// Yuri Cavalcanti RA: 2920481911023

void main() {
  runApp(
    MaterialApp(
      home: Home()
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  int _radioValue = 0;
  String _title = "Par Perfeito - Jedi";
  var _color = Colors.grey;
  var _sithColor = Colors.red;
  var _jediColor = Colors.blue[300];
  var _appBarColor = Colors.blue[300];
  var _logoColor = Colors.blue[300];
  var _backgroundColor = Colors.white;
  var _legendaColor = Colors.black;
  var _botaoColor = Colors.blue[900];
  var _vazio = {"", "https://mmamarketing.com.br/wp-content/uploads/2016/07/fundo-transparente.png"};
  var _resposta = {"", "https://mmamarketing.com.br/wp-content/uploads/2016/07/fundo-transparente.png"};
  var _equivalente = {{"Star Wars", "https://www.the-arcade.ie/wp-content/uploads/2014/04/star-wars.gif"}};
  var _midi = 0;

  var _darthSith = {
    {"Darth Sidious", "https://ranktopten.com/upload/-f/qx/darth-sidious_c_200x200.png"},
    {"Darth Vader", "https://demo.smoothcomp.com/pictures/t/696-85hd/darth-vader.png"},
    {"Darth Maul", "https://www.geekalerts.com/u/Star-Wars-Darth-Maul-Scale-Bust-200x200.jpg"},
  };

  var _jediMasters = {
    {"Mestre Yoda", "https://im.promobit.com.br/269388487314518326867249061009.jpg"},
    {"Obi-Wan Kenobi", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0ycyx2KUSVyLH5J5aZLwgjDoyGAoESKPewoQn7FsQOmAiUPhloGqqgsOsm5W7wwBqj3I&usqp=CAU"},
    {"Anakin Skywalker", "https://i.pinimg.com/originals/f1/e0/91/f1e0915e09a8ff8265d3b47edf7f6f44.jpg"},
  };

  var _stormTrooper = {
    {"Storm Trooper", "https://avatarfiles.alphacoders.com/151/thumb-151752.jpg"}
  };

  var _clone = {
    {"Clone", "https://www.jovanellimodelismo.com.br/image/cache/data/SideShow/Star%20Wars%20Clone%20Trooper%20Deluxe%20212th-200x200.png"}
  };

  void _mudaRadio(int value){
    setState((){
      _radioValue = value;

      switch(_radioValue){
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  void _mudaCores(){
    setState((){
      _resposta = _vazio;

      _title = (_appBarColor == _jediColor) ? "Par Perfeito - Sith" : "Par Perfeito - Jedi";

      _appBarColor = (_appBarColor == _jediColor) ?_sithColor : _jediColor;

      _logoColor = _appBarColor;

      _legendaColor = _backgroundColor;

      _backgroundColor = (_logoColor == _jediColor) ? Colors.white : Colors.black;

      _botaoColor = (_logoColor == _jediColor) ? Colors.blue[900] : Colors.red[900];
    });
  }

  void _getEquivalente(){
    String nome = nomeController.text;
    int idade = int.parse(idadeController.text);
    setState(() {
      if(_radioValue == 1){
        _resposta = _appBarColor == _jediColor ? _clone.elementAt(0) : _stormTrooper.elementAt(0);
      } else {
        _midi = nome.length;
        _midi *= idade;
        _midi *= _radioValue == 0 ? 50 : 25;
        _midi *= nome.split(" ").length;
        if(_appBarColor == _jediColor){
          _resposta = _midi < 5000 ? _jediMasters.elementAt(2) : _midi < 15000 ? _jediMasters.elementAt(1) : _jediMasters.elementAt(0);
        } else {
          _resposta = _midi < 5000 ? _darthSith.elementAt(2) : _midi < 15000 ? _darthSith.elementAt(1) : _darthSith.elementAt(0);
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text(
          _title,
        ),
        centerTitle: true,
        backgroundColor: _appBarColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _mudaCores
          )
        ],
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Form( 
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                MyFlutterApp.jedi,
                size: 120,
                color: _logoColor,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Primeiro Nome",
                  labelStyle: TextStyle(
                    color: _legendaColor,
                  ),
                ),
                textAlign: TextAlign.left,
                style:  TextStyle(
                  color: _legendaColor,
                  fontSize: 25.0,
                ),
                controller: nomeController,
                validator: (value){
                  return (value.isEmpty) ? "Insira seu nome" : null;
                }
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  labelStyle: TextStyle(
                    color: _legendaColor,
                  )
                ),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: _legendaColor,
                  fontSize: 25.0,
                ),
                controller: idadeController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira sua idade";
                  } else {
                    return null;
                  }
                }
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _mudaRadio,
                      activeColor: _botaoColor,
                    ),
                    Text(
                      'Ligth Saber',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _legendaColor,
                      ),
                    ),
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _mudaRadio,
                      activeColor: _botaoColor,

                    ),
                    Text(
                      'Blasters',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _legendaColor,
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _getEquivalente();
                      }
                    },
                    child: Text(
                      "Seu equivalente na Força é: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    color: _botaoColor,
                  ),
                ),
              ),
               Text(
                _resposta.elementAt(0),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _color,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: Image.network(_resposta.elementAt(1)),
              ),
              Text(
                "May the Force be with you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _color,
                  fontSize: 20,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
