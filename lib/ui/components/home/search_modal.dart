import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wander_maps/ui/viewmodels/home_viewmodel.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Radio(
                      value: "KEYWORD",
                      groupValue: vm.mode,
                      onChanged: (value) =>
                          vm.handleRadioButton(value.toString()),
                    ),
                    const Text("KEYWORD")
                  ],
                ),
              ),
              Row(
                children: [
                  Radio(
                      value: "GPS",
                      groupValue: vm.mode,
                      onChanged: (value) {
                        vm.handleRadioButton(value.toString());
                      }),
                  const Text("GPS")
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(10, 10))
                  ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: vm.textEditingController,
                    keyboardType:
                        (vm.mode == "KEYWORD") ? null : TextInputType.number,
                    onChanged: (vm.mode == "KEYWORD")
                        ? (value) {
                            if (value.isNotEmpty) {
                              vm.autoCompleteSearch(value);
                            } else {
                              if (vm.predictions.isNotEmpty) {
                                vm.resetPredictions();
                              }
                            }
                          }
                        : (value) {
                            vm.setText(value);
                          },
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        color: Colors.grey[500],
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      hintText: (vm.mode == "KEYWORD") ? '場所を検索' : '緯度経度で検索',
                      hintStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      suffixIcon: (vm.mode == "KEYWORD")
                          ? null
                          : IconButton(
                              onPressed: () => vm.pushGPSSearch(context),
                              icon: const Icon(Icons.search),
                              color: Colors.grey[500],
                            ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: vm.predictions.length, // 検索結果を格納したpredictions配列の長さを指定
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(vm.predictions[index].description.toString()),
                    // 検索結果を表示。descriptionを指定すると場所名が表示されます。
                    onTap: () => vm.pushPrediction(context, index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
