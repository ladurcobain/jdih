import 'package:jdih/model/book.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/regulation/regulation_detail_old.dart';

import 'package:flutter/material.dart';

class ListingRegulation extends StatelessWidget {
  var data;
  final SettingsController settingsController;
  ListingRegulation({
    Key? key,
    required this.data,
    required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Text('Data tidak ditemukan!'),
        ],
      );
    } else {
      return Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(20),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, index) => const SizedBox(
              height: 20,
              child: Divider(),
            ),
            itemCount: data != null ? data.length : 0,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final regulation = data != null ? data[index] : null;
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegulationDetailPage(
                          settingsController: settingsController,
                          regulationId:
                              data != null ? regulation.regulationId! : 0),
                    ),
                  );
                },
                child: SizedBox(
                  // height: 120,
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
                                    data != null
                                        ? regulation.regulationTitle!
                                        : '-',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(
                                  Icons.download_rounded,
                                  color: Colors.green.shade600,
                                )
                              ],
                            ),
                            Text(
                              data != null
                                  ? '${regulation.regulationSlug!}'
                                  : '-',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                _buildIconText(
                                    Icons.download_rounded,
                                    Colors.orange[300]!,
                                    '${data != null ? regulation.regulationDownloadcount! : 0}'),
                                const SizedBox(
                                  width: 10,
                                ),
                                _buildIconText(
                                  Icons.visibility,
                                  Colors.blueAccent,
                                  '${data != null ? regulation.regulationViewcount! : 0}',
                                ),
                              ],
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

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
