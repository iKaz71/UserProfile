import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('User Profile'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Header(
                height: 200,
                username: 'Sarah.Su',
                backgroundAsset: 'assets/water.jpg',
                userAsset: 'assets/user.jpg',
              ),
              Connections(
                followers: 3458,
                following: 128,
              ),
                Description(
                  text: 'Es simplemente un texto ficticio de la industria de impresión y composición tipográfica. Lorem Ipsum ha sido el texto ficticio estándar de la industria desde el año 1500, cuando una impresora desconocida tomó una galera de tipo y la revolvió para hacer un libro de muestras. Ha sobrevivido no solo cinco siglos, sino también el salto a la composición electrónica, permaneciendo esencialmente sin cambios. Se popularizó en la década de 1960 con el lanzamiento de las hojas de Letraset que contienen pasajes de Lorem Ipsum, y más recientemente con software de publicación de escritorio como Aldus PageMaker que incluye versiones de Lorem Ipsum.'
                ),
            ],
          )),
    );
  }
}

class Description extends StatelessWidget {
  
  final String text;

  Description({

    Key key,
    @required this.text,
  }) : super (key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(this.text, 
      style: TextStyle(
        fontSize: 16,
        ),
      ),
    );
  }
}

class Connections extends StatelessWidget {
  final int following, followers;
  const Connections({
    Key key,
    @required this.following,
    @required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[200],
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Connection(text: 'Following', number: this.following),
            Connection(text: 'Followers', number: this.followers),
          ]),
    );
  }
}

class Connection extends StatelessWidget {

  final String text;
  final int number;

  const Connection({
    Key key,
    @required this.text,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Color.fromARGB(180, 0, 0, 0)
    );
    return Column(
      children: <Widget>[
        Text(this.text.toUpperCase(), style: style.copyWith(fontSize: 12)), 
        Text('${this.number}', style: style.copyWith(fontSize: 18)),
        ],
    );
  }
}

class Header extends StatelessWidget {
  final double height;
  final String backgroundAsset;
  final String userAsset;
  final String username;

  const Header({
    Key key,
    this.height = 200,
    @required this.backgroundAsset,
    @required this.userAsset,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.backgroundAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(
            assetImage: this.userAsset,
            size: 100,
          ),
          Text('@${this.username}',
              style: TextStyle(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String assetImage;
  final double size;

  const UserPhoto({
    Key key,
    @required this.assetImage,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.assetImage),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

void main() {
  runApp(Screen());
}
