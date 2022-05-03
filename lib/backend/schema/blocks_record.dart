import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blocks_record.g.dart';

abstract class BlocksRecord
    implements Built<BlocksRecord, BlocksRecordBuilder> {
  static Serializer<BlocksRecord> get serializer => _$blocksRecordSerializer;

  @nullable
  int get index;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'data_keys')
  BuiltList<String> get dataKeys;

  @nullable
  @BuiltValueField(wireName: 'data_values')
  BuiltList<String> get dataValues;

  @nullable
  @BuiltValueField(wireName: 'previous_hash')
  String get previousHash;

  @nullable
  @BuiltValueField(wireName: 'current_hash')
  String get currentHash;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BlocksRecordBuilder builder) => builder
    ..index = 0
    ..dataKeys = ListBuilder()
    ..dataValues = ListBuilder()
    ..previousHash = ''
    ..currentHash = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blocks');

  static Stream<BlocksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BlocksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BlocksRecord._();
  factory BlocksRecord([void Function(BlocksRecordBuilder) updates]) =
      _$BlocksRecord;

  static BlocksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBlocksRecordData({
  int index,
  DateTime timestamp,
  String previousHash,
  String currentHash,
}) =>
    serializers.toFirestore(
        BlocksRecord.serializer,
        BlocksRecord((b) => b
          ..index = index
          ..timestamp = timestamp
          ..dataKeys = null
          ..dataValues = null
          ..previousHash = previousHash
          ..currentHash = currentHash));
