import 'dart:io';

import 'package:flutter/material.dart';
import 'package:opticalqrtransfer/widgets/detailedButton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Home extends StatefulWidget
{
	@override
	HomeState createState() => HomeState();
}

class HomeState extends State<Home>
{
	List<Widget> _qrCodes  = List<Widget>();

	Future<void> requestPermission() async
	{
		PermissionStatus res = await SimplePermissions.requestPermission(Permission.ReadExternalStorage);

		if (res == PermissionStatus.authorized)
		{
			
		}		
	}

	@override
	void initState()
	{
		super.initState();
		requestPermission();
	}

	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			body: Stack(
				children: <Widget>
				[
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: _qrCodes
					),

					Column(
						mainAxisAlignment: MainAxisAlignment.end,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>
						[
							Padding(
								padding: const EdgeInsets.all(16.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>
									[
										DetailedButton(
											controller: DetailedButtonController(enabled: true),
											child: "Send file",
											width: (MediaQuery.of(context).size.width / 100) * 33,
											onPressed: () async
											{
												File file = await FilePicker.getFile(type: FileType.ANY);
												List<int> bytes = await file.readAsBytes();
											}
										),

										Padding(padding: const EdgeInsets.all(16.0)),

										DetailedButton(
											controller: DetailedButtonController(enabled: true),
											child: "Receive file",
											width: (MediaQuery.of(context).size.width / 100) * 33,
											onPressed: ()
											{
												
											}
										)
									],
								),
							)
						],
					)
				],
			),
		);
	}
}