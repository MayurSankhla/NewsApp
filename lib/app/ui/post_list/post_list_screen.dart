import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siya_hackers_news/app/data/models/post_details.dart';
import 'package:siya_hackers_news/app/routes/route_names.dart';
import 'package:siya_hackers_news/app/ui/post_list/controller/post_list_controller.dart';

class PostListScreen extends StatelessWidget {
  PostListScreen({super.key});

  final PostListController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Obx(()=>
        ListView.builder(
          shrinkWrap: true,
          itemCount: _controller.postsList.value.length+1,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if(_controller.postsList.value.length == index){
              return Center(child: CircularProgressIndicator());
            }
            return PostCard(post: _controller.postsList.value[index]);
          },
        ),
      ),
    );
  }
}


// Create a card widget to display the post details
class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostDetails post;

  @override
  Widget build(BuildContext context) {
    // Convert timestamp to readable date
    final postTime = DateTime.fromMillisecondsSinceEpoch(post.time! * 1000);
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.postDetailsRoute,arguments: {
          'id' : post.id,
        });
      },
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post title
              Text(
                post.title ?? '',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // URL
              Text(
                post.url ?? '',
                style: TextStyle(
                    fontSize: 16, color: Colors.blueAccent),
              ),
              SizedBox(height: 12),
              // Author and Score row
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "by ${post.by}",
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "${post.score} points",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Comments and time row
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${post.descendants} comments",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Posted on ${postTime.day}/${postTime.month}/${postTime.year}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}