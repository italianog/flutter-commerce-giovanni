import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [ECard()],
        ),
      ),
    );
  }
}

class ECard extends StatelessWidget {
  const ECard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: FittedBox(
                child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
            )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TITOLO',
                  style: TextStyles.headingStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Download the font files from https://fonts.google.com. You only need to download the weights and styles you are using for any given family. Italic styles will include Italic in the filename. Font weights map to file names as follows.',
                  style:
                      TextStyles.paragraphStyle.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
