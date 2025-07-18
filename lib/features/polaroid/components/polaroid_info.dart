import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '/imports.dart';

class PolaroidInfo extends StatefulWidget {
  const PolaroidInfo({
    super.key,
  });

  @override
  State<PolaroidInfo> createState() => _PolaroidInfoState();
}

class _PolaroidInfoState extends State<PolaroidInfo> with SharedState {
  @override
  Widget build(BuildContext context) {
    var dateMask = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return OutlinedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: polaroidSettingsState.description,
                          onChanged: (value) {
                            polaroidSettingsState.setDescription(value);
                          },
                          maxLength: 70,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit_outlined,
                            ),
                            labelText: "Description",
                          ),
                        ),
                        TextFormField(
                          initialValue: polaroidSettingsState.location,
                          onChanged: (value) {
                            polaroidSettingsState.setLocation(value);
                          },
                          maxLength: 35,
                          decoration: const InputDecoration(
                            labelText: "Location",
                            suffixIcon: Icon(Icons.location_on_outlined),
                          ),
                        ),
                        TextFormField(
                          initialValue: polaroidSettingsState.date,
                          onChanged: (value) {
                            polaroidSettingsState.setDate(value);
                          },
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [dateMask],
                          decoration: const InputDecoration(
                            labelText: "Date",
                            suffixIcon: Icon(Icons.date_range),
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Close"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.edit_outlined),
      label: const Text("Edit"),
    );
  }
}
