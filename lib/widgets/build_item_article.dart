import 'package:flutter/material.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem(
    this.results, 
    {
    super.key,
  });
  final Map results;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              '${results['urlToImage'] ?? "https://islandsbusiness.com/wp-content/uploads/2024/02/Manasseh-Sogavare-Photo-O.U.R-Party-Solomon-Islands.jpg"}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('فشل في تحميل الصورة');
              },
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${results['title'] ?? " "}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    '${results['publishedAt'] ?? " "}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
