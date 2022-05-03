import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blockchains_record.g.dart';

abstract class BlockchainsRecord
    implements Built<BlockchainsRecord, BlockchainsRecordBuilder> {
  static Serializer<BlockchainsRecord> get serializer =>
      _$blockchainsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'blocks_list')
  BuiltList<DocumentReference> get blocksList;

  @nullable
  @BuiltValueField(wireName: 'latest_block_index')
  int get latestBlockIndex;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BlockchainsRecordBuilder builder) => builder
    ..blocksList = ListBuilder()
    ..latestBlockIndex = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blockchains');

  static Stream<BlockchainsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BlockchainsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BlockchainsRecord._();
  factory BlockchainsRecord([void Function(BlockchainsRecordBuilder) updates]) =
      _$BlockchainsRecord;

  static BlockchainsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBlockchainsRecordData({
  int latestBlockIndex,
}) =>
    serializers.toFirestore(
        BlockchainsRecord.serializer,
        BlockchainsRecord((b) => b
          ..blocksList = null
          ..latestBlockIndex = latestBlockIndex));
