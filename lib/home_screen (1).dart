
import 'package:ecommarce2022/size_config.dart';
import 'package:ecommarce2022/sofa_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {


  late double displayHeight = MediaQuery.of(context).size.height;
  late double displayWidth = MediaQuery.of(context).size.width;

  String userName = "";
  final _controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    getSharedPreferenceData();
    // _controller.getAllOrderList();
    _controller.getAllCategoryList();
    // print(_controller.dataOrderList.length.toString()+" hello");

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(userName),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('E-Commerce App',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context,
                        //   MaterialPageRoute(builder: (context) => const ProfileScreen()),
                        // );
                      },
                      child:  CircleAvatar(backgroundImage:NetworkImage('https://video.fdac134-1.fna.fbcdn.net/v/t39.30808-6/276127869_961618618060330_2103909396558561885_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHO6VrDWKHuzf3GgTfL94v_D8hPbV86Ll4PyE9tXzouXhTRsR-x9DJCVoFwZ7aI1HbrrZFd1i2z5k308dhg_C0w&_nc_ohc=3MJdVDKSkW0AX95ieGI&_nc_ht=video.fdac134-1.fna&oh=00_AT8FfUEdxDWaJPaAB1U4ljDAXZ_2OdKXLVmjzn7jGGOz-g&oe=62A6C456',),
                        radius: 25, foregroundColor: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    // height: screenHeight * 0.25,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Categories',
                              style: TextStyle(
                                  fontSize: 20, fontWeight:  FontWeight.bold
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.arrow_right_alt, size: 30),
                            )
                          ],
                        ),
                        Obx((){
                          if(_controller.loadingCategoryList.value){
                            return CircularProgressIndicator();
                          }else{
                            return Container(
                              height: displayHeight * 0.19,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF4EFEF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _controller.dataCategoryList.length,
                                  itemBuilder: (context,index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: displayHeight * 0.10,
                                            width: displayWidth * .20,
                                            child: Center(
                                                child: Image.network("https://happybuy.appsticit.com"+_controller.dataCategoryList[index].categoryImage.toString())
                                            ),
                                          ),
                                          Container(
                                            height: displayHeight * 0.06,
                                            width: displayWidth * .20,
                                            child:  Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(_controller.dataCategoryList[index].name.toString(),
                                                  style: TextStyle(
                                                    fontSize: 15, fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }

                        }),

                      ],
                    ),
                  ),
                  SizedBox(height: displayHeight * 0.02),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF2F5F5),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(indent: 200, endIndent: 200, thickness: 5),
                    SizedBox(height: displayHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Most Popular',
                          style: TextStyle(
                            fontSize: 20, fontWeight:  FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.arrow_right_alt, size: 30),
                        )
                      ],
                    ),
                    SizedBox(height: displayHeight * 0.01),
                    Container(
                      height: displayHeight * 0.8,
                      width: displayWidth,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const SofaDetails())
                              );
                            },
                            child: Container(
                              height: displayHeight * 0.15,
                              width:  displayWidth * 0.25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      'https://cdn-images.article.com/products/SKU25A/2890x1500/image74669.jpg?fit=max&w=1370&q=80&fm=webp',
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text('Andes Sofa',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text("৳ 10000",
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text("৳ 9000")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void getSharedPreferenceData() async{
    UserInfo user = UserInfo();
    await user.getEmail().then((value) {
      setState(() {
        userName = value!;
      });
    });
  }
}

class UserInfo {
  getEmail() {}
}

