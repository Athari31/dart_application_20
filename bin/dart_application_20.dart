import 'dart:io';
import 'category.dart';
import 'movie.dart';
void main() {
  
  Movie movie1 = Movie("Movie 1", 9.99);
  Movie movie2 = Movie("Movie 2", 8.49);
  Movie movie3 = Movie("Movie 3", 7.99);

  Category actionCategory = Category("Action", [movie1, movie2]);
  Category comedyCategory = Category("Comedy", [movie3]);

  List<dynamic> categories = [actionCategory, comedyCategory];

  
  print("Available categories:");
  for (int i = 0; i < categories.length; i++) {
    print("${i + 1}. ${categories[i].name}");
  }
int chosenCategoryIndex = int.parse(
      
      getInput("Enter the number of the category you want to explore:"));

  if (chosenCategoryIndex >= 1 && chosenCategoryIndex <= categories.length) {
    Category chosenCategory = categories[chosenCategoryIndex - 1];

    print("\nMovies in ${chosenCategory.name} category:");
    for (int i = 0; i < chosenCategory.movies.length; i++) {
      print("${i + 1}. ${chosenCategory.movies[i].title}");
    }
    int chosenMovieIndex = int.parse(
        getInput("Enter the number of the movie you want to know the price of:"));

    if (chosenMovieIndex >= 1 &&
        chosenMovieIndex <= chosenCategory.movies.length) {
      Movie chosenMovie = chosenCategory.movies[chosenMovieIndex - 1];

    
      print("\nThe price of ${chosenMovie.title} is \$${chosenMovie.price}");
    } else {
      print("Invalid movie choice.");
    }
  } else {
    print("Invalid category choice.");
  }
}

String getInput(String prompt) {
  print(prompt);
  return stdin.readLineSync() ?? "";
}

