
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'Modal/get_all_category_list.dart';
import 'Modal/get_all_product_list.dart';
import 'Modal/get_all_sliders.dart';
import 'Modal/get_all_user_list.dart';
import 'Modal/get_order_list.dart';
import 'Modal/get_order_summary.dart';
import 'load_all_api_data.dart';

class Controller extends GetxController{

  var loadingCategoryList = true.obs;
  var loadingOrderList = true.obs;
  var loadingProductList = true.obs;
  var loadingSliderList = true.obs;
  var loadingUserList = true.obs;
  var loadingOrderSummaryList = true.obs;

  var dataCategoryList = List<GetAllCategoryList>.empty().obs;
  var dataOrderList = List<GetAllOrderList>.empty().obs;
  var dataProductList = List<GetAllProductList>.empty().obs;
  var dataSliderList = List<GetAllSliderList>.empty().obs;
  var dataUserList = List<GetAllUsersList>.empty().obs;
  var dataOrderSummaryList = List<GetAllOrderSummaryList>.empty().obs;

  void init(BuildContext context){
    getAllCategoryList();
    getAllOrderList();
    getAllOrderSummaryList();
    getAllSliderList();
    getAllUserList();
    getAllProductList();
  }

  void getAllCategoryList() async{
    try{
      loadingCategoryList(true).obs;

      var data = await LoadAllApiData.fetchAllCategoryData();

      if(data != null){
        print("Category data retrieved");
        dataCategoryList.value = data ;
      }
    }catch(e){
      print(e.toString()+ "Category Error");
    }finally{
      // Future.delayed(Duration(seconds: 2));
      loadingCategoryList(false).obs;
    }
  }

  getAllOrderList() async{
    try{
      loadingOrderList(true).obs;
      var data = await LoadAllApiData.fetchAllOrderData();

      if(data != null){
        dataOrderList.value = data;
      }
    }catch(e){
      print(e.toString()+" Error");
    }finally{
      loadingOrderList(false).obs;
    }
  }

  getAllProductList() async{
    try{
      loadingProductList(true).obs;
      var data = await LoadAllApiData.fetchAllProductData();

      if(data != null){
        dataProductList.value = data;
      }
    }catch(e){
      print(e);
    }finally{
      loadingProductList(false).obs;
    }
  }

  getAllSliderList() async{
    try{
      loadingSliderList(true).obs;
      var data = await LoadAllApiData.fetchAllSliderData();

      if(data != null){
        dataSliderList.value = data;
      }
    }catch(e){
      print(e);
    }finally{
      loadingSliderList(false).obs;
    }
  }

  getAllUserList() async{
    try{
      loadingUserList(true).obs;
      var data = await LoadAllApiData.fetchAllUserData();

      if(data != null){
        dataUserList.value = data;
      }
    }catch(e){
      print(e);
    }finally{
      loadingUserList(false).obs;
    }
  }

  getAllOrderSummaryList() async{
    try{
      loadingOrderSummaryList(true).obs;
      var data = await LoadAllApiData.fetchAllOrderSummaryData();

      if(data != null){
        dataOrderSummaryList.value = data as List<GetAllOrderSummaryList>;
      }
    }catch(e){
      print(e);
    }finally{
      loadingOrderSummaryList(false).obs;
    }
  }

}