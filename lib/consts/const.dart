import 'dart:io';

import 'package:youtube_api/youtube_api.dart';

var w = 'woddhgfd';
late File image;
late List<YouTubeVideo> results;
late int mainindex;
int contentIndex = 4;
List<String> content = [
  '1: Fold the paper in half lengthwise: Crease well and then unfold.\n\n2: Fold the top corners to the center crease: Forming a triangle.\n\n3: Fold the bottom edge up: Fold it up on both sides of the triangles, making sure they meet the bottom of the triangles.\n\n4: Fold the bottom corners up: Create two small triangles on each side.\n\n5: Open the bottom and fold down the sides: Forming a diamond shape.\n\n6: Fold the bottom edge up: Both the front and back sides should meet at the top point.\n\n7: Pull the sides apart: Open up the paper to form a boat shape.',
  '1: Start with a square paper: Fold it in half diagonally to form a triangle.\n\n2: Fold in half again: To form a smaller triangle.\n\n3: Unfold the previous fold: You now have a crease in the middle.\n\n4: Fold the top corners to the center crease: Forming a diamond shape.\n\n5: Fold the top layer of the bottom edge to the top point: Fold it up.\n\n6: Turn the paper over: The folded edge is now at the bottom.\n\n7: Fold the bottom edge up: To meet the top point.\n\n8: Fold the bottom corners to the top: Forming wings.\n\n9: Fold the entire figure in half vertically: The wings are on the outside.\n\n10: Shape the butterfly: Pull the top wings down to form a butterfly shape. Crease well to hold its shape.',
  '1: Start with a rectangular paper: Fold it in half lengthwise, crease well, and unfold.\n\n2: Fold the top corners to the center crease: Forming triangles.\n\n3: Fold the top triangle down: Fold the top point to the bottom edge.\n\n4: Fold the top sides to the center crease: Forming smaller triangles.\n\n5: Fold the bottom edge up: Fold it up to meet the bottom of the triangles.\n\n6: Fold the bottom corners up: Create two small triangles on each side.\n\n7: Fold the bottom edge up again: To the bottom of the small triangles.\n\n8: Fold the frog in half horizontally: Crease well.\n\n9: Create the legs: Fold the sides back out, forming the frog\'s legs.\n\n10: Make the frog jump: Press down on the back of the frog to make it hop.',
  '1: Start with a square paper: Fold it in half diagonally to form a triangle.\n\n2: Fold the triangle in half: Fold the right corner to the left corner to make a smaller triangle.\n\n3: Unfold the previous fold: You now have a crease in the middle.\n\n4: Fold the left and right corners to the top corner: Forming a diamond shape.\n\n5: Fold the two bottom edges to the center crease: Make sure they meet at the center.\n\n6: Fold the entire figure in half vertically: The folded edges are inside.\n\n7: Create the swan\'s head: Pull the top layer from the pointed end and fold it down to make the head and beak.\n\n8: Shape the swan\'s body: Pull up the neck to form a swan. Crease firmly to hold its shape.'
];
List<String> labels = ['Boat', 'Butterfly', 'Frog', 'Swan'];
