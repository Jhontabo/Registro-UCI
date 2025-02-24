import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';

class MarcapasosRepository {
  final FirebaseFirestore firestore;

  MarcapasosRepository({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> registrarMarcapaso(CreateMarcapasoDto dto) async {
    await firestore.collection('marcapasos').add(dto.toJson());
  }
}
