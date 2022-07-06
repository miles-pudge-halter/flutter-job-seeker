import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/shared/form_inputs.dart';

import '../../shared/buttons.dart';

class ApplyJobPage extends StatelessWidget {
  const ApplyJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionIcon(
                      icon: Icons.arrow_back,
                      onClick: () {
                        Get.back();
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Applying this job',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      _buildCVUploadLayout(),
                      SizedBox(height: 30),
                      Text(
                        'Set your salary range',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: NFQTextField(
                              '2,000',
                              height: 50,
                              inputType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: Text('USD/Month'),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Additional Information',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 10),
                      NFQTextField(
                        '',
                        height: 150,
                        maxLines: 5,
                        inputType: TextInputType.multiline,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: NFQPrimaryButton('Send Application', () {
                  },),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCVUploadLayout() {
    return Container(
      width: double.infinity,
      child: DottedBorder(
        dashPattern: [6, 6, 6],
        padding: EdgeInsets.all(32),
        color: Colors.grey.shade300,
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        strokeWidth: 2,
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.upload_file,
                size: 30,
                color: ThemeColor().yellow,
              ),
              SizedBox(height: 10),
              Text('Upload your CV'),
            ],
          ),
        ),
      ),
    );
  }
}
