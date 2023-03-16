import 'package:flutter/material.dart';
import 'package:goly/models/report.dart';
import 'package:goly/services/report_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:goly/widgets/layout/indicators.dart';

class ReportScreen extends StatefulWidget {
  static const routeName = '/report';
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _messageController = TextEditingController(text: '');
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  void sendMessage() async {
    setState(() {
      isLoading = true;
    });

    await ReportService.sendMessage(
      r: ReportModel(
        uid: Utils.currentUid(),
        errorType: 'Bug',
        message: _messageController.text,
      ),
    );
    setState(() {
      isLoading = false;
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact us'),
      ),
      body: SingleChildScrollView(
          padding: Constants.pagePadding,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Send us a message',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'We appreciate your feedback! \nIf you encounter any bugs or have suggestions on how we can improve the app, please let us know. \nYour opinion is valuable to us as we strive to create the best possible user experience. \n\nThank you for helping us build a great app!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _messageController,
                hintText: 'Message',
                label: 'Message',
                textInputType: TextInputType.multiline,
                maxLines: 10,
              ),
              isLoading
                  ? buffering()
                  : MainButton(
                      text: 'Send',
                      onPressed: sendMessage,
                    ),
            ],
          )),
    );
  }
}
