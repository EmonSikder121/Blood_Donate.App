import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../pages/donor_details.dart';


class DonorGridItemView extends StatelessWidget {
  final DonarModel donarModel;
  const DonorGridItemView({Key? key, required this.donarModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, DonarDetailsPage.routeName,
          arguments: donarModel),
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: donarModel.thumbnailImageUrl,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    donarModel.donorName,
                    style: const TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                ),

          ],
        ),
      ]
        )
      ),
    );
  }
}
