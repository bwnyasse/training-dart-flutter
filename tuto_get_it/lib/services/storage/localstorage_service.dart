import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:tuto_get_it/models/post.dart';
import 'package:tuto_get_it/services/storage/storage_service.dart';

class LocalStorageService implements StorageService {
  final LocalStorage _postsStorage = new LocalStorage('postsStorage');
  final StreamController<int> _postUpdated = StreamController<int>.broadcast();

  @override
  Stream<int> get postUpdateStream => _postUpdated.stream;

  @override
  Future<bool> likePost(int postId, {bool unlike = false}) async {
    // Get all the current posts
    Map<String, dynamic> data = _postsStorage.getItem('user_posts');

    // check if the one we're liking is in the collection
    if (data.containsKey('$postId')) {
      // convert to a post
      var post = Post.fromJson(data['$postId']);

      if (!unlike) {
        // increment like count
        post.likeCount++;
      } else {
        // decrement like count
        post.likeCount--;
      }
      // change back to map and save to the data
      data['$postId'] = post.toJson();
      // save all the data back to the local storage
      await _postsStorage.setItem('user_posts', data);
      // indicate the post Id has updated so the widget can reload itself
      _postUpdated.add(postId);
      return true;
    } else {
      print('Data for post $postId is not on disk. Add from api after fetch.');
      return false;
    }
  }

  @override
  void dispose() {
    _postUpdated.close();
  }
}
