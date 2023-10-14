import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post.dart';
import '../../bloc/post_operations/post_opreations_bloc.dart';
import 'CustomBtn.dart';
import 'CustomText.dart';
import 'deleteBtn.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.isUpdate, required this.post});
  final bool isUpdate;
  final Post? post;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initState() {
    super.initState();
    title.text = widget.isUpdate ? widget.post!.title : "";
    body.text = widget.isUpdate ? widget.post!.body : "";
  }

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();
    void _sumbitData() {
      var isValidate = _formKey.currentState!.validate();
      if (isValidate) {
        _formKey.currentState!.save();

        if (widget.isUpdate) {
          BlocProvider.of<PostOpreationsBloc>(context).add(
            UpdatePostEvent(
              post: Post(
                  body: widget.post!.body,
                  id: widget.post!.id,
                  title: widget.post!.title),
            ),
          );
      
        } else {
          BlocProvider.of<PostOpreationsBloc>(context).add(
            AddPostEvent(
              post: Post(body: body.text, title: title.text),
            ),
          );
          
        }
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            children: [
              CustomTextField(
                  controller: title, multiLine: false, title: "Title"),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(controller: body, multiLine: true, title: "Body"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtn(isUpdateBtn:widget.isUpdate, sumbitFun: _sumbitData),
                  widget.isUpdate
                      ? DeleteBtn(id: widget.post!.id!)
                      : MaterialButton(
                          minWidth: 170,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          color: Theme.of(context).colorScheme.background,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
