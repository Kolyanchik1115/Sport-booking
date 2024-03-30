import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/svg_button.dart';
import 'package:sport_app/injector.dart';

class FacilityContainer extends StatelessWidget {
  final FacilityData? facility;
  final Function() onTap;
  final Function() onIconTap;

  const FacilityContainer({
    super.key,
    required this.facility,
    required this.onTap,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: facility!.images.isNotEmpty
                            ? NetworkImage(injector<SportAppApi>().imageFromDB(
                                facility?.images.first.image ?? '',
                              ))
                            : const NetworkImage(
                                'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fDB8fHww'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: SvgButton(
                    asset: AppSvg.heart,
                    onTap: onIconTap,
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  left: 20.0,
                  child: Text(
                    '${facility?.name}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(AppSvg.location, height: 15.0),
                  const SizedBox(width: 13.0),
                  Text(facility?.address ?? ''),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(facility?.sportType ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(children: [Text('${facility?.facilityType} · ${facility?.coveringType}')]),
            ),
          ],
        ),
      ),
    );
  }
}
