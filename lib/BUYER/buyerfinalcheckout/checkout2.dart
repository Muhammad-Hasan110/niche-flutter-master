import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:login_niche2/BUYER/buyerCheckOut/screen/buyerCheckOutScreen.dart';
import 'package:login_niche2/BUYER/buyerNavbar/navbar_buyer.dart';
import 'package:login_niche2/BUYER/myorders/myorders.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_icon_button.dart';
//mport '/flutter_flow/flutter_flow_theme.dart';
import 'package:login_niche2/utils/flutterflow//flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
import 'package:login_niche2/utils/flutterflow//flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:login_niche2/utils/flutterflow//flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'checkout2_model.dart';
export 'checkout2_model.dart';
import 'orderconfirmationmessage_model.dart';
export 'orderconfirmationmessage_model.dart';

class Checkout2Widget extends StatefulWidget {
  Checkout2Widget({Key? key, required this.pid, required this.sid})
      : super(key: key);
  final String pid, sid;
  @override
  _Checkout2WidgetState createState() => _Checkout2WidgetState();
}

class _Checkout2WidgetState extends State<Checkout2Widget> {
  late Checkout2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = Checkout2Model();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: FlutterFlowIconButton(
                    borderRadius: 30,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                  pid: widget.pid, sid: widget.sid)));
                    },
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                        child: AutoSizeText(
                          'Checkout',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: AutoSizeText(
                          'Select Date & Time for the appointment',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          'When would you like your service?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final _datePicked1Date = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: getCurrentTimestamp,
                              lastDate: DateTime(2050),
                            );

                            if (_datePicked1Date != null) {
                              setState(() {
                                _model.datePicked1 = DateTime(
                                  _datePicked1Date.year,
                                  _datePicked1Date.month,
                                  _datePicked1Date.day,
                                );
                              });
                            }
                          },
                          text: _model.datePicked1 != null
                              ? dateTimeFormat('MMMMEEEEd', _model.datePicked1)
                              : 'Select date',
                          icon: Icon(
                            Icons.chevron_right_sharp,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 400,
                            height: 50,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'DM Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final _datePicked2Time = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(getCurrentTimestamp),
                            );
                            if (_datePicked2Time != null) {
                              setState(() {
                                _model.datePicked2 = DateTime(
                                  getCurrentTimestamp.year,
                                  getCurrentTimestamp.month,
                                  getCurrentTimestamp.day,
                                  _datePicked2Time.hour,
                                  _datePicked2Time.minute,
                                );
                              });
                            }
                          },
                          text: _model.datePicked2 != null
                              ? dateTimeFormat('jm', _model.datePicked2)
                              : 'Select time',
                          icon: Icon(
                            Icons.chevron_right_sharp,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 400,
                            height: 50,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'DM Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.6),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: Color(0xFF8F90A6),
                        size: 24,
                      ),
                      Flexible(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: AutoSizeText(
                            'Thank you for choosing our services application! We\'re excited to assist you with your needs.\n\nPlease be informed that our service operates on a cash payment basis. After the service is completed to your satisfaction, kindly make the payment directly to the service provider in cash.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFF8F90A6),
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showAlignedDialog(
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0, 0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0, 0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  child: OrderconfirmationmessageWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 360,
                        height: 60,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF4F709C),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 8,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderconfirmationmessageWidget extends StatefulWidget {
  const OrderconfirmationmessageWidget({Key? key}) : super(key: key);

  @override
  _OrderconfirmationmessageWidgetState createState() =>
      _OrderconfirmationmessageWidgetState();
}

class _OrderconfirmationmessageWidgetState
    extends State<OrderconfirmationmessageWidget> {
  late OrderconfirmationmessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = OrderconfirmationmessageModel();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0x7057636C),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: AutoSizeText(
                    'Order Confirmation',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                child: Divider(
                  thickness: 1,
                  color: Color(0x5657636C),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 14, 16, 24),
                child: AutoSizeText(
                  'Your Order has been sent to the seller and is awaiting for approval from the seller. You can see your order\'s status in My orders.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 16,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 2),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyordersWidget()));
                        },
                        text: 'Go to Orders',
                        options: FFButtonOptions(
                          width: 110,
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          elevation: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavbarBuyer()));
                        },
                        text: 'OK',
                        options: FFButtonOptions(
                          width: 110,
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          elevation: 2,
                        ),
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
