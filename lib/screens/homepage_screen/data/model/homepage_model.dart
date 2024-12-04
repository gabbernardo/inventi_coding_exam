import 'package:dart_mappable/dart_mappable.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/entities/homepage_entity.dart';

part 'homepage_model.mapper.dart';

@MappableClass()
class HomePageModel extends HomePageEntity with HomePageModelMappable {
  HomePageModel({@MappableField(key: 'randomString') super.randomString = ''});
}
