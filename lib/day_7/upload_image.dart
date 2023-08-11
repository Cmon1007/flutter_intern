
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageUploading extends StatefulWidget {
  const ImageUploading({Key? key}) : super(key: key);

  @override
  State<ImageUploading> createState() => _ImageUploadingState();
}

class _ImageUploadingState extends State<ImageUploading> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: (){
               _pickImageGallery();
            },
                child: Text("Upload Image"),
            ),
            const SizedBox(width: 10.0,),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(
                child: _selectedImage!=null?Image.file(_selectedImage!,height: 40,width: 50,):Text("Choose Image"),
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
          onPressed: (){
            _pickImageCamera();
          },
          child: Text("Take Image"),
        ),
         const SizedBox(width: 10,),

      ],
    );
  }

  Future _pickImageGallery() async {
    final pickImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickImage==null) return;
    setState(() {
      _selectedImage=File(pickImage.path);
    });
  }
  Future _pickImageCamera()
  async {
    final pickImage= await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickImage==null) return;
    setState(() {
      _selectedImage=File(pickImage.path);
    });
  }
}
