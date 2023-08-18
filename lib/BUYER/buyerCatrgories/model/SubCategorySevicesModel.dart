// ignore_for_file: file_names

import 'package:login_niche2/utils/flutterflow/flutter_flow_util.dart';
import 'package:login_niche2/utils/flutterflow/form_field_controller.dart';
import 'package:flutter/material.dart';

class SubCategorySevicesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
