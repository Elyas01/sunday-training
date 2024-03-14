public  class AccConAndOppOpperations {
  public static Decimal closedWonOppsAmount() {
    Decimal totalAmount= 0;
    List<Opportunity> listopp=[Select id, Name, StageName, Amount 
                                From opportunity 
                                where stageName='Closed Won'];
    for ( Opportunity opp : listOpp) {
        system.debug(opp)
        totalAmount = totalAmount +opp.Amount;
    }return totalAmount;
  }
}