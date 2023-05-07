import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/admin_provider.dart';
import '../utils/widget_function.dart';


class AreacategoryPage extends StatelessWidget {
  static const String routeName = '/areacategoryPage';
  const AreacategoryPage({Key? key}) : super(key: key);

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
                    .addNewCategory(value);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          return provider.AreaCategoryList.isEmpty
              ? const Center(
            child: Text('No category found'),
          )
              : ListView.builder(
            itemCount: provider.AreaCategoryList.length,
            itemBuilder: (context, index) {
              final catModel = provider.AreaCategoryList[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(catModel.areacategoryName,style: TextStyle(fontSize: 23),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
