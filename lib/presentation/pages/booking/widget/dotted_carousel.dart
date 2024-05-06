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
                itemCount: widget.facilityData.images.isNotEmpty ? widget.facilityData.images.length : 1,
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
                      image: DecorationImage(
                        image: widget.facilityData.images.isNotEmpty
                            ? NetworkImage(injector<SportAppApi>().imageFromDB(
                                widget.facilityData.images[index].image,
                              ))
                            : const NetworkImage(
                                'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fDB8fHww'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
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
                    children: widget.facilityData.images.isNotEmpty && widget.facilityData.images.length > 1
                        ? List.generate(
                            widget.facilityData.images.length,
                            (index) => Container(
                              width: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Theme.of(context).colorScheme.background
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                        : [],
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
