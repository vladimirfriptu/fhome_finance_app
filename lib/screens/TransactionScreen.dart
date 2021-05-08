import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/CategoryModel.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_app/utils/DateTimeUtil.dart';
import 'package:flutter_app/widgets/CategoriesModalBottomSheet.dart';
import 'package:flutter_app/widgets/ReadonlyTextField.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  String screenTitle = 'Создание транзакции';

  TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreen createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen> {
  final TextEditingController _categoryFieldController =
      TextEditingController();
  final TextEditingController _dateFieldController = TextEditingController();
  final TextEditingController _cacheFieldController = TextEditingController();
  CategoryModel _activeCategory;
  DateTime _activeDate = DateTime.now();
  bool _isValidForm = false;

  selectElement(CategoryModel category) {
    setState(() {
      _activeCategory = category;
    });
    _categoryFieldController.text = category.name;
    CategoriesModalBottomSheet.closeModal(context);
    validate();
  }

  Future<void> openDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _activeDate,
        firstDate: DateTime(now.year),
        lastDate: now);

    if (DateTimeUtil.isMatchToday(matchDate: date))
      _dateFieldController.text = 'Сегодня';
    else
      _dateFieldController.text = DateFormat('dd MMM').format(date);

    setState(() {
      _activeDate = date;
    });

    validate();
  }

  void submitForm() {
    print(_activeCategory.name);
    print(_activeDate);
    print(_cacheFieldController.text);
  }

  void validate() {
    setState(() {
      _isValidForm = _activeDate != null && _activeDate != null;
    });
  }

  @override
  void initState() {
    _dateFieldController.text = 'Сегодня';
    super.initState();
  }

  @override
  void dispose() {
    _categoryFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.screenTitle}"),
      ),
      body: StoreConnector<AppState, List<CategoryModel>>(
          converter: (store) => store.state.categories,
          builder: (context, categories) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    ReadonlyTextField(
                      controller: _categoryFieldController,
                      icon: Icons.calendar_today,
                      label: 'Категория',
                      space: 15.0,
                      onTap: () {
                        CategoriesModalBottomSheet.showSheetModal(
                            context: context,
                            categories: categories,
                            onSelectElement: selectElement);
                      },
                    ),
                    ReadonlyTextField(
                      controller: _dateFieldController,
                      label: 'Дата',
                      icon: Icons.calendar_today_outlined,
                      onTap: openDatePicker,
                      space: 15.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _cacheFieldController,
                        decoration: InputDecoration(
                            labelText: "Сумма",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.attach_money)),
                      ),
                    ),
                  ],
                ),
              )),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context)),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: _isValidForm ? submitForm : null,
                color: _isValidForm ? Colors.white : Colors.white24,
              )
            ],
          ),
        )
      ],
    );
  }
}
