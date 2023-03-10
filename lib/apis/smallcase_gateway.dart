import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';
import 'dart:io';
// import 'package:api_to_sqlite_flutter/src/models/smallcase_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/returns_model.dart' hide Smallcase;
import 'package:wealthaccrue/models/smallcase_model.dart' hide Returns;
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';

// import 'package:scgateway_flutter_plugin_example/screens/connect_screen.dart';

class SmallCaseApi {
  // final env = ScgatewayFlutterPlugin.setConfigEnvironment(
  //     GatewayEnvironment.PRODUCTION, "wealthaccrue", true, ['kite']);
  // String authToken = 'wealthaccrue_79d710cd0c124ab09a0dfe6176c2b723';
  // final o = ScgatewayFlutterPlugin.initGateway(
  //     'wealthaccrue_79d710cd0c124ab09a0dfe6176c2b723');
  // final cases = ScgatewayFlutterPlugin.getAllSmallcases();
  
  Future<List<Smallcase>> getAllSmallcases() async {
    // ScgatewayFlutterPlugin.setConfigEnvironment(
    //   GatewayEnvironment.PRODUCTION, "wealthaccrue", true, ['kite']);
    //   ScgatewayFlutterPlugin.initGateway(
    //   'wealthaccrue_79d710cd0c124ab09a0dfe6176c2b723');
      
    final smallcaseUrl = Uri.parse(
        "https://gatewayapi.smallcase.com/v1/gatewaydemo/engine/smallcases?sortBy=default&sortOrder=1&count=10&offset=0");
    // final payload s= {"Accept": "application/json"};
    final headers = {
      "Accept": "application/json",
      "x-gateway-secret": "gatewayDemo_secret",
      "x-gateway-authtoken":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJndWVzdCI6dHJ1ZSwiaWF0IjoxNjU0MzIxMDAwfQ.qiZ_w1yFYXhkdLMlqI28XJOXitfZwr64e2oL-lMEHZU"
    };
    // print(cases);
    final response = await http.get(smallcaseUrl, headers: headers);

    // print("Status Code: " + response.statusCode.toString());
    // print("BODY: " + response.body);
    return modelFromJson(response.body).data!.smallcases! ;
  }

  Future<SmallcaseModel> getSmallcaseModel() async {
    final smallcaseUrl = Uri.parse(
    "https://gatewayapi.smallcase.com/v1/gatewaydemo/engine/smallcases?sortBy=default&sortOrder=1&count=10&offset=0");
    // final payload s= {"Accept": "application/json"};
    final headers = {
      "Accept": "application/json",
      "x-gateway-secret": "gatewayDemo_secret",
      "x-gateway-authtoken":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJndWVzdCI6dHJ1ZSwiaWF0IjoxNjU0MzIxMDAwfQ.qiZ_w1yFYXhkdLMlqI28XJOXitfZwr64e2oL-lMEHZU"
    };
    // print(cases);
    final response = await http.get(smallcaseUrl, headers: headers);

    print("Status Code: " + response.statusCode.toString());
    print("BODY: " + response.body);
    return modelFromJson(response.body) ;
  }

  Future<Holdings> getUserHoldings() async {
    ScgatewayFlutterPlugin.setConfigEnvironment(
      GatewayEnvironment.PRODUCTION, "wealthaccrue", true, ['kite']);
      ScgatewayFlutterPlugin.initGateway(
      'wealthaccrue_79d710cd0c124ab09a0dfe6176c2b723');
      
    final holdingsUrl = Uri.parse(
        "https://gatewayapi.smallcase.com/v1/wealthaccrue/engine/user/holdings?version=v2&mfHoldings=true");
    final headers = {
      "Accept": "application/json",
      "x-gateway-secret": "wealthaccrue_82ff3a1f85bf4ee987d3de4dfe0b27b3",
      "x-gateway-authtoken":
          "wealthaccrue_79d710cd0c124ab09a0dfe6176c2b723"
    };

    final response = await http.get(holdingsUrl, headers: headers);

    // print(response.statusCode);
    // print(response.body);
    return holdingsFromJson(response.body);
    //     .map((smallcase) {
    //   print('Inserting $smallcase');
    // }).toList();
    // final response;
  }

  Future<Returns> getHistoricalReturns(
      String scid, String benchmarkId, String duration) async {
    final returnsUrl = Uri.parse(
        "https://gatewayapi.smallcase.com/v1/gatewayDemo/engine/smallcase/chart?scid=$scid&benchmarkId=$benchmarkId&duration=$duration&base=100");
    final headers = {
      "Accept": "application/json",
      "x-gateway-secret": "gatewayDemo_secret",
      "x-gateway-authtoken":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJndWVzdCI6dHJ1ZSwiaWF0IjoxNjU0MzIxMDAwfQ.qiZ_w1yFYXhkdLMlqI28XJOXitfZwr64e2oL-lMEHZU"
    };

    final response = await http.get(returnsUrl, headers: headers);

    print("Returnd: " + response.statusCode.toString());
    // print(response.body);
    return returnsFromJson(response.body);
    // final response;
  }
}
