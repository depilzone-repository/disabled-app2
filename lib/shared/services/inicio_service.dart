import 'dart:developer';

import 'package:flutter_auth/Services/shared_preferences.dart';
import 'package:flutter_auth/shared/globals/data.dart';


Future<bool> fetchDataAndUpdateNotifier(AppProvider provider) async {

  try{
    // Llama a fetchData desde MyModel
    await provider.fetchData();

    bool logged = await getLoginState();
    log('Logged  $logged');

    return true;
  }catch(e){
    return false;
  }

}