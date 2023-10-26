import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/domain/repositories/gallery_repository.dart';

GalleryUseCase get galleryUseCase => injector.get<GalleryUseCase>();

abstract class GalleryUseCase {
  Future<void> postImageToPublicGallery(
      {required PostImageToPublicGalleryParams postImageToPublicGalleryParam});

  Future<List<String>> getImageFromPublicGallery();
}

@Injectable(as: GalleryUseCase)
class GalleryUseCaseImpl extends UseCase<void, NoParams>
    implements GalleryUseCase {
  final GalleryRepository _galleryRepository;

  GalleryUseCaseImpl(this._galleryRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> postImageToPublicGallery(
      {required PostImageToPublicGalleryParams
          postImageToPublicGalleryParam}) async {
    try {
      final result = await _galleryRepository.postImageToPublicGallery(
          imageFile: postImageToPublicGalleryParam.imageFile);

      return result.fold(
        (failure) => Logger()
            .e('Post image to public gallery failure ${failure.message}'),
        (success) => Logger().d('Post image to public gallery success'),
      );
    } catch (e) {
      throw GalleryFailure(message: e.toString());
    }
  }

  @override
  Future<List<String>> getImageFromPublicGallery() async {
    try {
      final result = await _galleryRepository.getImageFromPublicGallery();

      return result.fold(
        (failure) {
          Logger().e('Post image to public gallery failure ${failure.message}');
          return [];
        },
        (gallery) => gallery,
      );
    } catch (e) {
      throw GalleryFailure(message: e.toString());
    }
  }
}
