import 'package:flutter/material.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/injector.dart';
class DottedCarousel extends StatefulWidget {
  final FacilityData facilityData;

  const DottedCarousel({super.key, required this.facilityData});

  @override
  State<DottedCarousel> createState() => _DottedCarouselState();
}

class _DottedCarouselState extends State<DottedCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.0,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                itemCount: 3,
                controller: PageController(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(injector<SportAppApi>().imageFromDB(
                          widget.facilityData.images.first.image,
                        )),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 5.0,
                child: SizedBox(
                  height: 9.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3, (index) =>
                        Container(
                          width: 15.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index ? Theme.of(context).colorScheme.background :Theme.of(context).colorScheme.secondary ,
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
