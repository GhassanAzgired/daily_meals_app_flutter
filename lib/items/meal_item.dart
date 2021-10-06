import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_page.dart';

class MealItem extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.affordability,
    required this.complexity,
  }) : super(key: key);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  String get complexityLevels {
    switch (widget.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Challenging';
      default:
        return 'Unkown';
    }
  }

  String get affordabilityLevel {
    switch (widget.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricy:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unkown';
    }
  }

  void _detailsPageNavigator() {
    Navigator.of(context)
        .pushNamed(
      MealDetailsPage.routeName,
      arguments: widget.id,
    )
        .then((result) {
      if (result != null) {
        // widget.functionRemove(result);
      }
    });
  }

  bool _isTitleShowed = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _detailsPageNavigator();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Card(
                    // color: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      splashRadius: 1,
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          if (_isTitleShowed) {
                            _isTitleShowed = false;
                          } else if (_isTitleShowed == false) {
                            _isTitleShowed = true;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.pageview,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: _isTitleShowed
                      ? Container()
                      : Card(
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                ),
              ],
            ),
            // Container(
            //   alignment: Alignment.topRight,
            //   padding: const EdgeInsets.only(
            //     top: 5,
            //     bottom: 1,
            //   ),
            //   height: 30,
            //   child:
            //   Switch.adaptive(
            //     activeColor: Theme.of(context).colorScheme.primaryVariant,
            //     value: _isTitleShowed,
            //     onChanged: (val) {
            //       setState(() {
            //         _isTitleShowed = val;
            //       });
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '${widget.duration} mins',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        complexityLevels,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        affordabilityLevel,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
