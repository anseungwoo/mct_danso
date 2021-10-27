class JonAnimation {
  double jonHeight;
  double jonWidth;
  double msecond;
  double second;
  double pushtop;

  JonAnimation(
      {this.jonHeight,
      this.jonWidth,
      this.msecond,
      this.second,
      this.pushtop}) {
    assert(jonHeight != null, 'jonHeight is empty ');
  }

  void startAnimation() {}

  double plusMSeconds(double msecond) {
    return this.msecond += msecond;
  }

  double resetMseconds() {
    return this.msecond = 0;
  }

  double plusPushTop(double height) {
    return this.pushtop += height;
  }

  double resetPushTop() {
    return this.pushtop = 0.0;
  }
}
