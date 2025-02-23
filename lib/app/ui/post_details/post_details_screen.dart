import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/post_details_controller.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({super.key});

  final PostDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
      ),
      body: Obx(() {
       if(_controller.isLoading.value){
         return Center(child: CircularProgressIndicator());
       }else{
         return Padding(
           padding: const EdgeInsets.all(16.0),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // Title with Hero Animation
                 Material(
                   color: Colors.transparent,
                   child: Text(
                     _controller.post.value.title ?? 'No title',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 const SizedBox(height: 12),

                 // Author & Date
                 Row(
                   children: [
                     Icon(Icons.person, color: Colors.grey.shade600, size: 18),
                     const SizedBox(width: 4),
                     Text(
                       _controller.post.value.by ?? 'Unknown',
                       style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                     ),
                     const Spacer(),
                     Icon(Icons.access_time, color: Colors.grey.shade600, size: 18),
                     const SizedBox(width: 4),
                     Text(
                       _formatDate(_controller.post.value.time),
                       style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                     ),
                   ],
                 ),
                 const SizedBox(height: 16),

                 // Score and Comments
                 Row(
                   children: [
                     Icon(Icons.thumb_up, color: Colors.orange, size: 20),
                     const SizedBox(width: 4),
                     Text(
                       '${_controller.post.value.score ?? 0} Likes',
                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                     ),
                     const SizedBox(width: 16),
                     Icon(Icons.comment, color: Colors.blue, size: 20),
                     const SizedBox(width: 4),
                     Text(
                       '${_controller.post.value.descendants ?? 0} Comments',
                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                     ),
                   ],
                 ),
                 const SizedBox(height: 16),

                 // Kids (Comment IDs)
                 if (_controller.post.value.kids != null && (_controller.post.value.kids as List).isNotEmpty)
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         "Top Comments IDs:",
                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                       ),
                       ...List.generate(
                         _controller.postCommentList.value.length,
                             (index) => Padding(
                           padding: const EdgeInsets.symmetric(vertical: 4),
                           child: Card(
                             margin: const EdgeInsets.symmetric(vertical: 8),
                             child: Padding(
                               padding: const EdgeInsets.all(12),
                               child: HtmlWidget(
                                 _controller.postCommentList.value[index].text ?? "No data found" , // Render HTML comment text
                                 textStyle: TextStyle(fontSize: 14, color: Colors.black87),

                               ),
                             ),
                           )
                         ),
                       ),
                     ],
                   ),
               ],
             ),
           ),
         );
       }
      }),
    );
  }

  // Function to format timestamp
  String _formatDate(int? timestamp) {
    if (timestamp == null) return 'Unknown date';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd MMM yyyy').format(date);
  }

}
