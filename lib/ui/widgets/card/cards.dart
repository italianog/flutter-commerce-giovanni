import 'package:flutter/material.dart';

import '../../theme/text_styles.dart';

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

class ECardSecondary extends StatelessWidget {
  const ECardSecondary({Key? key}) : super(key: key);

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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 120,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'TITOLO',
                style: TextStyles.headingStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Download the font files from https://fonts.google.com. You only need to download the weights and styles you are using for any given family. Italic styles will include Italic in the filename. Font weights map to file names as follows.',
                style: TextStyles.paragraphStyle.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              image: NetworkImage(
                'https://www.moradam.com/wp-content/uploads/2018/07/seo95.jpg',
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 120),
          alignment: Alignment.center,
          child: const Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
