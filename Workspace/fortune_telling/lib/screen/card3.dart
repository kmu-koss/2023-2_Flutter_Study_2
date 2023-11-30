import 'package:flutter/material.dart';
import '../fortune_telling_theme.dart';

import '../main.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 600),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/moon_bg.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 42,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'MoreOver',
                    style: FortuneTellingTheme.darkTextTheme.headline6,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4,
                    children: [
                      Chip(
                        onDeleted: (){
                          print('on chip deleted');
                        },
                        label: Text(
                          '타로',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '주간 로또운',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '꿈풀이',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '토정비결',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '신년운세',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '혈액형운세',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'MBTI 운세',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '십이간지 운세',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '인생풀이',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          '오늘의 급소',
                          style: FortuneTellingTheme.darkTextTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
