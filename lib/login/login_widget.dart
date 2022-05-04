import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../product_listing/product_listing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key key,
    this.userType,
  }) : super(key: key);

  final String userType;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme: IconThemeData(
            color: FlutterFlowTheme.of(context).secondaryBackground),
        automaticallyImplyLeading: true,
        title: Text(
          'Authenticate Yourself',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 20,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Align(
          alignment: AlignmentDirectional(0, -0.45),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Icon(
                        Icons.login,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 150,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 10),
                  child: Container(
                    width: 230,
                    height: 44,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final user = await signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }

                              final usersUpdateData = createUsersRecordData(
                                userType: widget.userType,
                              );
                              await currentUserReference
                                  .update(usersUpdateData);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductListingWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'u8txjrzt' /* Sign in with Google */,
                            ),
                            icon: Icon(
                              Icons.add,
                              color: Colors.transparent,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 230,
                              height: 44,
                              color: Colors.white,
                              textStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Color(0xFF606060),
                                fontSize: 17,
                              ),
                              elevation: 4,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.83, 0),
                          child: Container(
                            width: 22,
                            height: 22,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              isAndroid
                  ? Container()
                  : FFButtonWidget(
                      onPressed: () async {
                        final user = await signInWithApple(context);
                        if (user == null) {
                          return;
                        }

                        final usersUpdateData = createUsersRecordData(
                          userType: widget.userType,
                        );
                        await currentUserReference.update(usersUpdateData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListingWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'ejz0py8u' /* Sign in with Apple */,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.apple,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: 230,
                        height: 44,
                        color: Colors.white,
                        textStyle: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        elevation: 4,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: 12,
                      ),
                    ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 100, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Select App Language:',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              setAppLanguage(context, 'en');
                            },
                            text: 'English',
                            options: FFButtonOptions(
                              width: 100,
                              height: 30,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                          FFButtonWidget(
                            onPressed: () async {
                              setAppLanguage(context, 'hi');
                            },
                            text: 'Hindi',
                            options: FFButtonOptions(
                              width: 100,
                              height: 30,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
