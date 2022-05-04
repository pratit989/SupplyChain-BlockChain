import '../add_block_page/add_block_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../block_data_viewer/block_data_viewer_widget.dart';
import '../block_validity_check/block_validity_check_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProductWidget extends StatefulWidget {
  const ManageProductWidget({
    Key key,
    this.productRef,
  }) : super(key: key);

  final DocumentReference productRef;

  @override
  _ManageProductWidgetState createState() => _ManageProductWidgetState();
}

class _ManageProductWidgetState extends State<ManageProductWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productRef),
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
        final manageProductProductsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'mx28tw24' /* Manage Product */,
              ),
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          manageProductProductsRecord.productName,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                          child: Text(
                            manageProductProductsRecord.productId
                                .maybeHandleOverflow(
                              maxChars: 40,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'f1rwtybp' /* Enter UID */,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: textController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (!formKey.currentState.validate()) {
                                  return;
                                }

                                final productsUpdateData = {
                                  'entitity_list': FieldValue.arrayUnion(
                                      [textController.text]),
                                };
                                await widget.productRef
                                    .update(productsUpdateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Added Entity',
                                      style: TextStyle(),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'o4j1wxok' /* Add Entity */,
                              ),
                              icon: Icon(
                                Icons.person_add,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBlockPageWidget(
                              productRef: widget.productRef,
                            ),
                          ),
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        '660qdqi8' /* Add Block */,
                      ),
                      icon: Icon(
                        Icons.add,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlockValidityCheckWidget(
                              productRef: widget.productRef,
                            ),
                          ),
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'f7kz2rl5' /* Validate SupplyChain */,
                      ),
                      icon: Icon(
                        Icons.check,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlockDataViewerWidget(
                              productRef: widget.productRef,
                            ),
                          ),
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        '61147oxk' /* View SupplyChain Data */,
                      ),
                      icon: Icon(
                        Icons.view_carousel,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                  if (!(manageProductProductsRecord.entitityList
                          .toList()
                          ?.contains(currentUserUid)) ??
                      true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.productRef.delete();
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'bfeghgpb' /* Delete Product */,
                        ),
                        icon: Icon(
                          Icons.delete,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 60,
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
