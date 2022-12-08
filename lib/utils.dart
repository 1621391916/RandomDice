import 'package:flutter/material.dart';

dynamic getImageFromPathOrUrl(String url){
  dynamic img;
  if (url.startsWith('http')){
    img = NetworkImage(url);
  } else{
    img = AssetImage(url);
  }

  return img;
}


Color X_backgroundColor = const Color(0xffdeecdb);
