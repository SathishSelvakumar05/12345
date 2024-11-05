import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldDropdown extends StatefulWidget {
  final String? currentItem;
  final List<String> items;
  final double width;
  final double? height;
  final ValueChanged<String> chosenValue;
  final String hintText;
  final String labelText;
  final bool isRequiredField;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? iDataLoading;

  const FormFieldDropdown({
    this.currentItem,
    this.iDataLoading = false,
    required this.items,
    required this.width,
    this.height,
    required this.chosenValue,
    this.hintText = "",
    this.labelText = "",
    this.isRequiredField = false,
    this.validator,
    this.controller,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _FormFieldDropdownState createState() => _FormFieldDropdownState();
}

class _FormFieldDropdownState extends State<FormFieldDropdown> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredItems = [];
  bool _showDropdown = false;
  bool isItemSelected = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.currentItem);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _onTextChanged() async {
    if (isItemSelected) return;
    String input = _controller.text;

    if (input.isEmpty) {
      setState(() {
        _showDropdown = false;
        _filteredItems = [];
      });
      return;
    }

    List<String> filtered = widget.items
        .where((item) => item.toLowerCase().contains(input.toLowerCase()))
        .toList();

    setState(() {
      _filteredItems = filtered;
      _showDropdown = filtered.isNotEmpty;
    });
  }

  void _onItemSelected(String item) {
    isItemSelected = true;
    _controller.text = item;
    widget.chosenValue(item);

    setState(() {
      _showDropdown = false;
      _filteredItems = [];
    });

    _focusNode.unfocus();
    Future.delayed(Duration(milliseconds: 10), () {
      isItemSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.labelText,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  if (widget.isRequiredField)
                    TextSpan(
                      text: " *",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                ],
              ),
            ),
          Container(
            constraints: BoxConstraints(minHeight: 55),
            width: widget.width,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: widget.onChanged,
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade50),
                ),
                suffixIcon: widget.iDataLoading!
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CupertinoActivityIndicator(),
                      )
                    : null,
              ),
              validator: widget.validator,
            ),
          ),
          if (_showDropdown)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: widget.width,
                height: 120,
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: _filteredItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index]),
                        onTap: () => _onItemSelected(_filteredItems[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
