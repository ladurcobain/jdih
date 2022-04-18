import 'package:jdih/page/detail/detail.dart';
import 'package:jdih/page/home/widget/category_title.dart';

import 'package:flutter/material.dart';

class ListingCategory extends StatelessWidget {
  var data;
  ListingCategory({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Column(
        children: const [
          CategoryTitle('Bersadarkan Kategori'),
          SizedBox(
            height: 50,
          ),
          Text('Tidak ada data !'),
        ],
      );
    } else {
      return Column(
        children: [
          const CategoryTitle('Bersadarkan Kategori'),
          ListView.separated(
            padding: const EdgeInsets.all(20),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, index) => const SizedBox(
              height: 10,
              child: Divider(),
            ),
            itemCount: data != null ? data.length : 0,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final category = data != null ? data[index] : null;
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(category)));
                },
                child: SizedBox(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 1,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    data != null ? category.title! : '-',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(
                                  Icons.bookmark,
                                  color: Colors.orange[300],
                                )
                              ],
                            ),
                            Text(
                              data != null
                                  ? '${category.count!} produk hukum'
                                  : '-',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    }
  }
}
