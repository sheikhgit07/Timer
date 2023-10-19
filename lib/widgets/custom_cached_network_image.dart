import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilites/colors.dart';
import 'custom_image.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? url;
  final String? placeHolderImg;
  Color? placeHolderImgColor;
  final double? width;
   double? height;
   String? screenName;
  BoxFit? fit;
  bool?isBoxFit;
  bool? isNewSize;
  CustomCachedNetworkImage({
    this.url,
    this.placeHolderImg,
    this.placeHolderImgColor,
    this.width ,
    this.height,
    this.screenName,
    this.fit,
    this.isNewSize,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "$url",
        fit:fit?? BoxFit.fill,
        width: double.infinity,
        imageBuilder: (context, imageProvider) {
          return isNewSize==true&&imageProvider!=null?
               Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.network(
                       url!,
                      // width: 300,
                      height: height,
                      fit:BoxFit.fill

                  ),
                ),
              ],
            )
            :
            Container(decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit:fit?? BoxFit.fill)));
        },
        placeholder: (context, url) =>
        screenName=="news"|| screenName=="detail"?SpinKitThreeInOut(
            color: kLightergrayColor, size: 30.0)
            :
        CustomImage(placeHolderImg: placeHolderImg,placeHolderImgColor: placeHolderImgColor,),
        errorWidget: (context, url, error) =>
        screenName=="news"|| screenName=="detail"?SpinKitThreeInOut(
            color: kLighterGrayColor, size: 30.0)
            :
        CustomImage(placeHolderImg: placeHolderImg,placeHolderImgColor: placeHolderImgColor,),
      ),
    );
  }
}
