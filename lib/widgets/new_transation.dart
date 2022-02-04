import 'package:flutter/material.dart';

class NewTransations extends StatefulWidget {
  final Function addTx;

  NewTransations(this.addTx);

  @override
  State<NewTransations> createState() => _NewTransationsState();
}

class _NewTransationsState extends State<NewTransations> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
                child: const Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
