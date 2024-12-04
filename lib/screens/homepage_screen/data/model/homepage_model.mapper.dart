// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'homepage_model.dart';

class HomePageModelMapper extends ClassMapperBase<HomePageModel> {
  HomePageModelMapper._();

  static HomePageModelMapper? _instance;
  static HomePageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomePageModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HomePageModel';

  static String _$randomString(HomePageModel v) => v.randomString;
  static const Field<HomePageModel, String> _f$randomString =
      Field('randomString', _$randomString, opt: true, def: '');

  @override
  final MappableFields<HomePageModel> fields = const {
    #randomString: _f$randomString,
  };

  static HomePageModel _instantiate(DecodingData data) {
    return HomePageModel(randomString: data.dec(_f$randomString));
  }

  @override
  final Function instantiate = _instantiate;

  static HomePageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomePageModel>(map);
  }

  static HomePageModel fromJson(String json) {
    return ensureInitialized().decodeJson<HomePageModel>(json);
  }
}

mixin HomePageModelMappable {
  String toJson() {
    return HomePageModelMapper.ensureInitialized()
        .encodeJson<HomePageModel>(this as HomePageModel);
  }

  Map<String, dynamic> toMap() {
    return HomePageModelMapper.ensureInitialized()
        .encodeMap<HomePageModel>(this as HomePageModel);
  }

  HomePageModelCopyWith<HomePageModel, HomePageModel, HomePageModel>
      get copyWith => _HomePageModelCopyWithImpl(
          this as HomePageModel, $identity, $identity);
  @override
  String toString() {
    return HomePageModelMapper.ensureInitialized()
        .stringifyValue(this as HomePageModel);
  }

  @override
  bool operator ==(Object other) {
    return HomePageModelMapper.ensureInitialized()
        .equalsValue(this as HomePageModel, other);
  }

  @override
  int get hashCode {
    return HomePageModelMapper.ensureInitialized()
        .hashValue(this as HomePageModel);
  }
}

extension HomePageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomePageModel, $Out> {
  HomePageModelCopyWith<$R, HomePageModel, $Out> get $asHomePageModel =>
      $base.as((v, t, t2) => _HomePageModelCopyWithImpl(v, t, t2));
}

abstract class HomePageModelCopyWith<$R, $In extends HomePageModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? randomString});
  HomePageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomePageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomePageModel, $Out>
    implements HomePageModelCopyWith<$R, HomePageModel, $Out> {
  _HomePageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomePageModel> $mapper =
      HomePageModelMapper.ensureInitialized();
  @override
  $R call({String? randomString}) => $apply(FieldCopyWithData(
      {if (randomString != null) #randomString: randomString}));
  @override
  HomePageModel $make(CopyWithData data) => HomePageModel(
      randomString: data.get(#randomString, or: $value.randomString));

  @override
  HomePageModelCopyWith<$R2, HomePageModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomePageModelCopyWithImpl($value, $cast, t);
}
