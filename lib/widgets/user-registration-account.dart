import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class RegistrationAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Container(
      child: singUpCard(_data, context),
    );
  }

  Widget spacer() {
    return SizedBox(height: 10);
  }

  Widget dateDisplay(String _pickedDate) {
    if (_pickedDate == null) {
      return Text("Date");
    } else {
      return Text(_pickedDate);
    }
  }

  Future _selectDate(
      BuildContext context, StateSetter setState, String pickedDate) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime(2018),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));
    if (picked != null) {
      setState(() => pickedDate = picked.toString());
    }

    // if (picked != null) {
    //   pickedDate = picked.toString();
    //   //_controller.text = picked.toString();
    // }
  }

  Widget singUpCard(StartupScreenData _data, BuildContext context) {
    List<String> _locations = [
      'Some Dropdown',
      'Value 1',
      'Value 2',
      'Value 3',
      'Value 4'
    ];
    String _pickedDate;
    String _loanType;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("Sign-up - (1 of 3)",
                style: Theme.of(context).textTheme.title),
          ),
          spacer(),
          Text(
            "Enter account details",
            style: Theme.of(context).textTheme.subtitle,
          ),
          spacer(),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Account Number", hasFloatingPlaceholder: true),
          ),
          spacer(),

          spacer(),
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      items: _locations.map((String val) {
                        return new DropdownMenuItem<String>(
                          value: val,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              val,
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ),
                        );
                      }).toList(),
                      // hint: Text("Please choose a location"),
                      value: _loanType,
                      onChanged: (newVal) {
                        setState(() => _loanType = newVal);
                        // this.setState(() {};
                      }))),
          // TextFormField(
          //   decoration: InputDecoration(
          //       labelText: "Account Type", hasFloatingPlaceholder: true),
          // ),

          spacer(),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Some Amount", hasFloatingPlaceholder: true),
          ),
          spacer(),
          TextFormField(
            initialValue: _pickedDate == null ? "null" : _pickedDate,
            // enabled: false,
            decoration: InputDecoration(
              labelText: "Some Date",
              hasFloatingPlaceholder: true,
              suffixIcon: IconButton(
                iconSize: 18,
                icon: Icon(Icons.today),
                onPressed: () {
                  setState(() {
                    _selectDate(context, setState, _pickedDate);
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              OutlineButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _data.setStartupScreenMode(StartupScreenMode.LOGIN);
                },
                color: Color(Theme.of(context).primaryColor.value),
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                child: Text("Next"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _data.setStartupScreenMode(StartupScreenMode.SINGUP2OF3);
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}
