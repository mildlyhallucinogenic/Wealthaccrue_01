import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';






class ApiService {
  int index = 0;
  
  var elssFunds = {
    "idfc-tax-advantage-elss-fund-direct-growth":
        "https://api.mfapi.in/mf/118473",
    "mirae-asset-tax-saver-fund-direct-growth":
        "https://api.mfapi.in/mf/135781",
    "canara-robeco-equity-taxsaver-direct-growth":
        "https://api.mfapi.in/mf/118285",
    "dsp-tax-saver-fund-direct-growth": "https://api.mfapi.in/mf/119242",
    "kotak-taxsaver-direct-growth": "https://api.mfapi.in/mf/119773",
    "uti-long-term-equity-fund-tax-saving-direct-growth":
        "https://api.mfapi.in/mf/120715",
    "tata-india-tax-savings-fund-direct-growth":
        "https://api.mfapi.in/mf/132756",
    "axis-long-term-equity-fund-direct-growth":
        "https://api.mfapi.in/mf/120503",
    "icici-prudential-long-term-equity-fund-tax-saving-direct-growth":
        "https://api.mfapi.in/mf/120592",
    "motilal-oswal-most-focused-long-term-fund-direct-growth":
        "https://api.mfapi.in/mf/133386",
  };


  Future getMutualFund() async {
    final mutualFundUrl = Uri.parse(elssFunds.values.elementAt(index));
    final response = await http.get(mutualFundUrl);
    List responseList = [];
    
    Map<String, dynamic> map =
    jsonDecode(response.body) as Map<String, dynamic>;
    for (var item in elssFunds.entries) {
      var mutualFundUrl = Uri.parse(elssFunds.values.elementAt(index));
      var response = await http.get(mutualFundUrl);
      responseList.insert(index++, response.body);
      debugPrint(responseList[index - 1]);
    }
    
    return responseList;
  }
}
