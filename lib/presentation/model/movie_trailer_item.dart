
class TrailerItem {
  String trailerKey;
  String trailerName;
  String trailerSite;
  int trailerSize;


  TrailerItem({
    this.trailerKey,
    this.trailerName,
    this.trailerSite,
    this.trailerSize
  });

  bool isTemporaryUser() => this.trailerKey == -1;
}

extension DomainToPresenationExt on TrailerItem {
  TrailerItem mapToPresentation() => TrailerItem(
    trailerKey: this.trailerKey,
    trailerName: this.trailerName,
    trailerSite: this.trailerSite,
    trailerSize: this.trailerSize,
  );
}
