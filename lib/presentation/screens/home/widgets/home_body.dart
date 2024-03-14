import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/presentation/screens/home/widgets/custom_container.dart';
import 'package:todotask/presentation/screens/home/widgets/drop_down.dart';
import 'package:todotask/presentation/screens/home/widgets/search_container.dart';
import 'package:todotask/utils/controller/home_controller.dart';
import '../../../../utils/constants/ColorManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.controller, super.key});

  final MotionTabBarController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initializeData(context);
  }

  void _initializeData(BuildContext context) async {
    // Fetch initial data
    // final homeController = Provider.of<Controller_Home>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<Controller_Home>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.w_color,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              primary: true,
              pinned: true,
              backgroundColor: ColorManager.b_69,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              actions: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          child: InkWell(
                            onTap: () {
                              // Handle notification icon tap
                            },
                            child: custom_Container(
                              h: 40,
                              w: 40.0,
                              icon: Icons.notifications_active,
                              color_icon: ColorManager.w_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(vertical: 8),
                title: const SearchContainer(),
                background: _buildDropDowns(size, homeController),
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    _buildListView(size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.network(
                      "https://contactcars.fra1.cdn.digitaloceanspaces.com/contactcars-production/Images/Large/UsedCars/org_e294958d-2d6f-4985-9918-f2cbd848ee89.jpeg",
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(height: 20),
                    _buildTable(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDowns(Size size, Controller_Home homeController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width / 1.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Drop_Down_City(
                title: 'أسم المحافظة',
                genderItems: homeController.data_City_json,
              ),
              Drop_Down_Items(
                title: 'الأقسام',
                genderItems: homeController.data_Items_json,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget _buildListView(Size size) {
    return SizedBox(
      height: size.height / 1.1,
      width: size.width / 1.04,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTable() {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            margin: const EdgeInsets.all(20),
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(120.0),
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: const [
                TableRow(
                  children: [
                    Column(
                      children: [
                        Text('Website', style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Tutorial', style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Review', style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
