class Calculate {
  double height;
  double weight;
  double bmi = 0;
  Calculate({required this.height, required this.weight});

  double calculateBmi() {
    double h = height / 100;
    bmi = weight / (h * h);
    return bmi;
  }
}
