import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/params/data/model/param_model/param_model.dart';
import 'package:ham_qrg/src/features/params/domain/param/param.dart';

class ParamMappers implements Mapper<Param, ParamModel> {
  @override
  Param fromModel(ParamModel model) {
    return Param(
      id: model.id,
      createdAt: DateTime.parse(model.createdAt),
      key: model.key,
      value: model.value,
    );
  }

  @override
  ParamModel toModel(Param entity) {
    return ParamModel(
      id: entity.id,
      createdAt: entity.createdAt.toIso8601String(),
      key: entity.key,
      value: entity.value,
    );
  }
}
