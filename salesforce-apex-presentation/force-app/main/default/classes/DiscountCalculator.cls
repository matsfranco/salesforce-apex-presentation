public with sharing class DiscountCalculator {

    private Opportunity opp;
    public Discount discount;

    public DiscountCalculator(Opportunity opp) {
        this.opp = opp;
        this.discount = DiscountFactory.getDiscount(opp.amount);
    }

    public Decimal discountOpportunity() {
        Decimal result = discount.calculateDiscount(this.opp.Amount);
        return result;
    }

}
