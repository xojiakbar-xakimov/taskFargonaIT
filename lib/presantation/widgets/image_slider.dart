import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatefulWidget {
  final List<String> imgList;
  final void Function(String) click ;

  const CustomCarouselWidget({required this.imgList,required this.click , super.key});

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  final CarouselController buttonCarouselController = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                disableGesture: true,
                carouselController: buttonCarouselController,
                items: widget.imgList
                    .map((item) => Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x34000000),
                            offset: Offset(
                              2,
                              2,
                            ),
                            blurRadius: 0.1,
                            spreadRadius: 0.3,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0x34000000),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          widget.click(item.toString()) ;
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(item.toString() ?? '',
                              fit: BoxFit.cover, width: 1000),
                        ),
                      ),
                    )))
                    .toList(),
              )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => buttonCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      );
  }
}

// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           margin: const EdgeInsets.all(5.0),
//           child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//               child: Stack(
//                 children: <Widget>[
//                   Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                   Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(200, 0, 0, 0),
//                             Color.fromARGB(0, 0, 0, 0)
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 20.0),
//                       child: Text(
//                         'No. ${imgList.indexOf(item)} image',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         ))
//     .toList();
