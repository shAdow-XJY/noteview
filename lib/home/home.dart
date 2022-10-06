import 'package:flutter/material.dart';
import 'package:noteview/components/grid_card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var obj = [
    {'filename': '前端-HTML+CSS.docx', 'imageUrl': 'assets/images/html5.png'},
    {'filename': '前端-JavaScript.docx', 'imageUrl': 'assets/images/javascript.png'},
    {'filename': '前端-Vue.docx', 'imageUrl': 'assets/images/vue.png'},
    {'filename': '前端-React.docx', 'imageUrl': 'assets/images/react.png'},
    {'filename': '前端-TS.docx', 'imageUrl': 'assets/images/typescript.png'},
    {'filename': '前端-Flutter.docx', 'imageUrl': 'assets/images/flutter.png'},
    {'filename': '前端-工程化.docx', 'imageUrl': 'assets/images/webpack.png'},
    {'filename': 'a中端笔试-算法代码题汇总.docx', 'imageUrl': 'assets/images/coding.png'},
    {'filename': 'a中端笔试-数据结构.docx', 'imageUrl': 'assets/images/coding.png'},
    {'filename': '中端-Git.docx', 'imageUrl': 'assets/images/git.png'},
    {'filename': '中端-MySQL.docx', 'imageUrl': 'assets/images/mysql.png'},
    {'filename': '中端-计算机网络.docx', 'imageUrl': 'assets/images/network.png'},
    {'filename': '中端-设计模式.docx', 'imageUrl': 'assets/images/design.png'},
    {'filename': '中端-操作系统.docx', 'imageUrl': 'assets/images/os.png'},
    {'filename': 'Personal-PPT.pptx', 'imageUrl': 'assets/images/ppt.png'},
  ];

  int crossAxisCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3E3E61).withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3E3E61),
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'Shadow\'s Readings',
          ),
          actions: <Widget>[
            IconButton(
              icon: const ImageIcon(AssetImage('assets/images/GitHub.png')),
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/shAdow-XJY/noteview'));
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF2E2E48),
            boxShadow: const [BoxShadow()],
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          padding: const EdgeInsets.all(5.0),
          child: ResponsiveBuilder(
              builder: (context, sizingInformation){
                if (sizingInformation.deviceScreenType == DeviceScreenType.mobile){
                  crossAxisCount = 1;
                }else if(sizingInformation.deviceScreenType == DeviceScreenType.tablet){
                  crossAxisCount = 3;
                }
                return GridView.builder(
                    itemCount: obj.length,
                    //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                        crossAxisCount: crossAxisCount,
                        //纵轴间距
                        mainAxisSpacing: 5.0,
                        //横轴间距
                        crossAxisSpacing: 10.0,
                        //子组件宽高长度比例
                        childAspectRatio: 0.9),
                    itemBuilder: (BuildContext context, int index) {
                      //Widget Function(BuildContext context, int index)
                      return GridCard(
                        fileName: obj[index]['filename']??'',
                        imageUrl: obj[index]['imageUrl']??'',
                      );

                    });
              }),

        )
    );
  }
}
