import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  NewTransaction(this.addNewTransaction);

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleControler,
            onSubmitted: (_) => submitData, //dumping data
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountControler,
            keyboardType:
                TextInputType.numberWithOptions(decimal: true, signed: false),
            onSubmitted: (_) => submitData, //dumping data
          ),
          FlatButton(
            child: Text(
              "Add Transaction",
              // style: TextStyle(color: Colors.purple), alternative
            ),
            textColor: Colors.purple,
            onPressed: submitData,
          )
        ],
      ),
    );
    ;
  }
}
