import 'package:blood_donate_app/admin/model/area_catagory_model.dart';
import 'package:blood_donate_app/admin/model/blood_catagory_model.dart';
import 'package:blood_donate_app/admin/pages/developer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../admin/pages/launcharpage.dart';
import '../../provider/admin_provider.dart';
import '../customwidgets/donar_grid_item.dart';
import 'donar_launcharpage.dart';

class ViewDonorList extends StatefulWidget {
  static const String routeName = '/viewDonorList';

  const ViewDonorList({Key? key}) : super(key: key);

  @override
  State<ViewDonorList> createState() => _ViewDonorListState();
}

class _ViewDonorListState extends State<ViewDonorList> {
  AreaCategoryModel? areaCategoryModel;
  BloodCategoryModel? bloodCategoryModel;

  @override
  void didChangeDependencies() {
    Provider.of<AdminProvider>(context,listen: false).getAllAreaCategories();
    Provider.of<AdminProvider>(context,listen: false).getAllBloodCategories();
    Provider.of<AdminProvider>(context, listen: false).getAllDonor();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/4,
              decoration:const BoxDecoration(
                color: Colors.blue
              ) ,
            ),
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          children: const [
                            Icon(Icons.person,size: 25,color: Colors.blue,),
                            SizedBox(width: 15,),
                            Text('Profile',style: TextStyle(fontSize: 25),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, LauncherPage.routeName);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.admin_panel_settings,size: 25,color: Colors.blue,),
                            SizedBox(width: 15,),
                            Text('Admin Panal',style: TextStyle(fontSize: 25),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Developer.routeName);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.warning_amber,size: 25,color: Colors.blue,),
                            SizedBox(width: 15,),
                            Text('Developer',style: TextStyle(fontSize: 25),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  // ElevatedButton(onPressed: (){}, child: const  Text('Register'))
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, DonarLauncherPage.routeName);
                        },
                        child: const Text(
                          'Donor',
                          style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
                expandedHeight: MediaQuery.of(context).size.height / 2.7,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text(
                    '+ Donate Blood',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  background: ListView(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Select Location',style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<AreaCategoryModel>(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          hint: const Text('Select Category'),
                          value: areaCategoryModel,
                          isExpanded: true,
                          items: provider
                              .getAreaListForFiltering()
                              .map((_areaModel) => DropdownMenuItem(
                                  value: _areaModel,
                                  child: Text(_areaModel.areacategoryName)))
                              .toList(),
                          focusColor: Colors.black87,
                          onChanged: (_value) {
                            setState(() {
                              areaCategoryModel = _value;
                            });
                            if (areaCategoryModel!.areacategoryName == 'All') {
                              provider.getAllDonor();
                            } else {
                              provider.getAllDonorByAreaCategory(areaCategoryModel!);
                            }
                          },
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Select Blood Group',style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<BloodCategoryModel>(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          hint: const Text('Select Category'),
                          value: bloodCategoryModel,
                          isExpanded: true,
                          items: provider
                              .getBloodListForFiltering()
                              .map((_bloodModel) => DropdownMenuItem(
                              value: _bloodModel,

                              child: Text(_bloodModel.bloodcategoryName)))
                              .toList(),
                          focusColor: Colors.black87,
                          onChanged: (value) {
                            setState(() {
                              bloodCategoryModel = value;
                            });
                            if (bloodCategoryModel!.bloodcategoryName == 'All') {
                              provider.getAllDonor();

                            } else {
                              provider.getAllDonorByBloodCategory(bloodCategoryModel!);
                            }
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: DropdownButtonFormField<AreaCategoryModel>(
                      //     decoration: InputDecoration(
                      //       fillColor: Colors.white,
                      //       filled: true,
                      //     ),
                      //     hint: const Text('Select Category'),
                      //     value: bloodCategoryModel,
                      //     isExpanded: true,
                      //     items: provider
                      //         .getAreaListForFiltering()
                      //         .map((_areaModel) => DropdownMenuItem(
                      //         value: _areaModel,
                      //         child: Text(_areaModel.areacategoryName)))
                      //         .toList(),
                      //     focusColor: Colors.black87,
                      //     onChanged: (_value) {
                      //       setState(() {
                      //         areaCategoryModel = _value;
                      //       });
                      //       if (areaCategoryModel!.areacategoryName == 'All') {
                      //         provider.getAllDonor();
                      //       } else {
                      //         provider.getAllDonorByAreaCategory(areaCategoryModel!);
                      //       }
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: provider.DonorList.length,
                  (context, index) {
                    final donor = provider.DonorList[index];
                    return DonorGridItemView(donarModel: donor);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
