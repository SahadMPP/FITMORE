 discoundCalculator(totelPrice) {
    int totel = totelPrice ?? 0;
    dynamic discountedAmount = (5 / 100) * totel;
    return discountedAmount;
  }