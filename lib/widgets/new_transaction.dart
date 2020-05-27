import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();

  class _NewTransactionState extends State<NewTransaction> {
    final _titleController = TextEditingController();
    final _amountController = TextEditingController();
    DateTime _selectedDate;

    void _submitData() {
      if(_amountController.text.isEmpty){
        return;
      }
      final enteredTitle = this._titleController.text;
      final enteredAmount = double.parse(this._amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
        return;
      }
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
    }
    void _presentDatePicker() {
      showDatePicker(context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now())
        .then((pickedDate) {
          if(pickedDate === null) {
              return;
        } else {
          setState(() {
            this._selectedDate = pickedDate;
          });
        }
        )};
  }
  
}