import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  DocumentReference get blockchain;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'product_id')
  String get productId;

  @nullable
  @BuiltValueField(wireName: 'product_name')
  String get productName;

  @nullable
  @BuiltValueField(wireName: 'entitity_list')
  BuiltList<String> get entitityList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..uid = ''
    ..productId = ''
    ..productName = ''
    ..entitityList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String uid,
  DocumentReference blockchain,
  DateTime timestamp,
  String productId,
  String productName,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..uid = uid
          ..blockchain = blockchain
          ..timestamp = timestamp
          ..productId = productId
          ..productName = productName
          ..entitityList = null));
