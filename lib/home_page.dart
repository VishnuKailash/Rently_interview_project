import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RENTLY ROUTE MAP",style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click the button below to get the route map ",style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Text(" Kochi → Coimbatore → Madurai → Munnar → Kochi",style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.w500)),
              SizedBox(height: 20,),
              MaterialButton(onPressed: (){},child: Text("Click Me",style: TextStyle(color: Colors.white),),color: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
