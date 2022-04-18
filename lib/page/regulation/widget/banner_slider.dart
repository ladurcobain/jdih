import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:jdih/page/home/model/home_model.dart';

class BannerSlider extends StatelessWidget {
  var data;
  BannerSlider({
    Key? key,
    required this.data,
  }) : super(key: key);

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      final upcomings = [
        'assets/images/upcoming1.jpg',
        'assets/images/upcoming2.png',
        'assets/images/upcoming3.jpg',
      ];
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 130,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: upcomings
                  .map(
                    (e) => Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black,
                                Colors.black45,
                                Colors.black12,
                                Colors.black.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Positioned(
              left: 30,
              bottom: 10,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: upcomings.length,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 8,
                  dotHeight: 4,
                  activeDotColor: Colors.white,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 130,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: data
                  .map<Widget>(
                    (e) => Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              e.sliderImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.green.shade600.withOpacity(0.5),
                                Colors.green.shade600.withOpacity(0.02),
                                Colors.green.shade600.withOpacity(0.01),
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Positioned(
              left: 30,
              bottom: 10,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: data.length,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 8,
                  dotHeight: 4,
                  activeDotColor: Colors.white,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
