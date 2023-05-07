import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/admin_provider.dart';
import '../utils/widget_function.dart';


class BloodcategoryPage extends StatelessWidget {
  static const String routeName = '/bloodcategoryPage';
  const BloodcategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area category'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
              context: context,
              title: 'Category',
              positiveButtonText: 'ADD',
              onSubmit: (value) {
                Provider.of<AdminProvider>(context, listen: false)
                    .addNewbloodCategory(value);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          return provider.BloodCategoryList.isEmpty
              ? const Center(
            child: Text('No category found'),
          )
              : ListView.builder(
            itemCount: provider.BloodCategoryList.length,
            itemBuilder: (context, index) {
              final catModel = provider.BloodCategoryList[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(catModel.bloodcategoryName,style: TextStyle(fontSize: 23),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
