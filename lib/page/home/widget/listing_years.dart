import 'package:flutter/material.dart';
import 'package:jdih/model/book.dart';
import 'package:jdih/page/detail/detail.dart';
import 'package:jdih/page/home/widget/category_title.dart';

class ListingYears extends StatelessWidget {
  final recommendedList = Book.generateRecommendedBook();
  var data;
  ListingYears({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    if (data == null) {
      return Column(
        children: [
          const CategoryTitle('Berdasarkan Tahun'),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (_, index) => const SizedBox(
                width: 15,
              ),
              itemCount: 4,
              itemBuilder: (_, index) {
                return GestureDetector(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          const CategoryTitle('Berdasarkan Tahun'),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (_, index) => const SizedBox(
                width: 15,
              ),
              itemCount: data != null ? data.length : 0,
              itemBuilder: (_, index) {
                var year = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(year)));
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                year.title.toString(),
                                style: TextStyle(
                                  fontSize: _media.width * 0.09,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Jumlah : ',
                                  ),
                                  Text(
                                    year.count.toString(),
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      );
    }
  }
}
