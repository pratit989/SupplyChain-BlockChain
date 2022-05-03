import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListingWidget extends StatefulWidget {
  const ProductListingWidget({Key key}) : super(key: key);

  @override
  _ProductListingWidgetState createState() => _ProductListingWidgetState();
}

class _ProductListingWidgetState extends State<ProductListingWidget> {
  BlockchainsRecord blockChainRef;
  BlocksRecord blockRef;
  ProductsRecord productDocumentRef;
  String genesisHash;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProductListing'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Product Listing',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    logFirebaseEvent('Button-Backend-Call');

                    final productsCreateData = createProductsRecordData(
                      uid: currentUserUid,
                      timestamp: getCurrentTimestamp,
                    );
                    var productsRecordReference =
                        ProductsRecord.collection.doc();
                    await productsRecordReference.set(productsCreateData);
                    productDocumentRef = ProductsRecord.getDocumentFromData(
                        productsCreateData, productsRecordReference);
                    logFirebaseEvent('Button-Custom-Action');
                    genesisHash = await actions.sHA256Calculate(
                      0,
                      '0',
                      getCurrentTimestamp,
                      functions.toJSON(FFAppState().keys.toList(),
                          FFAppState().values.toList()),
                    );
                    logFirebaseEvent('Button-Backend-Call');

                    final blocksCreateData = {
                      ...createBlocksRecordData(
                        index: 0,
                        timestamp: getCurrentTimestamp,
                        previousHash: '0',
                        currentHash: genesisHash,
                      ),
                      'data_keys': ['0'],
                      'data_values': ['0'],
                    };
                    var blocksRecordReference = BlocksRecord.collection.doc();
                    await blocksRecordReference.set(blocksCreateData);
                    blockRef = BlocksRecord.getDocumentFromData(
                        blocksCreateData, blocksRecordReference);
                    logFirebaseEvent('Button-Backend-Call');

                    final blockchainsCreateData = {
                      'blocks_list': [blockRef.reference],
                    };
                    var blockchainsRecordReference =
                        BlockchainsRecord.collection.doc();
                    await blockchainsRecordReference.set(blockchainsCreateData);
                    blockChainRef = BlockchainsRecord.getDocumentFromData(
                        blockchainsCreateData, blockchainsRecordReference);
                    logFirebaseEvent('Button-Backend-Call');

                    final productsUpdateData = createProductsRecordData(
                      blockchain: blockChainRef.reference,
                    );
                    await productDocumentRef.reference
                        .update(productsUpdateData);

                    setState(() {});
                  },
                  text: 'Create New Product Blockchain',
                  icon: Icon(
                    Icons.add_link,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 350,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('uid', isEqualTo: currentUserUid)
                        .orderBy('timestamp'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> listViewProductsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewProductsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewProductsRecord =
                            listViewProductsRecordList[listViewIndex];
                        return ListTile(
                          title: Text(
                            listViewProductsRecord.productName,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                          ),
                          subtitle: Text(
                            listViewProductsRecord.productId,
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
