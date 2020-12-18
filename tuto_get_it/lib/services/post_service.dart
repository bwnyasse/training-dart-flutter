import 'package:tuto_get_it/locator.dart';
import 'package:tuto_get_it/services/api/api.dart';
import 'package:tuto_get_it/services/storage/storage_service.dart';

class PostService {
  Api _api = locator<Api>();
  StorageService _localStorageService = locator<StorageService>();

  Future<bool> likePost(int postId) async {
    var localLikeSuccess = await _localStorageService.likePost(postId);
    var postLiked = await _api.likePost(postId);

    if (postLiked) {
      return true;
    }

    if (localLikeSuccess) {
      await _localStorageService.likePost(postId, unlike: true);
    }

    return false;
  }
}
