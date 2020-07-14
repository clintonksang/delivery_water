import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_del/provider/database_provider.dart';
import 'package:water_del/utilities/global/dialogs.dart';
import 'package:water_del/utilities/styles.dart';

class SetPhoneWidget extends StatefulWidget {
  final FirebaseUser user;
  SetPhoneWidget({@required this.user});
  @override
  _SetPhoneWidgetState createState() => _SetPhoneWidgetState();
}

class _SetPhoneWidgetState extends State<SetPhoneWidget> {
  final _formKey = GlobalKey<FormState>();

  final DatabaseProvider _db = DatabaseProvider();

  static String _phone;

  bool _isClient = true;

  handlePhone(String value) {
    _phone = value.trim();
    print('Phone -> $_phone');
  }

  String validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please provide a phone number';
    }
    if (value.length != 10) {
      return 'Phone number should be 10 digits';
    }
    return null;
  }

  Widget _phoneField() {
    return TextFormField(
      validator: validatePhone,
      autofocus: false,
      onSaved: handlePhone,
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Phone',
          labelStyle: normalOutlineBlack),
    );
  }

  Widget _cancelButton() {
    return FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(
          'CANCEL',
          style: boldOutlineRed,
        ));
  }

  void setPhoneBtnPressed() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      _db
          .updatePhoneandStatus(widget.user.uid, _phone, _isClient)
          .then((value) {
        Navigator.of(context).pop();
        dialogInfo(context, 'Your profile has been updated successfully');
      }).catchError((error) {
        Navigator.of(context).pop();
        dialogInfo(context, error.toString());
      });
    }
  }

  Widget _addButton() {
    return FlatButton(
        onPressed: setPhoneBtnPressed,
        child: Text(
          'SET',
          style: boldOutlineGreen,
        ));
  }

  Widget _setClientStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          _isClient ? 'Client' : 'Supplier',
          style: normalOutlineBlack,
        ),
        Checkbox(
          value: _isClient,
          onChanged: (value) {
            setState(() {
              _isClient = value;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          'Please update your profile',
          style: normalOutlineBlack,
        ),
      ),
      content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _phoneField(),
              SizedBox(
                height: 10,
              ),
              _setClientStatus()
            ],
          )),
      actions: [
        _cancelButton(),
        _addButton(),
      ],
    );
  }
}
