//package com.green.connect.service;
//
//import java.awt.Image;
//import java.io.FileInputStream;
//
//import org.springframework.stereotype.Service;
//
//import com.google.cloud.vision.v1.AnnotateImageRequest;
//import com.google.cloud.vision.v1.AnnotateImageResponse;
//import com.google.cloud.vision.v1.Feature;
//import com.google.cloud.vision.v1.ImageAnnotatorClient;
//import com.google.protobuf.ByteString;
//
//@Service
//public class VisionService {
//	public String detectText(String imagePath) throws Exception {
//      ByteString imgBytes = ByteString.readFrom(new FileInputStream(imagePath));
//      Image img = Image.newBuilder().setContent(imgBytes).build();
//
//      Feature feature = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
//      AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
//              .addFeatures(feature)
//              .setImage(img)
//              .build();
//
//      try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
//          AnnotateImageResponse response = client.annotateImage(request);
//          return response.getTextAnnotationsList().get(0).getDescription();
//      }
//  }
//}
