import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Modal/get_all_category_list.dart';
import 'Modal/get_all_product_list.dart';
import 'Modal/get_all_sliders.dart';
import 'Modal/get_all_user_list.dart';
import 'Modal/get_order_list.dart';
import 'Modal/get_order_summary.dart';

class LoadAllApiData{

  static Future<List<GetAllOrderList>?> fetchAllOrderData() async{
    var url = Uri.parse("https://happybuy.appsticit.com/orders");
    var heroResponse = await http.get(url,
        headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);
      print(convertData +" Done");
      return getOrderListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllCategoryList>?> fetchAllCategoryData() async{
    var url = Uri.parse("https://happybuy.appsticit.com/getallcategory");
    var heroResponse = await http.get(url,headers: {"Content-Type": "application/json"});
    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData + " hello");
      return getAllCategoryListFromJson(convertData);
    }

    return null;
  }

  static Future<List<GetAllProductList>?> fetchAllProductData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallproductdata");
    var heroResponse = await http.get(url,headers: {"Content-Type": "application/json"});
    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);
      return getAllProductListFromJson(convertData);
    }

    return null;
  }

  static Future<List<GetAllSliderList>?> fetchAllSliderData() async{
    var url = Uri.parse("https://happybuy.appsticit.com/getallsliders");
    var heroResponse = await http.get(url,headers: {"Content-Type": "application/json"});
    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);
      return getAllSliderListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllUsersList>?> fetchAllUserData() async{
    var url = Uri.parse("https://happybuy.appsticit.com/allUserList");
    var heroResponse = await http.get(url,headers: {"Content-Type": "application/json"});
    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);
      return getAllUsersListFromJson(convertData);
    }
    return null;
  }

  static Future<GetAllOrderSummaryList?> fetchAllOrderSummaryData() async{
    var url = Uri.parse("https://happybuy.appsticit.com/orders");
    var heroResponse = await http.get(url,headers: {"Content-Type": "application/json"});
    if(heroResponse.statusCode == 200){
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);
      return getAllOrderSummaryFromJson(convertData);
    }
    return null;
  }

}