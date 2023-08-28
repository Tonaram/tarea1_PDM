import 'package:flutter/material.dart';

//Este es un pequeño template que puedes utilizar para sustituir el main que te crea el comando Flutter Create
void main() {
  runApp(const MyApp()); //Le decimos a flutter que en el main queremos que corra la aplicación con la clase "My App"
}

class MyApp extends StatelessWidget { //Definimos la clase MyApp de un StatelessWidget (No se mueve)
  const MyApp({super.key}); //Pasamos los parametros como cualquier clase (Esto lo aprendieron en POO)

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  //Creamos el contexto de nuestra clase 
    return MaterialApp( //La clase debe retornar algo! En este caso un Widget de tipo MaterialApp
      title: 'Mc Flutter', //Aquí va el titulo de tu app
      theme: ThemeData( //Otro atributo es theme, nos ayuda a darle color y personalización de estilo a tu app que puedes utilizar en cualquier lugar
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 109, 197, 219)), //Color principal de mi app
        useMaterial3: true, // Utilizamos Material Design
      ),
      home: const MyHomePage(), //Otro atributo de Material App, es la pantalla home , en este caso le paso otra clase, la clase "BirthdayCard"
    );
  }
}

class MyHomePage extends StatelessWidget { //Definimos la clase MyHomePage de un StatelessWidget (No se mueve
  const MyHomePage({super.key}); //Pasamos los parametros como cualquier clase (Esto lo aprendieron en POO)

  @override
  Widget build(BuildContext context) { //Creamos el contexto de nuestra clase
    return Scaffold( //En este caso retornamos un Widget tipo Scaffold, es la pantalla con su appBar
      appBar: AppBar( //Tiene justamente de atributo un App Bar
        backgroundColor: Color.fromARGB(255, 25, 111, 224), //Le damos color, aunque también podría tomarlo del contexto
        title: const Text('Mc Flutter', style: TextStyle(color: Colors.white),), //Otro atributo es el título
      ),
      body:
      Container(
        margin: const EdgeInsets.all(7.0),
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.account_circle, size: 50),
                SizedBox(width: 2),
                Column(children: [
                  Text('Flutter McFlutter', style: TextStyle(fontSize: 20)),
                  Text('Experienced App Developer', style: TextStyle(fontSize: 12)),
                ],)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children:[
                    MyButton(
                      icon: Icons.location_on,
                      label: '123 Main Street',
                    ),
                  ],
                ), SizedBox(width: 40),
                Column(
                  children:[
                    MyButton(
                      icon: Icons.timer,
                      label: '',
                    ),
                  ]
                ), SizedBox(width: 70),
                Column(
                  children:[
                    MyButton(
                      icon: Icons.phone_android,
                      label: '',
                    ),
                  ]
                ), SizedBox(width: 40),
                Column(
                  children:[
                    MyButton(
                      icon: Icons.phone_android,
                      label: '(415) 555-0198',
                    ),
                  ]
                ),                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const MyButton({required this.icon, required this.label});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isClicked = false;

  void _toggleClicked() {
    setState(() {
      _isClicked = !_isClicked;
    });

    final snackBar = SnackBar(content: Text(getIconName(widget.icon)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String getIconName(IconData icon) {
    final Map<IconData, String> iconNames = {
      Icons.location_on: "Location",
      Icons.timer: "Timer",
      Icons.phone_android: "Phone",
    };

    return iconNames[icon] ?? "Unknown";
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleClicked,
      child: Column(
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 12),
          ), SizedBox(height: 4),
          Icon(
            widget.icon,
            size: 20,
            color: _isClicked ? Colors.indigo : Colors.black,
          ),
        ],
      ),
    );
  }
}