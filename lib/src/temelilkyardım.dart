import 'package:flutter/material.dart';

class TemelIlkYardim extends StatefulWidget {
  const TemelIlkYardim({super.key});

  @override
  State<TemelIlkYardim> createState() => _TemelIlkYardim();
}

class _TemelIlkYardim extends State<TemelIlkYardim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.baslik"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "lib/src/Picture/ilkyardim.png",
              width: 100,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu nisi id tortor tincidunt commodo id nec sem. In id eros placerat, vulputate leo venenatis, condimentum est. Nunc dictum neque ex, vulputate consectetur ex scelerisque nec. Morbi sed eros non eros semper rhoncus in sit amet diam. Sed vehicula, quam ut ornare facilisis, nibh augue elementum risus, id hendrerit leo massa condimentum lorem. Integer non mauris laoreet, rutrum augue ac, gravida metus. Vestibulum fringilla dolor id libero dignissim, et condimentum ipsum malesuada. Sed facilisis scelerisque nibh at eleifend. Nulla nunc nunc, ultricies quis tellus eget, convallis varius nisi. In laoreet, neque ut posuere tincidunt, quam dui lobortis nisi, condimentum aliquam ex mauris congue erat. Nam interdum risus a eleifend suscipit. Nullam id luctus libero. Donec sed lacinia nunc. Nullam maximus dui sit amet odio tristique, et placerat lorem bibendum. Curabitur lectus est, feugiat ac dui vel, finibus tincidunt lorem.Vestibulum lacinia nulla risus, vitae gravida eros placerat a. Duis interdum nisl eros, nec bibendum lacus vehicula suscipit. Sed consectetur eros urna, finibus sagittis mi tempus vitae. Donec fermentum, nibh et dictum ultricies, elit urna eleifend justo, pharetra varius ligula risus ut lectus. Duis tincidunt efficitur lacus sed mattis. Quisque auctor venenatis sem eget pulvinar. Fusce ultrices dolor a euismod tincidunt. Cras sit amet sem tellus. Phasellus a iaculis ipsum, sit amet tempus est. Donec a aliquet risus."),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu nisi id tortor tincidunt commodo id nec sem. In id eros placerat, vulputate leo venenatis, condimentum est. Nunc dictum neque ex, vulputate consectetur ex scelerisque nec. Morbi sed eros non eros semper rhoncus in sit amet diam. Sed vehicula, quam ut ornare facilisis, nibh augue elementum risus, id hendrerit leo massa condimentum lorem. Integer non mauris laoreet, rutrum augue ac, gravida metus. Vestibulum fringilla dolor id libero dignissim, et condimentum ipsum malesuada. Sed facilisis scelerisque nibh at eleifend. Nulla nunc nunc, ultricies quis tellus eget, convallis varius nisi. In laoreet, neque ut posuere tincidunt, quam dui lobortis nisi, condimentum aliquam ex mauris congue erat. Nam interdum risus a eleifend suscipit. Nullam id luctus libero. Donec sed lacinia nunc. Nullam maximus dui sit amet odio tristique, et placerat lorem bibendum. Curabitur lectus est, feugiat ac dui vel, finibus tincidunt lorem.Vestibulum lacinia nulla risus, vitae gravida eros placerat a. Duis interdum nisl eros, nec bibendum lacus vehicula suscipit. Sed consectetur eros urna, finibus sagittis mi tempus vitae. Donec fermentum, nibh et dictum ultricies, elit urna eleifend justo, pharetra varius ligula risus ut lectus. Duis tincidunt efficitur lacus sed mattis. Quisque auctor venenatis sem eget pulvinar. Fusce ultrices dolor a euismod tincidunt. Cras sit amet sem tellus. Phasellus a iaculis ipsum, sit amet tempus est. Donec a aliquet risus.")
          ],
        ),
      ),
    );
  }
}
