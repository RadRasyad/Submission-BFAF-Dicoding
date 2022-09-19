
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/review_provider.dart';
import 'package:provider/provider.dart';

class ReviewFormPageView extends StatefulWidget {
  const ReviewFormPageView({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ReviewFormPageView> createState() => _ReviewFormPageViewState();
}

class _ReviewFormPageViewState extends State<ReviewFormPageView> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Review'
        ),
        backgroundColor: const Color(0xFFE07465),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 32.0),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Dont Leave it Empty Please';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeName(value);
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeId(widget.id);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusColor: Color(0xFFE07465),
                          labelText: 'Review',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder()),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Dont Leave it Empty Please';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeReview(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE07465),
                          minimumSize: const Size.fromHeight(56),
                      ),
                      onPressed: () {
                        setState(() {
                          _loading = true;
                        });
                        Provider.of<ReviewProvider>(context, listen: false)
                            .createData();
                        Provider.of<ReviewProvider>(context, listen: false)
                            .addReview();

                        Timer(const Duration(seconds: 3), () {
                          _loading = true;
                          Navigator.pop(context);
                        });
                      },
                      child: _loading
                          ? const CircularProgressIndicator(
                        color: Color(0xFFE07465),
                      )
                          : const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}