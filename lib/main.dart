import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var SelectedDate = 19;
  var SelectedBarber = 'ALI WISAAM';
  var SelectedTime = '12.30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("HAIR SALOON BOOKING",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black,),
      ),

      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.0,
                left: 15.0,
                right: 15.0,
                child: Container(
                  height: 60.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 20.0,),
                      getDate(19,'Tue'),
                      SizedBox(width: 25.0,),
                      getDate(20,'Wed'),
                      SizedBox(width: 25.0,),
                      getDate(21,'Thu'),
                      SizedBox(width: 25.0,),
                      getDate(22,'Fri'),
                      SizedBox(width: 25.0,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35.0,),
          Center(
            child: Text('HAGORAPT',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.black,
            ),),
          ),
          SizedBox(height: 15.0,),
          Row(
            children: [
              SizedBox(width: 15.0,),
              getService('Beards', 50),
              getService('Crew Cut', 15),
            ],
          ),
          SizedBox(
            height: 15.0,),
          Container(
            height: 180.0,
            child: ListView(
              padding: EdgeInsets.only(right: 15.0,left: 15.0),
              scrollDirection: Axis.horizontal,
              children: [
                getBarber('images/man.jpg', "ASAD"),
                SizedBox(width: 15.0,),
                getBarber('images/five.jpg', "SALMAN"),
                SizedBox(width: 15.0,),
                getBarber('images/model.jpg', "WISAM"),
                SizedBox(width: 15.0,),
              ],
            ),

          ),
          SizedBox(height: 20.0,),
          Positioned(
            top: 120.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 30.0,),
                  getTime('11:00'),
                  SizedBox(width: 25.0,),
                  getTime('12:30'),
                  SizedBox(width: 25.0,),
                  getTime('01:30'),
                  SizedBox(width: 25.0,),
                  getTime('02:30'),
                  SizedBox(width: 25.0,),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child: InkWell(
              onTap: (){},
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.black
              ),
              child: Center(
                child: Text("BOOK",style: TextStyle(color: Colors.white,
                    fontSize: 17.0,fontWeight: FontWeight.bold,letterSpacing: 2.0),),
              ),
            ),
          ),
          ),
        ],
      ),

    );
  }
  Widget getBarber(String imgPath, String nam){
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                selectBarber(nam);
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: getSelectedBarber(nam),
                ),

              ),
            ),
          ],
        ),
        SizedBox(height: 7.0,),
        Text(nam,style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),)
      ],

    );

  }
  selectBarber(nam){
    setState(() {
      SelectedBarber = nam;
    });

  }

  Color getSelectedBarber(nam){
    if(nam == SelectedBarber){
      return Colors.green.withOpacity(0.4);
    }else{
      return Colors.black12;
    }
  }

  Widget getService(String name,int price){
    return Container(
      child: Row(
        children: [
          Text(name,style: TextStyle(color: Colors.black,fontSize: 17.0),),
          SizedBox(width: 5.0,),
          Text('\$' +price.toString(),style: TextStyle(
             fontSize: 17.0,
            color: Colors.grey,
          ),),
          IconButton(icon: Icon(Icons.close), onPressed: (){}),
        ],
      ),
    );
  }

  Widget getTime(String time){
    return AnimatedContainer(duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: SwitchColors(time),
      ),
      height: 60.0,
      width: 60.0,
      child: InkWell(
        onTap: (){
          SelectTime(time);
        },
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                time.toString(),
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: SwitchContentColors(time),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Color SwitchContentColors(time){
    if(time == SelectedTime){
      return Colors.white;
    }else{
      return Colors.black;
    }
  }

  Widget getDate(int date,String day){
    return AnimatedContainer(duration: Duration(milliseconds: 500),
    curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: SwitchColor(date),
      ),
      height: 60.0,
      width: 60.0,
      child: InkWell(
        onTap: (){
          SelectDate(date);
        },
        child: Column(
          children: [
            SizedBox(height: 7.0,),
            Text(
              date.toString(),
              style: TextStyle(
                 fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: SwitchContentColor(date),
              ),
            ),
            Text(
              day.toString(),
              style: TextStyle(
                fontSize: 15.0,
                color: SwitchContentColor(date),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color SwitchContentColor(date){
    if(date == SelectedDate){
      return Colors.white;
    }else{
      return Colors.black;
    }
  }

  Color SwitchColor(date){

    if(date == SelectedDate){
      return Colors.black.withOpacity(0.8);
    }else{
      return Colors.grey.withOpacity(0.2);
    }

  }
  Color SwitchColors(time){

    if(time == SelectedTime){
      return Colors.black.withOpacity(0.8);
    }else{
      return Colors.grey.withOpacity(0.2);
    }

  }


  Widget SelectTime(time){
    setState(() {
      SelectedTime = time;
    });
  }
  Widget SelectDate(date){
    setState(() {
      SelectedDate = date;
    });
  }
}
