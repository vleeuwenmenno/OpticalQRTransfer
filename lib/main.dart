import 'package:flutter/material.dart';
import 'package:opticalqrtransfer/home.dart';

void main()
{
	runApp(HomePage());
}

class HomePage extends StatefulWidget
{
	@override
	HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
	@override
	Widget build(BuildContext context) 
	{
		return MaterialApp(
			initialRoute: '/',
			routes: 
			{
				'/': (context) => Home()
			},
		);
	}
}